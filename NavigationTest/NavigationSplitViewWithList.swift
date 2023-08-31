//
//  NavigationSplitViewWithList.swift
//  NavigationTest
//
//  Created by 돌다물 on 8/30/23.
//

import SwiftUI

struct NavigationSplitViewWithList: View {
    @State var values: [String] = Array(1...5).map { String($0) }
    @State var selectedIndex: Int?
    
    var body: some View {
        NavigationSplitView {
            List(values.indices, id: \.self, selection: $selectedIndex) { index in
                NavigationLink(value: values[index]) {
                    Text(values[index])
                }
            }
            .listStyle(.inset)
            .navigationTitle("SplitView with list")
        } detail: {
            if let selectedIndex {
                SplitViewDetailView(value: $values[selectedIndex])
            } else {
                Text("Empty")
            }
        }
    }
}

struct SplitViewDetailView: View {
    @Binding var value: String
    
    var body: some View {
        Text("detail view")
    }
}

struct NavigationSplitViewWithList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitViewWithList()
    }
}
