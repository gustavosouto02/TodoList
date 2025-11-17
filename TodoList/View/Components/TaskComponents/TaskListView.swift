//
//  TaskListView.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

struct TaskListView: View {
    @Binding var date: Date
    @Binding var items: [Task]
    var currentDateTasks: [Task] = []

    init(date: Binding<Date>, items: Binding<[Task]>) {
        self._date = date
        self._items = items
        currentDateTasks = getCurrentDateTasks()
    }

    var body: some View {
        VStack {
            ForEach(currentDateTasks) { task in
                TaskListItem(task: task)
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

    func getCurrentDateTasks() -> [Task] {
        return items.filter {
            $0.date.toString(format: "EEEE, dd.MM.yyyy")
                == date.toString(format: "EEEE, dd.MM.yyyy")
        }.sorted { !$0.isCompleted && $1.isCompleted }
    }
}

#Preview {
    ContentView()
        .environmentObject(DateController())
        .environmentObject(TaskListController())
}
