#if canImport(AppKit)
import LoveCore
import SwiftUI

public struct DWLFooter: View {
	public init() { }

	public var body: some View {
		VStack {
			Group {
				Text(AppInformation.copyright ?? "© Ryan Boyer")
				Text("Developed With Love")
				Text("Colorado, USA")
			}
			.font(.system(.footnote, design: .monospaced))
			.multilineTextAlignment(.center)
			.opacity(0.5)
			
			Image("heart.pixel.fill", bundle: .loveCore)
				.symbolRenderingMode(.multicolor)
				.offset(y: 2)
		}
	}
}
#endif
