//
//  TodoListMVVMApp.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

func makeTasksHomePageViewModel() -> TasksHomePageViewModel {
    let dateDataProvider = DateDataProvider()
    let dateRepository = DateRepository(dateDataProvider: dateDataProvider)
    let dateUseCase = DateUseCase(dateRepository: dateRepository)
    
    let taskDataProvider = TaskDataProvider()
    let taskRepository = TaskRepository(taskDataProvider: taskDataProvider)
    let taskUseCase = TaskUseCase(taskRepository: taskRepository)
    
    return TasksHomePageViewModel(dateUseCase: dateUseCase, taskUseCase: taskUseCase)
}

@main
struct TodoListApp: App {
    
    var body: some Scene {
        WindowGroup {
            TasksHomePage(viewModel: makeTasksHomePageViewModel())
                .preferredColorScheme(.light)
        }
    }
}
