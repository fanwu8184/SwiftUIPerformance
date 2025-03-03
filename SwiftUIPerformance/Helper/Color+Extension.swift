import Foundation
import SwiftUI

public extension Color {
  static func random(opacity: Double = 0.4) -> Color {
    Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1),
      opacity: opacity
    )
  }
}
