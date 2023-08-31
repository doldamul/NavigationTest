//
//  NavigationSplitViewWithoutList.swift
//  NavigationTest
//
//  Created by 돌다물 on 8/30/23.
//

import SwiftUI

/// 정확히는 List의 selection 인자를 제외한 것이다.
/// 이렇게 사용하는 것에 딱히 장점은 없으나, 아무튼 가능하긴 하다.
struct NavigationSplitViewWithoutList: View {
    @State var values: [String] = Array(1...5).map { String($0) }
    
    var body: some View {
        NavigationSplitView {
            List(values.indices, id: \.self) { index in
                NavigationLink(value: index) {
                    Text(values[index])
                }
            }
            .listStyle(.inset)
            .navigationTitle("SplitView without list")
            .navigationDestination(for: Int.self) { index in
                SplitViewWithoutListDetailView(value: $values[index])
            }
        } detail: {
            Text("Select value")
        }
    }
}

struct SplitViewWithoutListDetailView: View {
    @Binding var value: String
    
    var body: some View {
        Text("detail view")
            .onAppear {
                value.append(" ")
                value.removeLast()
            }
    }
}

struct NavigationSplitViewWithoutList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitViewWithoutList()
    }
}

