import Foundation
#if canImport(AppKit)
import AppKit
#elseif canImport(UIKit)
import UIKit
#endif

public enum AppInformation {
	static var info: [String: Any]? { Bundle.main.infoDictionary }

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

	public static var appName: String {
		info?["CFBundleName"] as? String ?? ProcessInfo.processInfo.processName
	}

	public static var bundleIdentifier: String! {
		Bundle.main.bundleIdentifier
	}

	public static var copyright: String? {
		info?["NSHumanReadableCopyright"] as? String
	}

#if canImport(AppKit)
	public static var appIcon: NSImage {
		NSApp.applicationIconImage
	}

#elseif canImport(UIKit)
	public static var appIconName: String? {
		guard
			let icons = info?["CFBundleIcons"] as? [String: Any],
			let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
			let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
			let lastIcon = iconFiles.last
		else {
			return nil
		}
		return lastIcon
	}

	public static var appIcon: UIImage? {
		guard let appIconName else {
			return nil
		}
		return UIImage(named: appIconName)
	}
#endif
}
