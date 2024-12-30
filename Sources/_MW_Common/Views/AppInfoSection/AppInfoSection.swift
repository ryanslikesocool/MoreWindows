import SwiftUI

/// A view displaying the app icon, name, and version.
/// 
/// - SeeAlso: ``SwiftUI/View/appInfoSectionStyle(_:)``
public struct AppInfoSection: View {
	@Environment(\.self) private var environmentValues
	@Environment(\.appInfoSectionStyle) private var style

	public init() { }

	public var body: some View {
		let configuration = AppInfoSectionStyleConfiguration(
			icon: AppIconView(),
			name: Text(Bundle.main.bundleName),
			version: AppVersionView(),
			environmentValues: environmentValues
		)

		style.makeBody(configuration: configuration)
	}
}
