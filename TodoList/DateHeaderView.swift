//
//  DateHeaderView.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

struct DateHeaderView: View {
    
    @EnvironmentObject var dateManager: DateManager
    
    var body: some View {
        ZStack {
            VStack {
                nameHeaderText()
                DateSliderView{ week in
                    DateView(week: week)
                }
                .frame(height: 60, alignment: .top)
                
                Divider()
                
                HStack {
                    Spacer()
                    Text(dateManager.selectedDate.toString(format: "EEEE, dd.MM.yyyy"))
                        .font(.system(size: 10, design: .rounded))
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    @ViewBuilder
    private func nameHeaderText() -> some View {
        HStack {
            VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                Text("Hi, Gustavo")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .padding(4)

                Text(dateManager.selectedDate == Calendar.current.startOfDay(for: Date()) ? "What's up for today?" : "Planning for future?")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(.primary)
                    .padding(4)
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text(dateManager.selectedDate.monthToString())
                    .font(.system(size: 10)).fontWeight(.heavy)
                    .foregroundStyle(.primary)

                Button {
                    withAnimation(.linear(duration: 0.1)) {
                        dateManager.selectToday()
                    }
                } label: {
                    Text("Today")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(4)
                        .background(.black)
                        .cornerRadius(4)
                }
            }
        }
    }
}

#Preview {
    DateHeaderView()
}
