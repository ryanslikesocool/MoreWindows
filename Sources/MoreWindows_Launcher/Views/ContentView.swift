#if canImport(AppKit)
import SwiftUI

struct ContentView<ActionArea: View>: View {
	@Environment(\.dismissLauncher) private var dismissLauncher
	@Environment(\.launcherOptions) private var launcherOptions
	@Environment(\.recentItemsOptions) private var recentItemsOptions

	let actionArea: () -> ActionArea

	private let leftSideSize: Double = 460
	private let rightSideSize: Double = 280

	private var windowSize: SIMD2<Double> {
		let width: Double = if launcherOptions.contains(.showRecentDocuments) {
			leftSideSize + rightSideSize
		} else {
			leftSideSize
		}
		let height: Double = 430
		return [width, height]
	}

	var body: some View {
		HStack(spacing: 0) {
			leftSide

			if launcherOptions.contains(.showRecentDocuments) {
				Divider()
				RecentItemList(searchable: recentItemsOptions.contains(.searchable))
			}
		}
		.ignoresSafeArea(.all)
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
		.overlay(alignment: .topLeading) { closeButton }
	}

	private var closeButton: some View {
		Button(action: dismissLauncher.callAsFunction) {
			Image(systemName: "xmark")
				.font(.system(size: 6, weight: .bold))
				.foregroundStyle(.background)
				.frame(width: 12, height: 12)
				.background(.tertiary, in: Circle())
		}
		.buttonStyle(.plain)
		.padding(12)
	}
}
#endif
