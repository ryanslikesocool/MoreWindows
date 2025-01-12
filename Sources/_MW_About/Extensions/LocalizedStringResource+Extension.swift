import Foundation

extension LocalizedStringResource {
	static let module = Module.self

	/// ## Topics
	/// - ``module``
	enum Module {
		private static let windowTitleFormat = LocalizedStringResource("WINDOW_TITLE_\(placeholder: .object)", bundle: .module)

		private static func windowTitle(applicationName: String) -> String {
			var options = String.LocalizationOptions()
			options.replacements = [applicationName]

			return String(
				localized: windowTitleFormat,
				options: options
			)
		}

		static var windowTitle: String {
			let applicationName = Bundle.main.bundleName
			return windowTitle(applicationName: applicationName)
		}
	}
}
