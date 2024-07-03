import SwiftUI

/// A view displaying the app icon, name, and version.
/// - SeeAlso: ``SwiftUI/View/appInfoSectionStyle(_:)``
public struct AppInfoSection: View {
	@Environment(\.self) private var environmentValues
	@Environment(\.appInfoSectionStyle) private var style

	public init() { }

	public var body: some View {
		style.makeBody(
			configuration: AppInfoSectionStyleConfiguration(
				icon: AppInfoSectionStyleConfiguration.Icon(content: AppIconView()),
				name: AppInfoSectionStyleConfiguration.Name(content: Text(NSApplication.shared.bundleName)),
				version: AppInfoSectionStyleConfiguration.Version(content: AppVersionView()),
				environmentValues: environmentValues
			)
		)
	}
}
