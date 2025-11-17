//
//  NewTaskView.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 07/11/25.
//

import SwiftUI

struct NewTaskView: View {
    
    var saveTask: (Task) -> ()
    @State private var taskTitle: String = ""
    @State private var taskdate: Date = .init()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Add new task")
                .fontDesign(.rounded)
                .font(.title2)
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(
                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                )
            
            VStack(alignment: .center, spacing: 30){
                TextField("Your task title", text: $taskTitle)
                    .padding()
                    .border(Color.gray, width: 2).cornerRadius(6)

                
                
                HStack{
                    Text("Timeline")
                        .font(.title3)
                
                    DatePicker("", selection: $taskdate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
            }
            .padding(30)
            
            Button{
                saveTask(Task(title: taskTitle, date: taskdate))
                dismiss()
            }label: {
                Text("Create Task")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .foregroundStyle(.white)
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    NewTaskView() { task in 
        
    }
}
