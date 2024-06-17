import SwiftUI

public struct AppInfoSectionStyleConfiguration {
	/// The type-erased icon of an ``AppInfoSection``.
	public struct Icon: View {
		init(content: some View) {
			body = AnyView(content)
		}

		public var body: AnyView
	}

	/// The type-erased name of an ``AppInfoSection``.
	public struct Name: View {
		init(content: some View) {
			body = AnyView(content)
		}

		public var body: AnyView
	}

	/// The type-erased version of an ``AppInfoSection``.
	public struct Version: View {
		init(content: some View) {
			body = AnyView(content)
		}

		public var body: AnyView
	}

	public let icon: Icon
	public let name: Name
	public let version: Version

	public let environmentValues: EnvironmentValues

	init(
		icon: Icon,
		name: Name,
		version: Version,
		environmentValues: EnvironmentValues
	) {
		self.icon = icon
		self.name = name
		self.version = version
		self.environmentValues = environmentValues
	}
}
