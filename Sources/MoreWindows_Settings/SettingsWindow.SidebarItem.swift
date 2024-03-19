#if canImport(AppKit)
import LoveCore
import SwiftUI

public extension SettingsWindow {
	struct SidebarItem<ID: Hashable>: Identifiable {
		public let id: ID
		private let tint: Color
		private let icon: Image?
		private let title: AnyView

		fileprivate init<Title: View>(id: ID, tint: Color = .accentColor, icon: Image? = nil, @ViewBuilder title: () -> Title) {
			self.id = id
			self.tint = tint
			self.icon = icon
			self.title = AnyView(title())
		}

		public func sidebarView() -> some View {
			Label(title: { title }, icon: {
				if let icon {
					RoundedRectangle(cornerRadius: 4, style: .continuous)
						.fill(getFillStyle())
						.overlay {
							icon
								.foregroundColor(tint.accessibleForegroundColor)
								.scaleEffect(0.9)
						}
				} else {
					Color.clear
				}
			})
		}

		private func getFillStyle() -> some ShapeStyle {
			if #available(macOS 13, iOS 16, tvOS 16, *) {
				return tint.gradient
			} else {
				return tint
			}
		}
	}
}

public extension SettingsWindow.SidebarItem {
	init<S: StringProtocol>(id: ID, _ title: S, tint: Color = .accentColor, systemName: String) {
		self.init(id: id, tint: tint, icon: Image(systemName: systemName), title: { Text(title) })
	}

	init<S: StringProtocol>(id: ID, _ title: S, tint: Color = .accentColor, image: String, bundle: Bundle? = nil) {
		self.init(id: id, tint: tint, icon: Image(image, bundle: bundle), title: { Text(title) })
	}

	init<S: StringProtocol>(id: ID, _ title: S, tint: Color = .accentColor, icon: Image? = nil) {
		self.init(id: id, tint: tint, icon: icon, title: { Text(title) })
	}

	init(id: ID, _ titleKey: LocalizedStringKey, tint: Color = .accentColor, systemName: String) {
		self.init(id: id, tint: tint, icon: Image(systemName: systemName), title: { Text(titleKey) })
	}

	init(id: ID, _ titleKey: LocalizedStringKey, tint: Color = .accentColor, image: String, bundle: Bundle? = nil) {
		self.init(id: id, tint: tint, icon: Image(image, bundle: bundle), title: { Text(titleKey) })
	}

	init(id: ID, _ titleKey: LocalizedStringKey, tint: Color = .accentColor, icon: Image? = nil) {
		self.init(id: id, tint: tint, icon: icon, title: { Text(titleKey) })
	}
}

public extension SettingsWindow.SidebarItem where ID == String {
	init<S: StringProtocol>(_ title: S, tint: Color = .accentColor, systemName: String) {
		self.init(id: String(title), tint: tint, icon: Image(systemName: systemName), title: { Text(title) })
	}

	init<S: StringProtocol>(_ title: S, tint: Color = .accentColor, image: String, bundle: Bundle? = nil) {
		self.init(id: String(title), tint: tint, icon: Image(image, bundle: bundle), title: { Text(title) })
	}

	init<S: StringProtocol>(_ title: S, tint: Color = .accentColor, icon: Image? = nil) {
		self.init(id: String(title), tint: tint, icon: icon, title: { Text(title) })
	}
}
#endif
