import _MoreWindowsCommon
import SwiftUI

struct ContentView<Content: View>: View {
	@Environment(\.aboutWindowLayout) private var aboutWindowLayout

	let content: () -> Content

	var body: some View {
		switch aboutWindowLayout {
			case .custom: content()
			case .vertical: VerticalContentView(content: content)
		}
	}
}
