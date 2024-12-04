//
//  ContentView.swift
//  moderna24SwiftDataProject
//
//  Created by Andreas Nygren on 2024-12-03.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var thingsToDo: [ThingToDo]
    
    @State var addThingToDo = ""

    var body: some View {
        
        VStack {
            TextField("Name", text: $addThingToDo)
            Button(action: addThingTodo) {
                Text("Add")
            }
        }
        
        List {
            ForEach(thingsToDo) { thing in
                
                HStack {
                    Text("Uppgift: \(thing.thingToDo)")
                        .bold()
                    Spacer()
                    Button(thing.done ? "Klar" : "Ej klar") {
                        thing.done.toggle()
                    }
                }
            }
            .onDelete(perform: deleteThings)
        }
    }
    
    private func addThingTodo() {
        withAnimation {
            let newThingTodo = ThingToDo(thingToDo: addThingToDo, done: false)
            modelContext.insert(newThingTodo)
        }
    }

    private func deleteThings(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(thingsToDo[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ThingToDo.self, inMemory: true)
}
