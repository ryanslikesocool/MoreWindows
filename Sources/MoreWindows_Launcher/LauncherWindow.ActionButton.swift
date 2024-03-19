#if canImport(AppKit)
import MoreViews
import SwiftUI

@available(macOS 14, *)
public extension LauncherWindow {
	struct ActionButton: View {
		@Environment(\.dismissWindow) private var dismissWindow

		private let title: () -> Text
		private let image: (() -> Image)?
		private let settings: LauncherAction.Options
		private let action: () -> Void

		public init(title: @autoclosure @escaping () -> Text, image: (() -> Image)?, settings: LauncherAction.Options, action: @escaping () -> Void) {
			self.title = title
			self.image = image
			self.settings = settings
			self.action = action
		}

		public var body: some View {
			Button(action: buttonAction) {
				Label {
					title()
				} icon: {
					if let image {
						image()
							.foregroundStyle(.secondary)
					}
				}
				.fontWeight(.semibold)
				.padding(8)
				.expand()
				.background(.foreground.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
			}
			.buttonStyle(.plain)
		}

		private func buttonAction() {
			action()
			if settings.contains(.closeWindow) {
				dismissWindow(id: LauncherWindow.windowID)
			}
		}
	}
}

// MARK: - Init overloads

@available(macOS 14, *)
public extension LauncherWindow.ActionButton {
	init(_ title: String, image: @autoclosure @escaping () -> Image, settings: LauncherWindow.LauncherAction.Options = .default, action: @escaping () -> Void) {
		self.init(title: Text(title), image: image, settings: settings, action: action)
	}

	init(_ title: String, image: String, bundle: Bundle? = nil, settings: LauncherWindow.LauncherAction.Options = .default, action: @escaping () -> Void) {
		self.init(title: Text(title), image: { Image(image, bundle: bundle) }, settings: settings, action: action)
	}

	init(_ title: String, systemImage: String, settings: LauncherWindow.LauncherAction.Options = .default, action: @escaping () -> Void) {
		self.init(title: Text(title), image: { Image(systemName: systemImage) }, settings: settings, action: action)
	}

	init(_ titleKey: LocalizedStringKey, image: @autoclosure @escaping () -> Image, settings: LauncherWindow.LauncherAction.Options = .default, action: @escaping () -> Void) {
		self.init(title: Text(titleKey), image: image, settings: settings, action: action)
	}

	init(_ titleKey: LocalizedStringKey, image: String, bundle: Bundle? = nil, settings: LauncherWindow.LauncherAction.Options = .default, action: @escaping () -> Void) {
		self.init(title: Text(titleKey), image: { Image(image, bundle: bundle) }, settings: settings, action: action)
	}

	init(_ titleKey: LocalizedStringKey, systemImage: String, settings: LauncherWindow.LauncherAction.Options = .default, action: @escaping () -> Void) {
		self.init(title: Text(titleKey), image: { Image(systemName: systemImage) }, settings: settings, action: action)
	}
}

#endif
