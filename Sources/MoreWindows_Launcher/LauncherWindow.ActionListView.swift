#if canImport(AppKit)
import SwiftUI

@available(macOS 14, *)
extension LauncherWindow {
	struct ActionListView: View {
		let actions: [LauncherAction]

		var body: some View {
			VStack {
				ForEach(actions.indices, id: \.self) { i in
					actions[i].content
				}
			}
			.fixedSize()
		}
	}
}
#endif
