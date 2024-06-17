struct LauncherWindowSize {
	let welcomeAreaWidth: Double
	let recentItemsAreaWidth: Double
	let height: Double

	init(welcomeAreaWidth: Double, recentItemsAreaWidth: Double, height: Double) {
		self.welcomeAreaWidth = welcomeAreaWidth
		self.recentItemsAreaWidth = recentItemsAreaWidth
		self.height = height
	}
}

// MARK: - Constants

extension LauncherWindowSize {
	static var `default`: Self {
		Self(welcomeAreaWidth: 460, recentItemsAreaWidth: 280, height: 430)
	}
}
