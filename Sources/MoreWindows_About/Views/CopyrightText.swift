import _MoreWindowsCommon
import SwiftUI

/// A text view with the copyright string found in the main bundle.
///
/// If a copyright string could not be found, the view will not be visible.
public struct CopyrightText: View {
	public init() { }

	public var body: some View {
		if let copyright = AppInformation.copyright {
			Text(copyright)
		}
	}
}
