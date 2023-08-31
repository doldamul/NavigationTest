//
//  StateValueNavigation.swift
//  NavigationTest
//
//  Created by 돌다물 on 8/30/23.
//

import SwiftUI

struct StateValueNavigation: View {
    @State var values: [String] = Array(1...5).map { String($0) }
    
    var body: some View {
        NavigationStack {
            List(values.indices, id: \.self) { index in
                NavigationLink(value: index) {
                    Text(values[index])
                }
            }
            .listStyle(.inset)
            .navigationTitle("Navigation")
            .navigationDestination(for: Int.self) { index in
                StateValueDetailView(value: $values[index])
            }
        }
    }
}

struct StateValueDetailView: View {
    @Binding var value: String
    
    var body: some View {
        Text("detail view")
            .onAppear {
                value.append(" ")
                value.removeLast()
            }
    }
}

struct StateValueNavigation_Previews: PreviewProvider {
    static var previews: some View {
        StateValueNavigation()
    }
}
