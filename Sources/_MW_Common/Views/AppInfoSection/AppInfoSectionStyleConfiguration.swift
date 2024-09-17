import SwiftUI

public struct AppInfoSectionStyleConfiguration {
	public let icon: Icon
	public let name: Name
	public let version: Version

	public let environmentValues: EnvironmentValues

	@MainActor
	init(
		icon: some View,
		name: some View,
		version: some View,
		environmentValues: EnvironmentValues
	) {
		self.icon = Icon(icon)
		self.name = Name(name)
		self.version = Version(version)
		self.environmentValues = environmentValues
	}
}

// MARK: - Supporting Data

public extension AppInfoSectionStyleConfiguration {
	/// The type-erased icon of an ``AppInfoSection``.
	struct Icon: View {
		fileprivate init(_ content: some View) {
			body = AnyView(content)
		}

		public let body: AnyView
	}

	/// The type-erased name of an ``AppInfoSection``.
	struct Name: View {
		fileprivate init(_ content: some View) {
			body = AnyView(content)
		}

		public let body: AnyView
	}

	/// The type-erased version of an ``AppInfoSection``.
	struct Version: View {
		fileprivate init(_ content: some View) {
			body = AnyView(content)
		}

		public let body: AnyView
	}
}