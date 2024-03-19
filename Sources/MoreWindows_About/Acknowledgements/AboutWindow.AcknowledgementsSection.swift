#if canImport(AppKit)
#if canImport(CursorKit)
import CursorKit
#endif
import SwiftUI

public extension AboutWindow {
	struct AcknowledgementsSection<Label: View>: View {
		public typealias Options = AcknowledgementsOptions

		private let label: () -> Label
		private let acknowledgements: [Acknowledgement]

		public init(
			_ acknowledgements: [Acknowledgement],
			options: Options = .default,
			@ViewBuilder label: @escaping () -> Label
		) {
			self.label = label

			if options.contains(.sortItems) {
				self.acknowledgements = acknowledgements.sorted(by: \.text)
			} else {
				self.acknowledgements = acknowledgements
			}
		}

		public var body: some View {
			VStack(spacing: 8) {
				if Label.self != EmptyView.self {
					label()
				}
				ForEach(acknowledgements.indices, id: \.self) { index in
					item(acknowledgements[index])
				}
			}
			.font(.body)
		}

		@ViewBuilder private func item(_ acknowlegement: Acknowledgement) -> some View {
			if let url = acknowlegement.url {
				Group {
					if #available(macOS 14, iOS 17, tvOS 17, *) {
						Link(acknowlegement.text, destination: url)
							.foregroundStyle(.link)
#if canImport(CursorKit)
							.cursor(.pointingHand)
#endif
					} else {
						Link(acknowlegement.text, destination: url)
							.foregroundColor(.accentColor)
#if canImport(CursorKit)
							.cursor(.pointingHand)
#endif
					}
				}
				.underline()
			} else {
				Text(acknowlegement.text)
			}
		}
	}
}

// MARK: - Init

public extension AboutWindow.AcknowledgementsSection where Label == Text {
	init(_ title: String, acknowledgements: [AboutWindow.Acknowledgement], options: Options = .default) {
		self.init(acknowledgements, options: options, label: { Text(title) })
	}

	init(_ titleKey: LocalizedStringKey, acknowledgements: [AboutWindow.Acknowledgement], options: Options = .default) {
		self.init(acknowledgements, options: options, label: { Text(titleKey) })
	}
}
#endif
