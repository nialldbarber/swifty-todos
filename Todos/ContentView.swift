//
//  ContentView.swift
//  Todos
//
//  Created by Niall Barber on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var todos = TodosManager()
    
    var body: some View {
        VStack {
            Text("Todo List")
                .font(.title)
                .fontWeight(.bold)
            
            List(todos.todos) { todo in
                VStack(alignment: .leading) {
                    Text(todo.title)
                        .font(.headline)
                    Text(todo.completed ? "Completed" : "Not Completed")
                        .font(.subheadline)
                }
            }
            
            Button(action: {
                todos.fetchTodos()
            }) {
                Text("Fetch todos")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
