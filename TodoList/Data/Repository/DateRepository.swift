//
//  DateRepository.swift
//  TodoList
//
//  Created by Gustavo Souto Pereira on 17/11/25.
//

import Foundation


protocol DateRepositoryProtocol {
    func calculatePassAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateRepository{
    private let dateDataProvider: DateDataProviderProtocol
    
    init(dateDataProvider: DateDataProviderProtocol) {
        self.dateDataProvider = dateDataProvider
    }
}

extension DateRepository: DateRepositoryProtocol {
    func calculatePassAndFutureWeeks(with date: Date) -> [WeekModel] {
        return dateDataProvider.calculatePassAndFutureWeeks(with: date)
    }
}
