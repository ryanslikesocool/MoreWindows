import SwiftUI

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
#if canImport(AppKit)
					.onHover { state in
						withAnimation(.easeOut(duration: 0.15)) {
							isHovering = state
						}
					}
#endif

			} else {
				label(appVersion)
			}
		}
	}
}

private extension AppVersionView {
	@ViewBuilder private func label(_ appVersion: String) -> some View {
		Text(appVersion)
			.overlay(alignment: .trailing) { clipboardIcon }
			.foregroundStyle(isHovering ? .secondary : .tertiary)
			.monospaced()
	}

	private var clipboardIcon: some View {
		Image(systemName: "doc.on.clipboard")
#if canImport(AppKit)
			.opacity(isHovering ? 1 : 0)
#endif
			.offset(x: 20)
	}
}

private extension AppVersionView {
	func copyVersionToPasteboard(version: String) {
		let copyString: String = "\(AppInformation.appName) \(version)"

#if canImport(AppKit)
		NSPasteboard.general.clearContents()
		NSPasteboard.general.setString(copyString, forType: .string)
#elseif canImport(UIKit)
		UIPasteboard.general.string = copyString
#endif
	}
}
