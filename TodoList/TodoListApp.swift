//
//  TodoListMVVMApp.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var dateManager = DateManager()
    @StateObject var taskListManager = TaskListManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dateManager)
                .environmentObject(taskListManager)
        }
    }
}
