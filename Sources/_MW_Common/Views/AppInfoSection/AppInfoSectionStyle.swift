import SwiftUI

public protocol AppInfoSectionStyle {
	associatedtype Body: View
	typealias Configuration = AppInfoSectionStyleConfiguration

	@ViewBuilder
	func makeBody(configuration: Self.Configuration) -> Self.Body
}