#if canImport(AppKit)
import SwiftUI

public extension SettingsWindow {
	struct ToolbarTitle<Title: View, Subtitle: View>: View {
		private let title: () -> Title
		private let subtitle: () -> Subtitle

		public init(@ViewBuilder title: @escaping () -> Title, @ViewBuilder subtitle: @escaping () -> Subtitle) {
			self.title = title
			self.subtitle = subtitle
		}

		public var body: some View {
			HStack {
				title()
					.opacity(0.5)
				subtitle()
					.font(.headline)
			}
		}
	}
}

public extension SettingsWindow.ToolbarTitle {
	init<S1: StringProtocol, S2: StringProtocol>(_ title: S1, subtitle: S2) where Title == Text, Subtitle == Text {
		self.init(title: { Text(title) }, subtitle: { Text(subtitle) })
	}

	init<S: StringProtocol>(_ title: S, subtitleKey: LocalizedStringKey) where Title == Text, Subtitle == Text {
		self.init(title: { Text(title) }, subtitle: { Text(subtitleKey) })
	}

	init<S: StringProtocol>(_ titleKey: LocalizedStringKey, subtitle: S) where Title == Text, Subtitle == Text {
		self.init(title: { Text(titleKey) }, subtitle: { Text(subtitle) })
	}

	init(_ titleKey: LocalizedStringKey, subtitleKey: LocalizedStringKey) where Title == Text, Subtitle == Text {
		self.init(title: { Text(titleKey) }, subtitle: { Text(subtitleKey) })
	}
}
#endif
