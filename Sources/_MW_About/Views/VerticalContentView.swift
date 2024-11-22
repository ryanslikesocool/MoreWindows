import _MW_Common
import SwiftUI

struct VerticalContentView<Content>: View where
	Content: View
{
	@Environment(\.aboutWindowOptions) private var aboutWindowOptions

	private let spacing: CGFloat?
	private let content: () -> Content

	public init(
		spacing: CGFloat?,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.spacing = spacing
		self.content = content
	}

	public var body: some View {
		VStack(spacing: spacing) {
			Divided {
				makeAppInfoSection()

				content()

				makeDefaultCopyrightLabel()
			}
		}
		.fixedSize()
//		.ignoresSafeArea(.all)  // this just... doesn't work sometimes?
		.offset(y: -12) // half title bar height
		.padding(.horizontal, 12) // equal padding for horizontal axis
		.scenePadding() // breathing room
	}
}

// MARK: - Supporting Views

private extension VerticalContentView {
	@ViewBuilder
	func makeAppInfoSection() -> some View {
		if aboutWindowOptions.contains(.showDefaultInformation) {
			VStack {
				AppInfoSection()
			}
		}
	}

	@ViewBuilder
	func makeDefaultCopyrightLabel() -> some View {
		if aboutWindowOptions.contains(.showDefaultCopyright) {
			CopyrightLabel()
				.font(.caption)
		}
	}
}