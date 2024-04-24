import _MoreWindowsCommon
import SwiftUI

public struct AppInfoSection: View {
	@Environment(\.aboutWindowOptions) private var aboutWindowOptions

	public init() { }

	public var body: some View {
		AppIconView(size: 128)

		Text(AppInformation.appName)
			.font(.title.bold())

		AppVersionView()
	}
}
