import SwiftUI

struct FileURLLabel: View {
	private let isInCloud: Bool
	private let filePath: String

	nonisolated public init(for url: URL) {
		isInCloud = url.isInCloud

		filePath = switch isInCloud {
			case true: Self.getCloudFilePath(for: url)
			case false: Self.getLocalFilePath(for: url)
		}
	}

	public var body: some View {
		if isInCloud {
			Text(verbatim: "\(Image(systemName: "icloud"))\(filePath)")
		} else {
			Text(verbatim: filePath)
		}
	}
}

// MARK: - Functions

private extension FileURLLabel {
	nonisolated static func getCloudFilePath(for url: borrowing URL) -> String {
		url.path(options: [
			.cloud(mode: .remove, removeAppName: true),
			.home(mode: .remove),
		])
	}

	nonisolated static func getLocalFilePath(for url: borrowing URL) -> String {
		url.path(options: [
			.home(mode: .abbreviate),
		])
	}
}