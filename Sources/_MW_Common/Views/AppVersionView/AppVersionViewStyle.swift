import SwiftUI

public protocol AppVersionViewStyle {
	associatedtype Body: View
	typealias Configuration = AppVersionViewStyleConfiguration

	@ViewBuilder
	func makeBody(configuration: Self.Configuration) -> Self.Body
}
