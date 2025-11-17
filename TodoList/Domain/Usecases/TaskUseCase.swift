//
//  TaskUseCase.swift
//  TodoList
//
//  Created by Gustavo Souto Pereira on 17/11/25.
//

import Foundation

protocol TaskUseCaseProtocol{
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func deleteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTasks(of date: Date) -> [Task]
}

final class TaskUseCase{
    private let taskRepository: TaskRepositoryProtocol
    
    init(taskRepository: TaskRepositoryProtocol) {
        self.taskRepository = taskRepository
    }
}

extension TaskUseCase: TaskUseCaseProtocol{
    func getTaskList() -> [Task] {
        taskRepository.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskRepository.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskRepository.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) -> [Task] {
        taskRepository.deleteTask(task: task)
    }
    
    func getCurrentSelectedDateTasks(of date: Date) -> [Task] {
        taskRepository.getCurrentSelectedDateTasks(of: date)
    }
}
