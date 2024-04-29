/// Modes for standard window buttons (traffic lights).
public enum WindowButtonMode {
	/// Indicates that a window button is visible and interactive.
	case enabled
	/// Indicates that a window button is visible, but not interactive.
	case disabled
	/// Indicates that a window button is not visible.
	case hidden
}

extension WindowButtonMode {
	var isEnabled: Bool {
		switch self {
			case .disabled: false
			default: true
		}
	}

	var isHidden: Bool {
		switch self {
			case .hidden: true
			default: false
		}
	}
}
