#if canImport(AppKit)
import LoveCore
import SwiftUI

@available(macOS 14, *)
struct ContentView<ActionArea: View>: View {
	@Environment(\.dismissWindow) private var dismissWindow
	@Environment(\.launcherOptions) private var launcherOptions

	let actionArea: () -> ActionArea

	private let leftSideSize: Double = 460
	private let rightSideSize: Double = 280

	private var windowSize: SIMD2<Double> {
		let width: Double = if launcherOptions.contains(.recentDocuments) {
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
			.inspector(isPresented: .constant(launcherOptions.contains(.recentDocuments))) {
				RecentItemList(searchable: launcherOptions.contains(.searchRecentDocuments))
			}
			.frame(size: windowSize)
	}

	@ViewBuilder private var leftSide: some View {
		VStack(spacing: 32) {
			Spacer()

			WelcomeView()

			VStack {
				actionArea()
			}
			.fixedSize()
			.buttonStyle(.launcher)

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
#endif
