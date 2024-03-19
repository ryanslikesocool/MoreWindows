#if canImport(AppKit)
import simd
import SwiftUI

struct AppIconView: View {
	@Environment(\.colorScheme) private var colorScheme
	@Environment(\.launcherOptions) private var launcherOptions
	@Environment(\.launcherIconOptions) private var launcherIconOptions
	@State private var scale: CGFloat = Self.scaleRange.lowerBound
	@State private var rotationAngle: Double = .zero
	@State private var rotationAxis: SIMD2<Double> = .zero
	@State private var shadowRadius: Double = Self.shadowRadiusRange.lowerBound

	var body: some View {
		Group {
			if launcherIconOptions.hasHoverInteraction {
				icon
					.onContinuousHover(coordinateSpace: .local) { hoverPhase in
						switch hoverPhase {
							case let .active(location):
								updateInteractive(location)
							case .ended:
								resetInteractive()
						}
					}
					.scaleEffect(scale)
					.rotation3DEffect(.radians(rotationAngle), axis: (-rotationAxis.y, rotationAxis.x, 0), perspective: 0.5)
					.shadow(
						color: launcherIconOptions.contains(.hoverShadow) && (colorScheme == .light || !launcherIconOptions.contains(.glowInTheDark))
							? .shadow.opacity(colorScheme == .light ? 0.333 : 0.5)
							: .clear,
						radius: shadowRadius,
						y: shadowRadius * 0.333
					)
			} else {
				icon
			}
		}
		.background {
			if launcherIconOptions.contains(.glowInTheDark), colorScheme == .dark {
				icon
					.offset(y: Self.glowRadius * 0.666)
					.blur(radius: Self.glowRadius)
					.blendMode(.softLight)
			}
		}
	}
}

private extension AppIconView {
	static let iconSize: Double = 128
	static let glowRadius: Double = 32
	static let scaleRange: ClosedRange<CGFloat> = 1.0 ... 1.05
	static let rotationStrength: Double = 0.001
	static let shadowRadiusRange: ClosedRange<CGFloat> = 0.0 ... 8.0
	static let animation: Animation = .interactiveSpring(duration: 0.2, extraBounce: 0.1, blendDuration: 1)
}

private extension AppIconView {
	var icon: some View {
		Image(nsImage: NSApp.applicationIconImage)
			.resizable()
			.frame(size: Self.iconSize)
	}
}

private extension AppIconView {
	func updateInteractive(_ location: CGPoint) {
		let centeredLocation: SIMD2<Double> = SIMD2<Double>(location - Self.iconSize * 0.5)

		withAnimation(Self.animation) {
			if launcherIconOptions.contains(.hoverScale) {
				scale = Self.scaleRange.upperBound
			}
			if launcherIconOptions.contains(.hoverRotation) {
				rotationAngle = simd.length(centeredLocation) * Self.rotationStrength
				rotationAxis = simd.normalize(centeredLocation)
			}
			if launcherIconOptions.contains(.hoverShadow) {
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
#endif
