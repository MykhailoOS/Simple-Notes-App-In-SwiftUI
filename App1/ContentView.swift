//
//  ContentView.swift
//  App1
//
//  Created by Misha ✌️👌 on 21.04.2024.
//

import SwiftUI



struct ContentView: View {
    @State private var isExist = false
    @State private var userCurrentTaskDelete = false
    @State private var userCurrentTask = ""
    @State private var homeTasks = [String]()
    @State private var showAllTasks = false
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Добавить задачу", text: $userCurrentTask)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .navigationTitle("Заметки")
                // Add new notes
                Button(action: {
                    self.isExist.toggle()
                    if self.isExist {
                        self.homeTasks.append(self.userCurrentTask)
                    }
                }, label: {
                    Image(systemName: "plus.app.fill")
                })
                Divider()
                // Clear all notes
                Button(action: {
                    self.userCurrentTaskDelete.toggle()
                    if self.userCurrentTaskDelete && !self.homeTasks.isEmpty{
                        self.homeTasks.removeAll()
                    }
                }, label: {
                    Image(systemName: "minus.circle.fill")
                })

                Toggle(isOn: $showAllTasks, label: {
                    Text("Показать заметки")
                })
                .padding()
                Divider()
                Spacer()
                // Show all current notes
                if !self.homeTasks.isEmpty && self.showAllTasks {
                    Spacer()
                    Text("Текущее заметки:")
                    ForEach(self.homeTasks, id: \.self) {
                        Text("\($0)")
                        
                    }
                Spacer()
                    
                }
                
            }
            
        }
        
    }

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
