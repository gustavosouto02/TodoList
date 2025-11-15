//
//  TaskListItem.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

struct TaskListItem: View {
    @EnvironmentObject var items: TaskListManager
    var task: Task
    
    var deleteAlert: Alert {
        Alert(title: Text("Hey"),
              message: Text("Are you sure you want to delete this task?"),
              primaryButton: .destructive(Text("Delete"), action: deleteTask),
              secondaryButton: .cancel())
    }
    
    @State var showAlert: Bool = false
    
    
    
    var body: some View {
        HStack{
            Circle()
                .fill(.gray.opacity(0.1))
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                .frame(width: 25, height: 25)
                .overlay{
                    Circle()
                        .fill(task.isCompleted ? Color.green.opacity(0.4) : Color.blue.opacity(0.4))
                }
            
            VStack{
                Text(task.title)
                    .font(.system(size: 15, weight: .medium))
                    
            }
            .padding()
            .background(task.isCompleted ? Color.green.opacity(0.4) : Color.blue.opacity(0.4))
            .clipShape(.rect(cornerRadius: 10))
            
            
            Spacer()
        }
        .onTapGesture {
            withAnimation {
                items.toggleTaskCompletion(task: task)
            }
        }
        .onLongPressGesture{
            self.showAlert = true
        }
        .alert(isPresented: $showAlert) {
            deleteAlert
        }
    }
    func deleteTask() {
        items.deleteTask(task: task)
    }
}

#Preview {
    ContentView()
        .environmentObject(DateManager())
        .environmentObject(TaskListManager())
}
