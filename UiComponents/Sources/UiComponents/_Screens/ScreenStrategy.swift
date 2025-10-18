
import SwiftUI

struct ScreenStrategy<Content: View, BottomBar: View>: View {
    private let content: () -> Content
    private let bottomBar: () -> BottomBar

    init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder bottomBar: @escaping () -> BottomBar
    ) {
        self.content = content
        self.bottomBar = bottomBar
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                content()
            }
            .fillMaxSize()
            bottomBar()
        }
        
    }
}
