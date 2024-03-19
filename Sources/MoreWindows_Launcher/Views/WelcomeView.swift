#if canImport(AppKit)
import MoreWindowsCommon
import SwiftUI

struct WelcomeView: View {
	@Environment(\.launcherOptions) private var launcherOptions
	@State private var hoveringOnVersion: Bool = false

	var body: some View {
		VStack {
			if launcherOptions.contains(.showIcon) {
				AppIconView()
			}

			if launcherOptions.contains(.showName) {
				Text(AppInformation.appName)
					.font(.largeTitle.bold())
			}

			if launcherOptions.contains(.showVersion), let version = AppInformation.appVersion {
				Button(action: { copyVersionToPasteboard(version: version) }) {
					Text(version)
						.opacity(hoveringOnVersion ? 1 : 0.5)
						.overlay(alignment: .trailing) {
							Image(systemName: "doc.on.clipboard")
								.opacity(hoveringOnVersion ? 1 : 0)
								.offset(x: 20)
						}
				}
				.onHover { state in
					withAnimation(.easeOut(duration: 0.15)) {
						hoveringOnVersion = state
					}
				}
				.monospaced()
				.padding(.top, -8)
				.buttonStyle(.plain)
			}
		}
	}
}

private extension WelcomeView {
	func copyVersionToPasteboard(version: String) {
		NSPasteboard.general.clearContents()
		NSPasteboard.general.setString("\(AppInformation.appName) \(version)", forType: .string)
	}
}
#endif
