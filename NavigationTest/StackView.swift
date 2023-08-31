//
//  StackView.swift
//  NavigationTest
//
//  Created by 돌다물 on 8/30/23.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        TabView {
            ValueNavigation()
                .tabItem { Label("value", systemImage: "square.stack") }
            StateValueNavigation()
                .tabItem { Label("state", systemImage: "square.stack") }
            ObservableObjectNavigation()
                .tabItem { Label("object", systemImage: "square.stack") }
            if #available(iOS 17.0, *) {
                MacroObservableNavigation()
                    .tabItem { Label("macro", systemImage: "square.stack") }
            }
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
