//
//  TodosManager.swift
//  Todos
//
//  Created by Niall Barber on 10/01/2024.
//

import Foundation

struct Todo: Decodable, Identifiable {
    var id: Int
    var title: String
    var completed: Bool
}

class TodosManager: ObservableObject {
    @Published var todos = [Todo]()
    
    func fetchTodos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Todo].self, from: data) {
                    DispatchQueue.main.async {
                        self.todos = decodedResponse
                    }
                }
            }
            if error != nil {
                print("Error fetching data")
            }
        }.resume()
    }
}
