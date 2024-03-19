#if canImport(AppKit)
import SwiftUI

public protocol SettingsPaneView: View {
	associatedtype Model
	associatedtype ContentView: View
	associatedtype ToolbarView: View

	var settings: Model { get set }

	@ViewBuilder var content: ContentView { get }
	@ViewBuilder var toolbar: ToolbarView { get }
}

public extension SettingsPaneView {
	var body: some View {
		Form {
			content
		}
		.formStyle(.grouped)
		.toolbar { toolbar }
	}
}

public extension SettingsPaneView where ToolbarView == EmptyView {
	var toolbar: EmptyView {
		EmptyView()
	}
}
#endif
