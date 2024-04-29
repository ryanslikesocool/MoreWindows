import _MoreWindowsCommon
import SwiftUI

struct LauncherLabelStyle: LabelStyle {
	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		Label(
			title: { configuration.title },
			icon: {
				configuration.icon
					.foregroundStyle(.secondary)
			}
		)
		.fontWeight(.semibold)
	}
}

// MARK: -

extension LabelStyle where Self == LauncherLabelStyle {
	static var launcher: Self { Self() }
}
