import SwiftUI

/// A view displaying the app's icon.
///
/// Change the appearance by setting environment values using ``SwiftUI/View/appIconOptions(_:)``.
/// 
/// - SeeAlso:
///   - ``AppIconOptions``
///   - ``SwiftUI/View/appIconOptions(_:)``
///   - ``SwiftUI/Scene/appIconOptions(_:)``
public struct AppIconView: View {
	@Environment(\.colorScheme) private var colorScheme
	@Environment(\.appIconOptions) private var appIconOptions
	@State private var scale: CGFloat = Self.scaleRange.lowerBound
	@State private var rotationAngle: Double = .zero
	@State private var rotationAxis: CGVector = .zero
	@State private var shadowRadius: Double = Self.shadowRadiusRange.lowerBound

	/// Initialize the view.
	public init() { }

	public var body: some View {
		GeometryReader { geometry in
			if appIconOptions.hasHoverInteraction {
				makeIcon()
					.onContinuousHover(coordinateSpace: .local) { hoverPhase in
						updateHover(phase: hoverPhase, in: geometry.size)
					}
					.scaleEffect(scale)
					.rotation3DEffect(.radians(rotationAngle), axis: (-rotationAxis.dy, rotationAxis.dx, 0), perspective: 0.5)
					.shadow(
						color: appIconOptions.contains(.hoverShadow) && (colorScheme == .light || !appIconOptions.contains(.glowInTheDark))
							? .black.opacity(colorScheme == .light ? 0.333 : 0.5)
							: .clear,
						radius: shadowRadius,
						y: shadowRadius * 0.333
					)
			} else {
				makeIcon()
			}
		}
		.background(content: makeBackground)
		.aspectRatio(contentMode: .fit)
	}
}

// MARK: - Constants

private extension AppIconView {
	static let glowRadius: Double = 32
	static let scaleRange: ClosedRange<CGFloat> = 1.0 ... 1.05
	static let rotationStrength: Double = 0.001
	static let shadowRadiusRange: ClosedRange<CGFloat> = 0.0 ... 8.0
	static let animation: Animation = .interactiveSpring(duration: 0.2, extraBounce: 0.1, blendDuration: 1)
}

// MARK: - Supporting Views

private extension AppIconView {
	func makeIcon() -> some View {
		Image(nsImage: NSApplication.shared.applicationIconImage)
			.resizable()
	}

	@ViewBuilder
	func makeBackground() -> some View {
		if
			appIconOptions.contains(.glowInTheDark),
			colorScheme == .dark
		{
			makeIcon()
				.offset(y: Self.glowRadius * 0.666)
				.blur(radius: Self.glowRadius)
				.blendMode(.softLight)
		}
	}
}

// MARK: - Functions

private extension AppIconView {
	func updateHover(phase hoverPhase: HoverPhase, in viewSize: CGSize) {
		switch hoverPhase {
			case let .active(location):
				updateInteractive(location, size: viewSize)
			case .ended:
				resetInteractive()
		}
	}

	func updateInteractive(_ location: CGPoint, size: CGSize) {
		let centeredLocation: CGPoint = CGPoint(
			x: location.x - size.width * 0.5,
			y: location.y - size.height * 0.5
		)

		withAnimation(Self.animation) {
			if appIconOptions.contains(.hoverScale) {
				scale = Self.scaleRange.upperBound
			}
			if appIconOptions.contains(.hoverRotation) {
				let centeredLocationLength = sqrt(
					(centeredLocation.x * centeredLocation.x)
						+ (centeredLocation.y * centeredLocation.y)
				)

				rotationAngle = centeredLocationLength * Self.rotationStrength
				rotationAxis = CGVector(
					dx: centeredLocation.x / centeredLocationLength,
					dy: centeredLocation.y / centeredLocationLength
				)
			}
			if appIconOptions.contains(.hoverShadow) {
				shadowRadius = Self.shadowRadiusRange.upperBound
			}
		}
	}

	func resetInteractive() {
		withAnimation(Self.animation) {
			scale = Self.scaleRange.lowerBound
			rotationAxis = .zero
			rotationAngle = .zero
			shadowRadius = Self.shadowRadiusRange.lowerBound
		}
	}
}
