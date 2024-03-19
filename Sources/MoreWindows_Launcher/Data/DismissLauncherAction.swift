import AppKit
import SwiftUI

struct DismissLauncherAction {
	let environment: EnvironmentValues

	init(environment: EnvironmentValues) {
		self.environment = environment
	}

	func callAsFunction() {
		if #available(macOS 14, *) {
			environment.dismissWindow(id: launcherWindowID)
		} else {
			launcherWindow?.close()
		}
	}
}

extension EnvironmentValues {
	var dismissLauncher: DismissLauncherAction {
		DismissLauncherAction(environment: self)
	}
}
