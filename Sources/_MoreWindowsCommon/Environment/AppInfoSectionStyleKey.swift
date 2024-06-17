import SwiftUI

private enum AppInfoSectionStyleKey: EnvironmentKey {
	static let defaultValue: _AnyAppInfoSectionStyle = _AnyAppInfoSectionStyle(style: .default)
}

extension EnvironmentValues {
	fileprivate(set) var appInfoSectionStyle: _AnyAppInfoSectionStyle {
		get { self[AppInfoSectionStyleKey.self] }
		set { self[AppInfoSectionStyleKey.self] = newValue }
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
