import SwiftUI

package extension HorizontalEdge {
	/// Retrieve the associated horizontal alignment for this edge.
	var horizontalAlignment: HorizontalAlignment {
		switch self {
			case .leading: .leading
			case .trailing: .trailing
		}
	}

	/// Retrieve the associated inverse horizontal alignment for this edge.
	var inverseHorizontalAlignment: HorizontalAlignment {
		switch self {
			case .leading: .trailing
			case .trailing: .leading
		}
	}
}