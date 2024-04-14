import AppKit

@available(macOS, introduced: 13, obsoleted: 14, message: "An official implementation is provided by Apple starting with macOS 14.")
public struct DismissWindowAction {
	init() { }

	public func callAsFunction(id windowID: String) {
		NSApplication.shared.windows
			.filter { $0.identifier?.rawValue == windowID }
			.forEach { $0.close() }
	}
}
