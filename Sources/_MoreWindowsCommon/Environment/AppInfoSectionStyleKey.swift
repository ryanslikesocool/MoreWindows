import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/View/appInfoSectionStyle(_:)``
	fileprivate(set) var appInfoSectionStyle: _AnyAppInfoSectionStyle {
		get { self[__Key_appInfoSectionStyle.self] }
		set { self[__Key_appInfoSectionStyle.self] = newValue }
	}

	private enum __Key_appInfoSectionStyle: EnvironmentKey {
		static let defaultValue: _AnyAppInfoSectionStyle = _AnyAppInfoSectionStyle(style: .default)
	}
}

public extension View {
	/// Set the style used by ``AppInfoSection``.
	/// - SeeAlso:
	///   - ``AppInfoSectionStyle``
	func appInfoSectionStyle(_ style: some AppInfoSectionStyle) -> some View {
		environment(\.appInfoSectionStyle, _AnyAppInfoSectionStyle(style: style))
	}
}
