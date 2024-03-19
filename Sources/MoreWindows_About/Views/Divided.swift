#if canImport(AppKit)
import SwiftUI

// From https://movingparts.io/variadic-views-in-swiftui#writing-our-own-container-view

struct Divided<Content: View>: View {
	var content: () -> Content

	init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

	var body: some View {
		_VariadicView.Tree(DividedLayout(), content: content)
	}
}

struct DividedLayout: _VariadicView_MultiViewRoot {
	@ViewBuilder func body(children: _VariadicView.Children) -> some View {
		let last = children.last?.id

		ForEach(children) { child in
			child

			if child.id != last {
				Divider()
			}
		}
	}
}
#endif
