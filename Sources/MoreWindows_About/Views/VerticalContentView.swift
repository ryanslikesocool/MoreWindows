import _MoreWindowsCommon
import SwiftUI

struct VerticalContentView<Content: View>: View {
	@Environment(\.aboutWindowOptions) private var aboutWindowOptions

	let content: () -> Content

	var body: some View {
		VStack(spacing: 32) {
			Divided {
				if aboutWindowOptions.contains(.showDefaultInformation) {
					VStack {
						AppInfoSection()
					}
				}

				content()

				if aboutWindowOptions.contains(.showDefaultCopyright), let copyright = AppInformation.copyright {
					Text(copyright)
						.font(.caption)
				}
			}
		}
		.fixedSize()
		.offset(y: 13) // half title bar height
		.padding(.horizontal, 13) // equal padding for horizontal axis
		.padding(24) // breathing room
		.ignoresSafeArea(.container)
	}
}
