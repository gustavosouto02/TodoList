//
//  TaskRepository.swift
//  TodoList
//
//  Created by Gustavo Souto Pereira on 17/11/25.
//

import Foundation

protocol TaskRepositoryProtocol {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func deleteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTasks(of date: Date) -> [Task]
}

class TaskRepository{
    private let taskDataProvider: TaskDataProviderProtocol
    
    init(taskDataProvider: TaskDataProviderProtocol) {
        self.taskDataProvider = taskDataProvider
    }
}

extension TaskRepository: TaskRepositoryProtocol {
  
    func getCurrentSelectedDateTasks(of date: Date) -> [Task] {
        taskDataProvider.getCurrentSelectedDateTasks(of: date)
    }
    
    func getTaskList() -> [Task] {
        taskDataProvider.getTaskList()
    }
    
    func deleteTask(task: Task) -> [Task] {
        taskDataProvider.deleteTask(task: task)
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskDataProvider.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskDataProvider.toggleTaskCompletion(task: task)
    }
}
