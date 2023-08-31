//
//  ContentView.swift
//  NavigationTest
//
//  Created by 돌다물 on 8/30/23.
//

import SwiftUI

@available(iOS 17.0, *)
@Observable
class MyObject: Identifiable {
    var value: String
    
    init(_ value: String = "") {
        self.value = value
    }
}

@available(iOS 17.0, *)
extension MyObject: Hashable {
    static func ==(lhs: MyObject, rhs: MyObject) -> Bool {
        lhs.value == rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

@available(iOS 17.0, *)
struct MacroObservableNavigation: View {
    @State var objects: [MyObject] = [MyObject(), MyObject("1"), MyObject("2"), MyObject("3")]
    
    var body: some View {
        NavigationStack {
            List(objects) { object in
                NavigationLink(value: object) {
                    Text(object.value)
                }
            }
            .listStyle(.inset)
            .navigationTitle("macro observable")
            .navigationDestination(for: MyObject.self) { obj in
                ObservableDetailView(object: obj)
            }
        }
    }
}

@available(iOS 17.0, *)
struct ObservableDetailView: View {
    @Bindable var object: MyObject
    
    var body: some View {
        Text("detail view")
            .onAppear {
                object.value += ""
            }
    }
}

struct MacroObservableNavigation_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            MacroObservableNavigation()
        } else {
            Text("Macro is only available above iOS 17.0")
        }
    }
}
