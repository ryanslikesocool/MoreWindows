import SwiftUI

public extension EnvironmentValues {
	/// Dismiss a window.
	///
	/// - Remark: An official implementation is provided by Apple starting with macOS 14.
	@available(iOS, introduced: 16, obsoleted: 17, message: "An official implementation is provided by Apple starting with iOS 17.")
	@available(macCatalyst, introduced: 16, obsoleted: 17, message: "An official implementation is provided by Apple starting with macCatalyst 17.")
	@available(macOS, introduced: 13, obsoleted: 14, message: "An official implementation is provided by Apple starting with macOS 14.")
	@MainActor
	var dismissWindow: DismissWindowAction {
		DismissWindowAction()
	}
}
