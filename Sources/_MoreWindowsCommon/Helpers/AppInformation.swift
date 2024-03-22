import AppKit
import Foundation

public enum AppInformation {
	static var info: [String: Any]? { Bundle.main.infoDictionary }

	/// The app's version number, optionally including the build number.
	public static func appVersion(includeBuild: Bool = true) -> String? {
		guard let version = info?["CFBundleShortVersionString"] as? String else {
			return nil
		}

		return if includeBuild, let build = info?["CFBundleVersion"] as? String {
			"\(version) (\(build))"
		} else {
			"\(version)"
		}
	}

	/// The app's bundle identifier.
	public static var bundleIdentifier: String! {
		Bundle.main.bundleIdentifier
	}

	/// The app's name.
	public static var appName: String {
		info?["CFBundleName"] as? String ?? ProcessInfo.processInfo.processName
	}

	/// The app's copyright, as found in Info.plist.
	public static var copyright: String? {
		info?["NSHumanReadableCopyright"] as? String
	}

	/// The primary app icon.
	public static var appIcon: NSImage {
		NSApp.applicationIconImage
	}
}
