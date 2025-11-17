//
//  DateHeaderView.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

struct DateHeaderView: View {
    
    @ObservedObject var viewModel: TasksHomePageViewModel

    var body: some View {
        ZStack {
            VStack {
                nameHeaderText()
                DateSliderView(viewModel: viewModel){ week in
                    DateView(viewModel: viewModel, week: week)
                }
                .frame(height: 60, alignment: .top)
                
                Divider()
                
                HStack {
                    Spacer()
                    Text(viewModel.selectedDate.toString(format: "EEEE, dd.MM.yyyy"))
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

                Text(viewModel.getSelectedDate() == Calendar.current.startOfDay(for: Date()) ? "What's up for today?" : "Planning for future?")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(.primary)
                    .padding(4)
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text(viewModel.getSelectedDate().monthToString())
                    .font(.system(size: 10)).fontWeight(.heavy)
                    .foregroundStyle(.primary)

                Button {
                    withAnimation(.linear(duration: 0.1)) {
                        viewModel.selectTheDay(with: Date())
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
    TasksHomePage(viewModel: makeTasksHomePageViewModel())
}
