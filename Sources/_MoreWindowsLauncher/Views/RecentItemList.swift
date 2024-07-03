import SwiftUI

struct RecentItemList: View {
	@Environment(\.recentItemsOptions) private var recentItemsOptions
	@Environment(\.recentItemsSearchFilter) private var recentItemsSearchFilter
	@State private var searchQuery: String = ""

	private var recentDocumentURLs: [URL] { NSDocumentController.shared.recentDocumentURLs }
	private var filteredURLs: [URL] {
		// TODO: add extension filtering, tokens
		recentItemsSearchFilter(query: searchQuery, items: recentDocumentURLs)
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

// MARK: - Supporting Views

private extension RecentItemList {
	var list: some View {
		List(filteredURLs, id: \.self, rowContent: RecentItem.init)
			.listStyle(.sidebar)
			.ignoresSafeArea(.all)
	}
}
