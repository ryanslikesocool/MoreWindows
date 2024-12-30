import SwiftUI

/// A view displaying the app's version number.
///
/// Change the appearance by setting environment values using ``SwiftUI/View/appVersionOptions(_:)``.
/// 
/// - SeeAlso:
///   - ``AppVersionOptions``
///   - ``SwiftUI/View/appVersionOptions(_:)``
///   - ``SwiftUI/Scene/appVersionOptions(_:)``
public struct AppVersionView: View {
	@Environment(\.appVersionOptions) private var appVersionOptions: AppVersionOptions
	@State private var isHovering: Bool = false

	private let iconEdge: HorizontalEdge
	private let hoverAnimation: Animation

	nonisolated public init(
		iconEdge: HorizontalEdge = .trailing,
		hoverAnimation: Animation = .easeOut(duration: 0.15)
	) {
		self.iconEdge = iconEdge
		self.hoverAnimation = hoverAnimation
	}

	public var body: some View {
		if let appVersion = Bundle.main.appVersion(includeBundleVersion: appVersionOptions.contains(.showBuildNumber)) {
			if appVersionOptions.contains(.copyable) {
				makeButton(appVersion)
			} else {
				makeLabel(appVersion)
			}
		}
	}
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
		let iconHorizontalAlignment: HorizontalAlignment = switch iconEdge {
			case .leading: .leading
			case .trailing: .trailing
		}
		let oppositeIconHorizontalAlignment: HorizontalAlignment = switch iconEdge {
			case .leading: .trailing
			case .trailing: .leading
		}
		let iconAlignment: Alignment = Alignment(horizontal: iconHorizontalAlignment, vertical: .center)

		return Text(appVersion)
			.overlay(alignment: iconAlignment) {
				Image(systemName: "doc.on.clipboard")
					.opacity(isHovering ? 1 : 0)
					.alignmentGuide(iconHorizontalAlignment) { d in
						d[oppositeIconHorizontalAlignment]
					}
			}
			.foregroundStyle(isHovering ? .secondary : .tertiary)
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
		let copyString: String = "\(Bundle.main.bundleName) \(version)"

		NSPasteboard.general.clearContents()
		NSPasteboard.general.setString(copyString, forType: .string)
	}
}
