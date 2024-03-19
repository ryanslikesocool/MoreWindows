#if canImport(AppKit)
import LoveCore
import SwiftUI

@available(macOS 14, *)
extension LauncherWindow {
	struct Content: View {
		@Environment(\.dismissWindow) private var dismissWindow

		let actions: [LauncherAction]
		let options: Options

		private let leftSideSize: Double = 460
		private let rightSideSize: Double = 280

		private var windowSize: SIMD2<Double> {
			let width: Double = if options.contains(.recentDocuments) {
				leftSideSize + rightSideSize
			} else {
				leftSideSize
			}
			let height: Double = 430
			return [width, height]
		}

		var body: some View {
			leftSide
				.overlay(alignment: .topLeading) { closeButton }
				.ignoresSafeArea(.all)
				.inspector(isPresented: .constant(options.contains(.recentDocuments))) {
					RecentItemList(searchable: options.contains(.searchRecentDocuments))
				}
				.frame(size: windowSize)
		}

		@ViewBuilder private var leftSide: some View {
			VStack(spacing: 32) {
				Spacer()
				WelcomeView(options: options)
				ActionListView(actions: actions)
				Spacer()
			}
			.frame(width: leftSideSize)
		}

		private var closeButton: some View {
			Button(action: { dismissWindow() }) {
				Image(systemName: "xmark")
					.font(.system(size: 6, weight: .bold))
					.foregroundStyle(.background)
					.frame(size: 12)
					.background(.foreground.opacity(0.3), in: Circle())
			}
			.buttonStyle(.plain)
			.padding(12)
		}
	}
}
#endif
