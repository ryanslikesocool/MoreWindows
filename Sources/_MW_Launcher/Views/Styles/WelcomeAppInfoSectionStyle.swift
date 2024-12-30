import _MW_Common
import SwiftUI

/// The `AppInfoSection` style used in a ``Launcher`` scene.
struct WelcomeAppInfoSectionStyle: AppInfoSectionStyle {
	typealias Options = LauncherWindowOptions

	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		let launcherWindowOptions = configuration.environmentValues.launcherWindowOptions

		VStack {
			makeAppIcon(with: launcherWindowOptions)
			makeAppName(with: launcherWindowOptions)
			makeAppVersion(with: launcherWindowOptions)
		}
	}
}

// MARK: - Supporting Views

@MainActor
private extension WelcomeAppInfoSectionStyle {
	@ViewBuilder
	func makeAppIcon(with options: Options) -> some View {
		if options.contains(.showIcon) {
			AppIconView()
				.frame(height: 160)
		}
	}

	@ViewBuilder
	func makeAppName(with options: Options) -> some View {
		if options.contains(.showName) {
			AppNameLabel()
				.font(.largeTitle.bold())
		}
	}

	@ViewBuilder
	func makeAppVersion(with options: Options) -> some View {
		if options.contains(.showVersion) {
			AppVersionView()
		}
	}
}

// MARK: - Convenience

extension AppInfoSectionStyle where
	Self == WelcomeAppInfoSectionStyle
{
	static var welcome: Self {
		Self()
	}
}
