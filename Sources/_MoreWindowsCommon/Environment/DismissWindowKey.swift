import SwiftUI

public extension EnvironmentValues {
	@available(macOS, introduced: 13, obsoleted: 14, message: "An official implementation is provided by Apple starting with macOS 14.")
	var dismissWindow: DismissWindowAction {
		DismissWindowAction()
	}
}
