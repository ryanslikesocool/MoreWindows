#if canImport(AppKit)
import SwiftUI

struct RecentItemList: View {
	@Environment(\.recentItemsOptions) private var recentItemsOptions
	@State private var searchQuery: String = ""

	private var recentDocumentURLs: [URL] { URL.recentDocumentURLs }
	private var filteredURLs: [URL] {
		guard !searchQuery.isEmpty else {
			return recentDocumentURLs
		}
		return recentDocumentURLs.filter { url in
			url.lastPathComponent.localizedStandardContains(searchQuery)
		}
		// TODO: add extension filtering, tokens
	}

	var body: some View {
		if recentItemsOptions.contains(.searchable) {
			list
				.searchable(text: $searchQuery, placement: .sidebar)
		} else {
			list
		}
	}
}

private extension RecentItemList {
	var list: some View {
		List(filteredURLs, id: \.self) { url in
			RecentItem(url: url)
		}
		.listStyle(.sidebar)
		.ignoresSafeArea(.all)
	}
}
#endif
