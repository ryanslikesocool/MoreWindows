import AppKit
import OSLog
import SwiftUI

struct OnWindowAppearModifier: ViewModifier {
	typealias Action = (NSWindow) -> Void

	@Environment(\.windowReference) private var windowReference

	private let action: Action

	init(perform action: @escaping Action) {
		self.action = action
	}

	func body(content: Content) -> some View {
		content
			.onAppear(perform: onViewAppear)
	}

	private func onViewAppear() {
		DispatchQueue.main.async {
			guard let windowReference else {
				Logger.module.warning("The environment value `windowReference` was not defined.  The action provided by cannot be \(Self.self) cannot be executed.")
				return
			}
			guard let nsWindow = windowReference.value else {
				Logger.module.warning("Cannot find \(NSWindow.self) with ID \(windowReference.id).  The window button modes cannot be applied.")
				return
			}

			action(nsWindow)
		}
	}
}

// MARK: - View+

public extension View {
	/// Adds an action to perform after this view is added to an `NSWindow`.
	/// - Parameter action: The action to perform. If action is `nil`, the call has no effect.
	/// - Returns: A view that triggers `action` after it is added to an `NSWindow`.
	@ViewBuilder func onWindowAppear(perform action: ((NSWindow) -> Void)?) -> some View {
		if let action {
			modifier(OnWindowAppearModifier(perform: action))
		} else {
			self
		}
	}
}
