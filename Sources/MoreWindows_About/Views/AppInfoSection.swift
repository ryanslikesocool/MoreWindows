import _MoreWindowsCommon
import SwiftUI

struct AppInfoSection: View {
	@Environment(\.aboutWindowOptions) private var aboutWindowOptions

	public var body: some View {
		VStack {
			AppIconView(size: 128)

			Text(AppInformation.appName)
				.font(.title.bold())

			AppVersionView()
		}
	}
}
