import _MoreWindowsCommon
import SwiftUI

/// A view displaying the app icon, name, and version.
///
/// - Remark: This view does not explicitly define layout and will inherit the layout of its containing view.
public struct AppInfoSection: View {
	public init() { }

	public var body: some View {
		AppIconView(size: 128)

		Text(AppInformation.appName)
			.font(.title.bold())

		AppVersionView()
	}
}
