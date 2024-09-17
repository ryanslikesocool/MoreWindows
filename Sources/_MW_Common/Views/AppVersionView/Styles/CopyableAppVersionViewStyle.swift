import SwiftUI

public struct CopyableAppVersionViewStyle: AppVersionViewStyle {
	private let iconEdge: HorizontalEdge?
	private let hoverAnimation: Animation

	public init(
		copyAppName: Bool = Self.defaultCopyAppName,
		iconEdge: HorizontalEdge? = Self.defaultIconEdge,
		hoverAnimation: Animation = Self.defaultHoverAnimation
	) {
		self.iconEdge = iconEdge
		self.hoverAnimation = hoverAnimation
	}

	public func makeBody(configuration: Configuration) -> some View {
		let baseText = Text(verbatim: configuration.versionString)

		if let iconEdge {
			Self.addOverlay(edge: iconEdge) {
				baseText
			}
		} else {
			baseText
		}
	}
}

// MARK: - Supporting Views

private extension CopyableAppVersionViewStyle {
	static func addOverlay(edge iconEdge: HorizontalEdge, to baseView: () -> some View) -> some View {
		let iconHorizontalAlignment: HorizontalAlignment = switch iconEdge {
			case .leading: .leading
			case .trailing: .trailing
		}
		let oppositeIconHorizontalAlignment: HorizontalAlignment = switch iconEdge {
			case .leading: .trailing
			case .trailing: .leading
		}
		let iconAlignment: Alignment = Alignment(horizontal: iconHorizontalAlignment, vertical: .center)

		return baseView()
			.overlay(alignment: iconAlignment) {
				Image(systemName: "doc.on.clipboard")
//					.opacity(isHovering ? 1 : 0)
					.alignmentGuide(iconHorizontalAlignment) { d in
						d[oppositeIconHorizontalAlignment]
					}
			}
	}
}

// MARK: - Constants

public extension CopyableAppVersionViewStyle {
	static let defaultCopyAppName: Bool = true
	static let defaultIconEdge: HorizontalEdge? = .trailing
	static let defaultHoverAnimation: Animation = .easeOut(duration: 0.15)
}

// MARK: - Convenience

public extension AppVersionViewStyle where
	Self == CopyableAppVersionViewStyle
{
	static func copyable(
		iconEdge: HorizontalEdge? = Self.defaultIconEdge,
		hoverAnimation: Animation = Self.defaultHoverAnimation
	) -> Self {
		Self(
			iconEdge: iconEdge,
			hoverAnimation: hoverAnimation
		)
	}
}
