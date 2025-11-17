//
//  ContentView.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var createNewTask: Bool = false
    @EnvironmentObject var weekManager: DateController
    @EnvironmentObject var taskListController: TaskListController
    
    var body: some View {
        ZStack{
            VStack{
                DateHeaderView()
                ScrollView(.vertical){
                    VStack{
                        TaskListView(date: $weekManager.selectedDate, items: $taskListController.items)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
            .overlay(alignment: .bottomTrailing){
                Button{
                    createNewTask.toggle()
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .padding(26)
                        .background(.black)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
            }
        }
        .sheet(isPresented: $createNewTask){
            NewTaskView().presentationDetents([.fraction(0.4)])
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DateController())
        .environmentObject(TaskListController())
}
