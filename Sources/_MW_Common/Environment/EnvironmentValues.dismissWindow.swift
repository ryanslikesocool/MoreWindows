import SwiftUI

public extension EnvironmentValues {
	/// A window dismissal action stored in a view's environment.
	///
	/// Use the `dismissWindow` environment value to get an ``DismissWindowAction`` instance for a given ``Environment``.
	/// Then call the instance to dismiss a window.
	/// You call the instance directly because it defines a ``DismissWindowAction/callAsFunction(id:)`` method that Swift calls when you call the instance.
	///
	/// For example, you can define a button that dismisses an auxiliary window:
	/// ```swift
	/// @main
	/// struct MyApp: App {
	///		var body: some Scene {
	///			WindowGroup {
	///				ContentView()
	///			}
	///			#if os(macOS)
	///			Window("Auxiliary", id: "auxiliary") {
	///				AuxiliaryContentView()
	///			}
	///			#endif
	///		}
	///	}
	///
	/// struct DismissWindowButton: View {
	///		@Environment(\.dismissWindow) private var dismissWindow
	///
	///		var body: some View {
	///			Button("Close Auxiliary Window") {
	///				dismissWindow(id: "auxiliary")
	///			}
	///		}
	/// }
	/// ```
	///
	/// - Remark: An official implementation is provided by Apple starting with macOS 14.
	@available(iOS, introduced: 16, obsoleted: 17, message: "An official implementation is provided by Apple starting with iOS 17.")
	@available(macCatalyst, introduced: 16, obsoleted: 17, message: "An official implementation is provided by Apple starting with macCatalyst 17.")
	@available(macOS, introduced: 13, obsoleted: 14, message: "An official implementation is provided by Apple starting with macOS 14.")
	@MainActor
	var dismissWindow: DismissWindowAction {
		dismissWindow_compatibility
	}

	/// A window dismissal action stored in a view's environment.
	///
	/// Use the `dismissWindow` environment value to get an ``DismissWindowAction`` instance for a given ``Environment``.
	/// Then call the instance to dismiss a window.
	/// You call the instance directly because it defines a ``DismissWindowAction/callAsFunction(id:)`` method that Swift calls when you call the instance.
	///
	/// For example, you can define a button that dismisses an auxiliary window:
	/// ```swift
	/// @main
	/// struct MyApp: App {
	/// 	var body: some Scene {
	/// 		WindowGroup {
	/// 			ContentView()
	/// 		}
	/// 		#if os(macOS)
	/// 		Window("Auxiliary", id: .auxiliary) {
	/// 			AuxiliaryContentView()
	/// 		}
	/// 		#endif
	/// 	}
	/// }
	///
	/// struct DismissWindowButton: View {
	/// 	@Environment(\.dismissWindow) private var dismissWindow
	///
	/// 	var body: some View {
	/// 		Button("Close Auxiliary Window") {
	/// 			dismissWindow(id: .auxiliary)
	/// 		}
	/// 	}
	/// }
	/// ```
	///
	/// - Remark: An official implementation is provided by Apple starting with macOS 14.
	@MainActor
	var dismissWindow_compatibility: DismissWindowAction_Compatibility {
		DismissWindowAction_Compatibility()
	}
}
