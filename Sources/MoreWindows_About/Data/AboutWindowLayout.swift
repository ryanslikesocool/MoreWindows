/// The layout style of an ``About`` window.
public enum AboutWindowLayout: UInt8 {
	/// Provide custom content for the about window.
	///
	/// Using this layout will ignore any ``AboutWindowOptions``.
	case custom
	/// Display the about window as a vertical stack, with app information at the top, copyright at the bottom, and custom content in the middle.
	case vertical
}
