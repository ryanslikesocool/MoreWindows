import _MW_Common
import Foundation
import OSLog
import SwiftUI

struct RecentItem: View {
	@Environment(\.dismissWindow) private var dismissWindow
	@Environment(\.recentItemsOptions) private var recentItemsOptions
	@Environment(\.openDocument) private var openDocument
	@Environment(\.windowID) private var windowID

	private let url: URL

	init(url: URL) {
		self.url = url
	}

	public var body: some View {
		Button(action: openFile) {
			if recentItemsOptions.contains(.draggable) {
				label
					.draggable(url) {
						documentIcon
					}
			} else {
				label
			}
		}
		.buttonStyle(.plain)
		.frame(height: 44)
		.contextMenu {
			ShowInFinderButton(url)
		}
	}
}

// MARK: - Constants

private extension RecentItem {
	static let documentIconSize: CGFloat = 32
}

// MARK: - Supporting Views

private extension RecentItem {
	var label: some View {
		HStack(spacing: 0) {
			if recentItemsOptions.contains(.showIcon) {
				documentIcon
			}

			VStack(alignment: .leading) {
				Text(title)
					.font(.headline)

				if recentItemsOptions.contains(.showURL) {
					documentURL
						.font(.subheadline)
						.foregroundStyle(.tertiary)
						.help(url.path(percentEncoded: false))
				}
			}
			.padding(8)
		}
		.contentShape(Rectangle())
	}

	@ViewBuilder var documentURL: some View {
		if url.isInCloud {
			let path: String = url.path(options: [
				.cloud(mode: .remove, removeAppName: true),
				.home(mode: .remove),
			])
			Text(verbatim: "\(Image(systemName: "icloud"))\(path)")
		} else {
			let path: String = url.path(options: [
				.home(mode: .abbreviate),
			])
			Text(path)
		}
	}

	@ViewBuilder var documentIcon: some View {
		if let image {
			Image(nsImage: image)
				.resizable()
				.frame(width: Self.documentIconSize, height: Self.documentIconSize)
		} else {
			Image(systemName: "doc")
		}
	}
}

// MARK: - Functions

private extension RecentItem {
	func openFile() {
		Task {
			do {
				try await openDocument(at: url)

				if recentItemsOptions.contains(.closeWindow) {
					await MainActor.run {
						closeWindow()
					}
				}
			} catch {
				Logger.module.error("""
				Failed to open document:
				- Path  \(url.path(percentEncoded: false))
				- Error \(error.localizedDescription)
				""")
			}
		}
	}

	func closeWindow() {
		guard let windowID else {
			preconditionFailure("""
			The window ID environment value was missing.
			This should not happen.  Please file a bug report.	
			""")
		}

		dismissWindow(id: windowID)
	}
}

// MARK: - Properties

private extension RecentItem {
	var title: String {
		url
			.deletingPathExtension()
			.lastPathComponent
	}

	var image: NSImage? {
		NSWorkspace.shared
			.icon(forFile: url.path(percentEncoded: false))
	}
}
