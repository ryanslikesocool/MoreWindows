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

				if aboutWindowOptions.contains(.showDefaultCopyright), let copyright = NSApplication.shared.copyright {
					Text(copyright)
						.font(.caption)
				}
			}
		}
		.fixedSize()
//		.ignoresSafeArea(.all)  // this just... doesn't work sometimes?
		.offset(y: -12) // half title bar height
		.padding(.horizontal, 12) // equal padding for horizontal axis
		.scenePadding() // breathing room
	}
}
