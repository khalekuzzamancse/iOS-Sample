import SwiftUI

public extension View {
   public func fillMaxWidth(alignment: Alignment = .leading) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
}

