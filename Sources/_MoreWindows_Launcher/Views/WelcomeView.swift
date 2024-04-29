import _MoreWindowsCommon
import SwiftUI

struct WelcomeView: View {
	@Environment(\.launcherWindowOptions) private var launcherWindowOptions

	var body: some View {
		VStack {
			if launcherWindowOptions.contains(.showIcon) {
				AppIconView(size: 160)
			}

			if launcherWindowOptions.contains(.showName) {
				Text(AppInformation.appName)
					.font(.largeTitle.bold())
			}

			if launcherWindowOptions.contains(.showVersion) {
				AppVersionView()
			}
		}
	}
}
