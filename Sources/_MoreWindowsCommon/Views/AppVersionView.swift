import SwiftUI

/// A view displaying the app's version number.
///
/// Change the appearance by setting environment values using ``appVersionOptions(_:)``.
/// - SeeAlso: 
///   - ``AppVersionOptions``
public struct AppVersionView: View {
	@Environment(\.appVersionOptions) private var appVersionOptions: AppVersionOptions
	@State private var isHovering: Bool = false

	public init() { }

	public var body: some View {
		if let appVersion = AppInformation.appVersion(includeBuild: appVersionOptions.contains(.showBuildNumber)) {
			if appVersionOptions.contains(.copyable) {
				Button(action: { copyVersionToPasteboard(version: appVersion) }) {
					label(appVersion)
				}
				.buttonStyle(.plain)
				.onHover { state in
					withAnimation(.easeOut(duration: 0.15)) {
						isHovering = state
					}
				}

			} else {
				label(appVersion)
			}
		}
	}
}

private extension AppVersionView {
	private func label(_ appVersion: String) -> some View {
		Text(appVersion)
			.overlay(alignment: .trailing) { clipboardIcon }
			.foregroundStyle(isHovering ? .secondary : .tertiary)
			.monospaced()
	}

	private var clipboardIcon: some View {
		Image(systemName: "doc.on.clipboard")
			.opacity(isHovering ? 1 : 0)
			.offset(x: 20)
	}
}

private extension AppVersionView {
	func copyVersionToPasteboard(version: String) {
		let copyString: String = "\(AppInformation.appName) \(version)"

		NSPasteboard.general.clearContents()
		NSPasteboard.general.setString(copyString, forType: .string)
	}
}
