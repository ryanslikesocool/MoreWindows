import Foundation

extension LocalizedStringResource.BundleDescription {
	/// Returns the resource bundle associated with the current Swift module.
	static let module: Self = .atURL(Bundle.module.bundleURL)
}