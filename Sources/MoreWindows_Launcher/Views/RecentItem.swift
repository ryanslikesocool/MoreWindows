#if canImport(AppKit)
import Foundation
import LoveCore
import SwiftUI

@available(macOS 14, *)
struct RecentItem: View {
	@Environment(\.openDocument) private var openDocument
	@Environment(\.dismissWindow) private var dismissWindow

	private let url: URL
	private let settings: Options

	private var title: String { url.deletingPathExtension().lastPathComponent }
	private var image: NSImage? { NSWorkspace.shared.icon(forFile: url.path(percentEncoded: false)) }

	init(url: URL, settings: Options = .default) {
		self.url = url
		self.settings = settings
	}

	public var body: some View {
		Button(action: openFile) {
			HStack(spacing: 0) {
				if settings.contains(.showIcon) {
					documentIcon
				}

				VStack(alignment: .leading) {
					Text(title)
						.font(.headline)

					if settings.contains(.showURL) {
						Text(url.compressingTildeInPath)
							.font(.subheadline)
							.foregroundStyle(.tertiary)
							.help(url.path(percentEncoded: false))
					}
				}
				.padding(8)
			}
			.contentShape(Rectangle())
			.condition(settings.contains(.draggable)) {
				$0.draggable(url, preview: {
					documentIcon
				})
			}
		}
		.buttonStyle(.plain)
		.frame(height: 44)
		.contextMenu {
			Button("Show in Finder") {
				url.showInFinder()
			}
		}
	}

	@ViewBuilder private var documentIcon: some View {
		if let image {
			Image(nativeImage: image)
				.resizable()
				.frame(size: 32)
		} else {
			Image(systemName: "doc")
		}
	}

	private func openFile() {
		Task {
			do {
				try await openDocument(at: url)

				if settings.contains(.closeWindow) {
					await MainActor.run {
						dismissWindow(id: LauncherWindow.windowID)
					}
				}
			} catch {
				print("Failed to open document at \(url): ", error)
			}
		}
	}
}

@available(macOS 14, *)
extension RecentItem {
	struct Options: OptionSet {
		public let rawValue: UInt8

		public init(rawValue: UInt8) {
			self.rawValue = rawValue
		}

		public static let showIcon: Self = Self(rawValue: 1 << 0)
		public static let showURL: Self = Self(rawValue: 1 << 1)
		public static let draggable: Self = Self(rawValue: 1 << 2)
		public static let closeWindow: Self = Self(rawValue: 1 << 3)

		public static let all: Self = [.showIcon, .showURL, .draggable, .closeWindow]

		public static let `default`: Self = .all
	}
}
#endif
