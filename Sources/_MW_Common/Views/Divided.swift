import SwiftUI

/// A wrapper that inserts dividers between elements in a view builder.
///
/// Read more about ``SwiftUI/_VariadicView`` at
/// [movingparts.io](https://movingparts.io/variadic-views-in-swiftui#writing-our-own-container-view)\.
package struct Divided<Content>: View where
	Content: View
{
	public let content: () -> Content

	public init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

	public var body: some View {
		_VariadicView.Tree(DividedLayout(), content: content)
	}
}

// MARK: - Layout

private struct DividedLayout: _VariadicView_MultiViewRoot {
	@ViewBuilder
	func body(children: _VariadicView.Children) -> some View {
		let last = children.last?.id

		ForEach(children) { child in
			child

			if child.id != last {
				Divider()
			}
		}
	}
}
