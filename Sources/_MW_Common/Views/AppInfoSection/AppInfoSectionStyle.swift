import SwiftUI

/// A type that applies a custom appearance to all app info sections within a view.
///
/// To configure the current app info section style for a view hierarchy, use the
/// ``SwiftUICore/View/appInfoSectionStyle(_:)`` modifier.
public protocol AppInfoSectionStyle: Sendable {
	/// A view that represents the body of an app info section.
	associatedtype Body: View

	/// The properties of an app info section.
	typealias Configuration = AppInfoSectionStyleConfiguration

	/// Creates a view that represents the body of an app info section.
	///
	/// The system calls this method for each ``AppInfoSection`` instance in a view
	/// hierarchy where this style is the current app info section style.
	///
	/// - Parameter configuration: The properties of the app info section.
	@ViewBuilder @MainActor
	func makeBody(configuration: Self.Configuration) -> Self.Body
}
