import Foundation

struct RecentItemsSearchFilter {
	public typealias Predicate = @Sendable (String, URL) -> Bool

	private let predicate: Predicate

	public init(_ predicate: @escaping Predicate) {
		self.predicate = predicate
	}

	public func callAsFunction(
		query searchQuery: borrowing String,
		items: some Sequence<URL>
	) -> [URL] {
		guard !searchQuery.isEmpty else {
			return Array(items)
		}
		return items
			.filter { item in predicate(searchQuery, item) }
	}
}

// MARK: - Constants

extension RecentItemsSearchFilter {
	static let `default`: Self = Self { query, item in
		item.lastPathComponent.localizedStandardContains(query)
	}
}
