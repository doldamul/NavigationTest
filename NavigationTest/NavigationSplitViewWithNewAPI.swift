//
//  NavigationSplitViewWithNewAPI.swift
//  NavigationTest
//
//  Created by 돌다물 on 8/30/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct NavigationSplitViewWithNewAPI: View {
    @State var colorShown: Color?
    @State var title: String = "SplitView with New API"

    var body: some View {
        NavigationSplitView {
            /// 새 navigationDestination API는 NavigationLink의 value 인자와 연결되지 않는다.
            /// 애초에 List 없이 사용하는 것에 주안점을 두었기 때문.
            /// 아이폰의 세로모드 또는 아예 NavigationStack을 사용할 경우, List의 selection 인자와 연결하면
            /// NavigationLink 터치시 push/pop 트랜지션을 확인할 수 있으나,
            /// List의 selection 인자와 navigationDestination을 함께 사용하는 것은 금기시되며 그렇게 해야할 이유도 없다.
            List/*(selection: $colorShown)*/ {
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Pink", value: Color.pink)
                NavigationLink("Teal", value: Color.teal)
                Button("Mint") { colorShown = .mint }
                Button("Pink") { colorShown = .pink }
                Button("Teal") { colorShown = .teal }
            }
            .navigationTitle(title)
            .navigationDestination(item: $colorShown) { color in
                ColorDetail(color: color, title: $title)
            }
        } detail: {
            Text("detail view")
        }
    }
}

struct ColorDetail: View {
    let color: Color
    @Binding var title: String
    
    var body: some View {
        Circle().fill(color)
            .padding()
    }
}

struct NavigationSplitViewWithNewAPI_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            NavigationSplitViewWithNewAPI()
        } else {
            Text("new API is only available above iOS 17.0")
        }
    }
}
