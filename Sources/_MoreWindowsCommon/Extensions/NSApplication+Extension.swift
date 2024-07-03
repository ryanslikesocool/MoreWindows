import AppKit

package extension NSApplication {
	/// The app's bundle identifier.
	var bundleIdentifier: String! {
		Bundle.main.bundleIdentifier
	}

	/// The app's name.
	///
	/// This property reads the value for the key `CFBundleName` in `Info.plist`.  If the key cannot be found, the process name will be used instead.
	var bundleName: String {
		Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
			?? ProcessInfo.processInfo.processName
	}

	/// The app's copyright.
	///
	/// This property reads the value for the key `NSHumanReadableCopyright` in `Info.plist`.
	var copyright: String? {
		Bundle.main.object(forInfoDictionaryKey: "NSHumanReadableCopyright") as? String
	}

	/// The app's bundle version.
	///
	/// This property reads the value for the key `CFBundleVersion` in `Info.plist`.
	var bundleVersion: String? {
		Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
	}

	/// The app's version number, optionally including the build number.
	///
	/// The primary app version is retrieved from the value for the key `CFBundleShortVersionString` in `Info.plist`.
	/// - Parameter includeBundleVersion: If `true`, append the app's build number, retrieved from ``includeBundleVersion``, surrounded by parentheses.
	func appVersion(includeBundleVersion: Bool = true) -> String? {
		guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
			return nil
		}

		return if
			includeBundleVersion,
			let bundleVersion
		{
			"\(version) (\(bundleVersion))"
		} else {
			"\(version)"
		}
	}
}
