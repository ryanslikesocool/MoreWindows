#if canImport(AppKit)
import MoreWindowsCommon
import SwiftUI

struct WelcomeView: View {
	@Environment(\.launcherOptions) private var launcherOptions

	var body: some View {
		VStack {
			if launcherOptions.contains(.showIcon) {
				AppIconView(size: 160)
			}

			if launcherOptions.contains(.showName) {
				Text(AppInformation.appName)
					.font(.largeTitle.bold())
			}

			if launcherOptions.contains(.showVersion) {
				AppVersionView()
			}
		}
	}
}
#endif
