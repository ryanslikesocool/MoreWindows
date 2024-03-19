import Foundation

public enum AppInformation {
	static var info: [String: Any]? { Bundle.main.infoDictionary }

	public static var appVersion: String? {
		guard let version = info?["CFBundleShortVersionString"] as? String else {
			return nil
		}

		return if let build = info?["CFBundleVersion"] as? String {
			"\(version) (\(build))"
		} else {
			"\(version)"
		}
	}

	public static var appName: String {
		info?["CFBundleName"] as? String ?? ProcessInfo.processInfo.processName
	}

	public static var bundleIdentifier: String! {
		Bundle.main.bundleIdentifier
	}

	public static var copyright: String? {
		info?["NSHumanReadableCopyright"] as? String
	}
}
