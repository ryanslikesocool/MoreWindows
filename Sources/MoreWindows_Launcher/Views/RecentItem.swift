#if canImport(AppKit)
import Foundation
import SwiftUI

struct RecentItem: View {
	@Environment(\.dismissLauncher) private var dismissLauncher
	@Environment(\.recentItemsOptions) private var recentItemsOptions
	@Environment(\.openDocument) private var openDocument

	private let url: URL

	private var title: String { url.deletingPathExtension().lastPathComponent }
	private var image: NSImage? { NSWorkspace.shared.icon(forFile: url.path(percentEncoded: false)) }

	init(url: URL) {
		self.url = url
	}

	public var body: some View {
		Button(action: openFile) {
			HStack(spacing: 0) {
				if recentItemsOptions.contains(.showIcon) {
					documentIcon
				}

				VStack(alignment: .leading) {
					Text(title)
						.font(.headline)

					if recentItemsOptions.contains(.showURL) {
						Text(url.compressingTildeInPath)
							.font(.subheadline)
							.foregroundStyle(.tertiary)
							.help(url.path(percentEncoded: false))
					}
				}
				.padding(8)
			}
			.contentShape(Rectangle())
			.condition(recentItemsOptions.contains(.draggable)) {
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

				if recentItemsOptions.contains(.closeWindow) {
					await MainActor.run {
						dismissLauncher()
					}
				}
			} catch {
				print("Failed to open document at \(url): ", error)
			}
		}
	}
}
#endif
