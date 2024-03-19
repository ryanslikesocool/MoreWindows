#if canImport(AppKit)
	import Foundation

	public extension AboutWindow {
		struct Acknowledgement {
			public let text: String
			public let url: URL?

			public init(_ text: String, url: URL? = nil) {
				self.text = text
				self.url = url
			}

			public init(_ text: String, link: String) {
				self.init(text, url: URL(string: link))
			}
		}
	}
#endif
