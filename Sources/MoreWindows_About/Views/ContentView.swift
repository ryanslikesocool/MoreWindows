#if canImport(AppKit)
import SwiftUI

struct ContentView<Content: View>: View {
	let content: () -> Content

	var body: some View {
		VStack(spacing: 32) {
			Divided {
				AppInfoSection()
				content()
			}
		}
		.fixedSize()
		.offset(y: 13) // half title bar height
		.padding(.horizontal, 13) // equal padding for horizontal axis
		.padding(24) // breathing room
		.ignoresSafeArea(.container)
	}
}
#endif
