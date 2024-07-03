import _MoreWindowsCommon
import SwiftUI

/// The `AppInfoSection` style used in a ``Launcher`` scene.
struct WelcomeAppInfoSectionStyle: AppInfoSectionStyle {
	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		let launcherWindowOptions = configuration.environmentValues.launcherWindowOptions

		VStack {
			if launcherWindowOptions.contains(.showIcon) {
				AppIconView()
					.frame(height: 160)
			}

			if launcherWindowOptions.contains(.showName) {
				Text(NSApplication.shared.bundleName)
					.font(.largeTitle.bold())
			}

			if launcherWindowOptions.contains(.showVersion) {
				AppVersionView()
			}
		}
	}
}

// MARK: -

extension AppInfoSectionStyle where Self == WelcomeAppInfoSectionStyle {
	static var welcome: Self { Self() }
}
