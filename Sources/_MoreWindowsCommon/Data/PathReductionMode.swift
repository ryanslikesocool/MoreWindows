package enum PathReductionMode {
	/// Abbreviate the pattern
	case abbreviate
	
	/// Remove the pattern.
	case remove
}

// MARK: - Sendable

extension PathReductionMode: Sendable { }

// MARK: - Equatable

extension PathReductionMode: Equatable { }

// MARK: - Hashable

extension PathReductionMode: Hashable { }
