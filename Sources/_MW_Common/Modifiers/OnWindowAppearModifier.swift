import AppKit
import OSLog
import SwiftUI

private struct OnWindowAppearModifier: ViewModifier {
	typealias Action = (NSWindow) -> Void

	@Environment(\.windowID) private var windowID

	private let action: Action

	public init(perform action: @escaping Action) {
		self.action = action
	}

	public func body(content: Content) -> some View {
		content
			.onAppear(perform: onViewAppear)
	}
}

// MARK: - Functions

private extension OnWindowAppearModifier {
	func onViewAppear() {
		DispatchQueue.main.async {
			guard let windowID else {
				Logger.module.warning("""
				The environment value `windowReference` was not defined.
				The action provided by cannot be \(Self.self) cannot be executed.
				""")
				return
			}
			guard let nsWindow = windowID.window else {
				Logger.module.warning("""
				Cannot find \(NSWindow.self) with ID \(windowID.id).
				The window button modes cannot be applied.
				""")
				return
			}

			action(nsWindow)
		}
	}
}

// MARK: - Convenience

public extension View {
	/// Adds an action to perform after this view is added to an
	/// [`NSWindow`]( https://developer.apple.com/documentation/appkit/nswindow ).
	///
	/// - Remark: This view modifier requires that a ``SwiftUI/Scene/windowID(_:)-5gt9k`` modifier was used on the containing scene.
	///
	/// - Parameter action: The action to perform. If action is `nil`, the call has no effect.
	/// - Returns: A view that triggers `action` after it is added to an
	/// [`NSWindow`]( https://developer.apple.com/documentation/appkit/nswindow ).
	@ViewBuilder
	func onWindowAppear(perform action: ((NSWindow) -> Void)?) -> some View {
		if let action {
			modifier(OnWindowAppearModifier(perform: action))
		} else {
			self
		}
	}
}
