//
//  ObservableObjectNavigation.swift
//  NavigationTest
//
//  Created by 돌다물 on 8/30/23.
//

import SwiftUI

class Obj: ObservableObject, Identifiable {
    @Published var value: String
    init(_ value: String = "") {
        self.value = value
    }
}

extension Obj: Hashable {
    static func == (lhs: Obj, rhs: Obj) -> Bool {
        lhs.value == rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

class ObjArray: ObservableObject {
    @Published var array: [Obj] = [Obj(), Obj("1"), Obj("2"), Obj("3")]
}

struct ObservableObjectNavigation: View {
    @StateObject var objects = ObjArray()
    
    var body: some View {
        NavigationStack {
            List(objects.array) { object in
                NavigationLink(value: object) {
                    Text(object.value)
                }
                .onReceive(object.objectWillChange) {
                    objects.objectWillChange.send()
                }
            }
            .listStyle(.inset)
            .navigationTitle("observable object")
            .navigationDestination(for: Obj.self) { obj in
                ObjectDetailView(object: obj)
            }
        }
    }
}

struct ObjectDetailView: View {
    @ObservedObject var object: Obj
    
    var body: some View {
        Text("detail view")
            .onAppear {
//                object.value += ""
                object.objectWillChange.send()
            }
    }
}

struct ObservableObjectNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectNavigation()
    }
}
