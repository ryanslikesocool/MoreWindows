#if canImport(AppKit)
import MoreWindowsCommon
import SwiftUI

struct AppInfoSection: View {
	@Environment(\.aboutAppOptions) private var options: AboutAppOptions

	public var body: some View {
		VStack {
			AppIconView(size: 128)

			Text(AppInformation.appName)
				.font(.title.bold())

			if options.contains(.showVersion) {
				AppVersionView()
			}
		}
	}
}
#endif
