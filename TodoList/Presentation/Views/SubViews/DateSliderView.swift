//
//  DateSliderView.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

struct DateSliderView<DateViewContent: View>: View {
    
    @ObservedObject var viewModel: TasksHomePageViewModel
    @State private var activeTab: Int = 1
    @State private var position = CGSize.zero
    @GestureState private var dragOffset = CGSize.zero
    @State private var direction: SliderTimeDirection = .unknown
    
    let dateViewContext: (_ week: WeekModel) -> DateViewContent
    
    init(viewModel: TasksHomePageViewModel,@ViewBuilder dateViewContext: @escaping (_ week: WeekModel) -> DateViewContent){
        self.viewModel = viewModel
        self.dateViewContext = dateViewContext
    }
    
    var body: some View {
        TabView(selection: $activeTab){
            dateViewContext(viewModel.weeks[0])
                .frame(maxWidth: .infinity)
                .tag(0)
            
            dateViewContext(viewModel.weeks[1])
                .frame(maxWidth: .infinity)
                .tag(1)
                .onDisappear(){
                    guard direction != .unknown else { return }
                    viewModel.onDateScrolled(to: direction)
                    direction = .unknown
                    activeTab = 1
                }
            
            dateViewContext(viewModel.weeks[2])
                .frame(maxWidth: .infinity)
                .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: activeTab) {_, value in
            if value == 0 {
                direction = .past
            } else if value == 2 {
                direction = .future
            }
        }
    }
}

#Preview {
    TasksHomePage(viewModel: makeTasksHomePageViewModel())
}
