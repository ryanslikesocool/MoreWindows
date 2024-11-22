import _MW_Common
import SwiftUI

struct LauncherLabelStyle: LabelStyle {
	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		Label {
			configuration.title
		} icon: {
			configuration.icon
				.foregroundStyle(.secondary)
		}
		.fontWeight(.semibold)
	}
}

// MARK: - Convenience

extension LabelStyle where
	Self == LauncherLabelStyle
{
	static var launcher: Self {
		Self()
	}
}
