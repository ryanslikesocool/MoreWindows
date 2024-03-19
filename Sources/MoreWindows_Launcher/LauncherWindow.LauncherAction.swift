#if canImport(AppKit)
import SwiftUI

@available(macOS 14, *)
public extension LauncherWindow {
	struct LauncherAction {
		public let content: AnyView

		public init<C: View>(@ViewBuilder content: @escaping () -> C) {
			self.content = AnyView(content())
		}

		public init(_ title: @autoclosure @escaping () -> Text, image: (() -> Image)?, settings: Options = .default, action: @escaping () -> Void) {
			self.init {
				ActionButton(title: title(), image: image, settings: settings, action: action)
			}
		}

		public init(_ title: @autoclosure @escaping () -> Text, image: @autoclosure @escaping () -> Image, settings: Options = .default, action: @escaping () -> Void) {
			self.init {
				ActionButton(title: title(), image: image, settings: settings, action: action)
			}
		}
	}
}

// MARK: - Options

@available(macOS 14, *)
public extension LauncherWindow.LauncherAction {
	struct Options: OptionSet {
		public let rawValue: UInt8

		public init(rawValue: UInt8) {
			self.rawValue = rawValue
		}

		public static let closeWindow: Self = Self(rawValue: 1 << 0)

		public static let `default`: Self = .all

		public static let none: Self = Self(rawValue: 0)
		public static let all: Self = [.closeWindow]
	}
}
#endif
