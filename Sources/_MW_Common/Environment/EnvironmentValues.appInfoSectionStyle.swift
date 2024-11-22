import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/View/appInfoSectionStyle(_:)``
	@Entry
	fileprivate(set) var appInfoSectionStyle: AnyAppInfoSectionStyle = AnyAppInfoSectionStyle(.default)
}

// MARK: - Convenience

public extension View {
	/// Set the style used by ``AppInfoSection``.
	/// - SeeAlso:
	///   - ``AppInfoSectionStyle``
	nonisolated func appInfoSectionStyle<S>(_ style: S) -> some View where
		S: AppInfoSectionStyle
	{
		environment(\.appInfoSectionStyle, AnyAppInfoSectionStyle(style))
	}
}
