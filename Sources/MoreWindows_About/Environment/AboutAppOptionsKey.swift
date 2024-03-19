import SwiftUI

private struct AboutAppOptionsKey: EnvironmentKey {
	static let defaultValue: AboutAppOptions = .default
}

extension EnvironmentValues {
	var aboutAppOptions: AboutAppOptions {
		get { self[AboutAppOptionsKey.self] }
		set { self[AboutAppOptionsKey.self] = newValue }
	}
}

public extension Scene {
	func aboutApp(_ options: AboutAppOptions) -> some Scene {
		environment(\.aboutAppOptions, options)
	}
}
