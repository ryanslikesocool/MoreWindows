import SwiftUI

/// A view displaying the app's version number.
///
/// Change the appearance by setting environment values using ``SwiftUICore/View/appVersionOptions(_:)``.
///
/// ## Topics
/// - ``AppVersionOptions``
///
/// ## See Also
/// - ``AppVersionLabel``
public struct AppVersionView: View {
	@Environment(\.appVersionOptions) private var appVersionOptions: AppVersionOptions
	@State private var isHovering: Bool = false

	private let iconEdge: HorizontalEdge
	private let hoverAnimation: Animation

	public nonisolated init(
		iconEdge: HorizontalEdge = .trailing,
		hoverAnimation: Animation = .easeOut(duration: 0.15)
	) {
		self.iconEdge = iconEdge
		self.hoverAnimation = hoverAnimation
	}

	public var body: some View {
		if let appVersion = Bundle.main.appVersion(
			includeBundleVersion: appVersionOptions.contains(.showBuildNumber)
		) {
			if appVersionOptions.contains(.copyable) {
				makeButton(appVersion)
			} else {
				makeLabel(appVersion)
			}
		}
	}
}

// MARK: - Constants

private extension AppVersionView {
	static let systemImageName: String = "doc.on.clipboard"

	static var unfocusedForegroundStyle: HierarchicalShapeStyle { .tertiary }
	static var focusedForegroundStyle: HierarchicalShapeStyle { .secondary }
}

// MARK: - Supporting Views

private extension AppVersionView {
	func makeButton(_ appVersion: String) -> some View {
		Button {
			copyVersionToPasteboard(version: appVersion)
		} label: {
			makeLabel(appVersion)
		}
		.buttonStyle(.plain)
		.onHover(perform: onHoverAction)
	}

	func makeLabel(_ appVersion: String) -> some View {
		let iconHorizontalAlignment: HorizontalAlignment = iconEdge.horizontalAlignment
		let oppositeIconHorizontalAlignment: HorizontalAlignment = iconEdge.inverseHorizontalAlignment
		let iconAlignment: Alignment = Alignment(horizontal: iconHorizontalAlignment, vertical: .center)

		return Text(verbatim: appVersion)
			.overlay(alignment: iconAlignment) {
//				if isHovering {
				Image(systemName: Self.systemImageName)
					.opacity(isHovering ? 1 : 0)
					.alignmentGuide(iconHorizontalAlignment) { d in
						d[oppositeIconHorizontalAlignment]
					}
//						.transition(.opacity.animation(.interactiveSpring))
//				}
			}
			.foregroundStyle(isHovering ? Self.focusedForegroundStyle : Self.unfocusedForegroundStyle)
			.monospaced()
	}
}

// MARK: - Functions

private extension AppVersionView {
	func onHoverAction(newValue: Bool) {
		withAnimation(hoverAnimation) {
			isHovering = newValue
		}
	}

	func copyVersionToPasteboard(version: String) {
		let applicationName = Bundle.main.bundleName
		let copyString: String = "\(applicationName) \(version)"

		NSPasteboard.general.clearContents()
		NSPasteboard.general.setString(copyString, forType: .string)
	}
}
