package enum PathReductionOption {
	/// The user's home directory.
	case home(mode: PathReductionMode)

	/// The user's iCloud directory.
	case cloud(mode: PathReductionMode, removeAppName: Bool)
}
