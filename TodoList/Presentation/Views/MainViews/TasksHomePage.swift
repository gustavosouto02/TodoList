//
//  ContentView.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

struct TasksHomePage: View {
    
    @State private var createNewTask: Bool = false
    @ObservedObject var viewModel: TasksHomePageViewModel

    
    var body: some View {
        ZStack{
            VStack{
                DateHeaderView(viewModel: viewModel)
                ScrollView(.vertical){
                    VStack{
                        TaskListView(viewModel: viewModel)
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
            NewTaskView(){ task in
                viewModel.updateTaskList(task: task)
            }.presentationDetents([.fraction(0.4)])
        }
    }
}

#Preview {
    TasksHomePage(viewModel: TasksHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDataProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
