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
				makeButtonLabel()
					.draggable(url) {
						makeDocumentItem()
					}
			} else {
				makeButtonLabel()
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

extension RecentItem {
	static let documentIconSize: CGFloat = 32
}

// MARK: - Supporting Views

private extension RecentItem {
	func makeButtonLabel() -> some View {
		HStack(spacing: 0) {
			if recentItemsOptions.contains(.showIcon) {
				makeDocumentItem()
			}

			VStack(alignment: .leading) {
				FileNameLabel(for: url)
					.font(.headline)

				if recentItemsOptions.contains(.showURL) {
					FileURLLabel(for: url)
						.font(.subheadline)
						.foregroundStyle(.tertiary)
						.help(url.path(percentEncoded: false))
				}
			}
			.padding(8)
		}
		.contentShape(Rectangle())
	}

	func makeDocumentItem() -> some View {
		DocumentIcon(for: url)
			.frame(width: Self.documentIconSize, height: Self.documentIconSize)
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
