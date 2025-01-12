import SwiftUI

extension EnvironmentValues {
	/// ## See Also
	/// - ``AppInfoSectionStyle``
	/// - ``SwiftUI/View/appInfoSectionStyle(_:)``
	@Entry
	fileprivate(set) var appInfoSectionStyle: AnyAppInfoSectionStyle = AnyAppInfoSectionStyle(.default)
}

// MARK: - Convenience

public extension View {
	/// Set the style used by ``AppInfoSection``.
	/// 
	/// ## See Also
	/// - ``AppInfoSectionStyle``
	// - ``SwiftUICore/EnvironmentValues/appInfoSectionStyle``
	nonisolated func appInfoSectionStyle<S>(_ style: S) -> some View where
		S: AppInfoSectionStyle
	{
		environment(\.appInfoSectionStyle, AnyAppInfoSectionStyle(style))
	}
}
