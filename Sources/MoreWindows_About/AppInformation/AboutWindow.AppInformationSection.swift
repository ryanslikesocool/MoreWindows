#if canImport(AppKit)
import LoveCore
import SwiftUI

public extension AboutWindow {
	struct AppInformationSection: View {
		private let options: Options

		@State private var hoveringOnVersion: Bool = false

		public init(options: Options) {
			self.options = options
		}

		public init() {
			self.init(options: .default)
		}

		public var body: some View {
			Image(nsImage: AppInformation.appIcon)
				.resizable()
				.frame(width: 128, height: 128)

			Text(AppInformation.appName)
				.font(.title.bold())

			if options.contains(.showVersion), let appVersion = AppInformation.appVersion {
				Button(action: { Pasteboard[String.self] = "\(AppInformation.appName) \(appVersion)" }) {
					Text(appVersion)
						.opacity(hoveringOnVersion ? 1 : 0.5)
						.overlay(alignment: .trailing) {
							Image(systemName: "doc.on.clipboard")
								.opacity(hoveringOnVersion ? 1 : 0)
								.offset(x: 20)
						}
				}
				.onHover { state in
					withAnimation(.easeOut(duration: 0.15)) {
						hoveringOnVersion = state
					}
				}
				.monospaced()
				.padding(.top, -8)
				.buttonStyle(.plain)
			}
		}
	}
}
#endif
