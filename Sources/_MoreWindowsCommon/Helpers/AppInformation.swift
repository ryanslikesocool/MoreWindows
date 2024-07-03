import AppKit
import Foundation

/// Information about the app.
package enum AppInformation {
	static var info: [String: Any]? { Bundle.main.infoDictionary }

	/// The app's version number, optionally including the build number.
	/// - Remark: The primary app version is retrieved from the value for the key `CFBundleShortVersionString` in `Info.plist`.
	/// - Parameter includeBuild: If `true`, append the app's build number, retrieved from ``buildVersion``, surrounded by parentheses.
	public static func appVersion(includeBuild: Bool = true) -> String? {
		guard let version = info?["CFBundleShortVersionString"] as? String else {
			return nil
		}

		return if includeBuild, let buildVersion {
			"\(version) (\(buildVersion))"
		} else {
			"\(version)"
		}
	}
	
	/// The app's build version.
	/// - Remark: This property reads the value for the key `CFBundleVersion` in `Info.plist`.
	public static var buildVersion: String? {
		info?["CFBundleVersion"] as? String
	}

	/// The app's bundle identifier.
	public static var bundleIdentifier: String! {
		Bundle.main.bundleIdentifier
	}

	/// The app's name.
	/// - Remark: This property reads the value for the key `CFBundleName` in `Info.plist`.  If the key cannot be found, the process name will be used instead.
	public static var appName: String {
		info?["CFBundleName"] as? String ?? ProcessInfo.processInfo.processName
	}

	/// The app's copyright.
	/// - Remark: This property read the value for the key `NSHumanReadableCopyright` in `Info.plist`.
	public static var copyright: String? {
		info?["NSHumanReadableCopyright"] as? String
	}

	/// The primary app icon.
	public static var appIcon: NSImage {
		NSApp.applicationIconImage
	}
}
