//
//  TodoListMVVMApp.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var dateController = DateController()
    @StateObject var taskListController = TaskListController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dateController)
                .environmentObject(taskListController)
                .preferredColorScheme(.light)
        }
    }
}
