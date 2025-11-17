//
//  TaskListView.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TasksHomePageViewModel
    var currentDateTasks: [Task] = []

    init(viewModel: TasksHomePageViewModel) {
        self.viewModel = viewModel
        currentDateTasks = viewModel.getCurrentSelectedDateTasks()
    }

    var body: some View {
        VStack {
            ForEach(currentDateTasks) { task in
                TaskListItem(task: task, onPress: { Task in
                    toggleTaskCompletion(task: task)
                }, onLongPress: { Task in
                    deleteTask(task: task)
                })
                    .background(alignment: .leading) {
                        if currentDateTasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 12, y: 20)
                        }
                    }
            }
        }
        .padding(.top, 15)
    }

    func toggleTaskCompletion(task: Task){
        viewModel.toggleTaskCompletion(task: task)
    }
    func deleteTask(task: Task){
        viewModel.deleteTask(task: task)
    }
}

#Preview {
    TasksHomePage(viewModel: makeTasksHomePageViewModel())
}
