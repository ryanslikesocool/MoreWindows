import _MW_Common
import SwiftUI

struct VerticalContentView<Content: View>: View {
	@Environment(\.aboutWindowOptions) private var aboutWindowOptions

	private let spacing: CGFloat?
	private let content: () -> Content

	public init(spacing: CGFloat?, @ViewBuilder content: @escaping () -> Content) {
		self.spacing = spacing
		self.content = content
	}

	public var body: some View {
		VStack(spacing: spacing) {
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
