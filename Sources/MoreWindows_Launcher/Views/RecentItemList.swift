#if canImport(AppKit)
import SwiftUI

@available(macOS 14, *)
struct RecentItemList: View {
	@State private var searchQuery: String = ""

	private var recentDocumentURLs: [URL] { URL.recentDocumentURLs }
	private var filteredURLs: [URL] {
		guard !searchQuery.isEmpty else {
			return recentDocumentURLs
		}
		return recentDocumentURLs.filter { url in
			url.lastPathComponent.localizedStandardContains(searchQuery)
		}
		// TODO: add extension filtering
	}

	let searchable: Bool

	var body: some View {
		List(filteredURLs, id: \.self) { url in
			RecentItem(url: url)
		}
		.listStyle(.sidebar)
		.ignoresSafeArea(.all)
		.condition(searchable) { $0.searchable(text: $searchQuery, placement: .sidebar) }
	}
}
#endif
