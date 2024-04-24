/// The layout style of an ``About`` window.
public enum AboutWindowLayout: UInt8 {
	/// Provide custom content for the about window.
	///
	/// Using this layout will ignore any ``AboutWindowOptions``.
	case custom
	/// Display the about window as a vertical list, with app information at the top.
	case verticalList
	/// Display the about window in a horizontal layout, with app information on the left side and additional information on the right side.
	case horizontal
}
