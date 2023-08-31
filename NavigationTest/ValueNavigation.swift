//
//  ValueNavigation.swift
//  NavigationTest
//
//  Created by 돌다물 on 8/30/23.
//

import SwiftUI

struct ValueNavigation: View {
    let values: [String] = Array(1...5).map { String($0) }
    
    var body: some View {
        NavigationStack {
            List(values, id: \.self) { value in
                NavigationLink(value: value) {
                    Text(value)
                }
            }
            .listStyle(.inset)
            .navigationTitle("pure value") 
            .navigationDestination(for: String.self) { value in
                ValueDetailView(value: value)
            }
        }
    }
}

struct ValueDetailView: View {
    let value: String
    
    var body: some View {
        Text("detail view")
    }
}

struct ValueNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ValueNavigation()
    }
}
