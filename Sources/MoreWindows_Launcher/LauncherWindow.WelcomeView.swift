#if canImport(AppKit)
import LoveCore
import SwiftUI

@available(macOS 14, *)
extension LauncherWindow {
	struct WelcomeView: View {
		@State private var hoveringOnVersion: Bool = false

		let options: LauncherWindow.Options

		var body: some View {
			VStack {
				if options.contains(.icon) {
					Image(nativeImage: AppInformation.appIcon)
						.resizable()
						.frame(size: 128)
				}

				if options.contains(.name) {
					Text(AppInformation.appName)
						.font(.largeTitle.bold())
				}

				if options.contains(.version), let version = AppInformation.appVersion {
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
}
#endif
