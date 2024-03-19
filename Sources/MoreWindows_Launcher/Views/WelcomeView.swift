#if canImport(AppKit)
import LoveCore
import SwiftUI

@available(macOS 14, *)
struct WelcomeView: View {
	@Environment(\.launcherOptions) private var launcherOptions
	@State private var hoveringOnVersion: Bool = false

	var body: some View {
		VStack {
			if launcherOptions.contains(.icon) {
				AppIconView()
			}

			if launcherOptions.contains(.name) {
				Text(AppInformation.appName)
					.font(.largeTitle.bold())
			}

			if launcherOptions.contains(.version), let version = AppInformation.appVersion {
				Button(action: { Pasteboard[String.self] = "\(AppInformation.appName) \(version)" }) {
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
#endif
