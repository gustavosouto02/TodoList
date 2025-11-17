//
//  DateUseCase.swift
//  TodoList
//
//  Created by Gustavo Souto Pereira on 17/11/25.
//

import Foundation

protocol DateUseCaseProtocol {
    func calculatePassAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateUseCase{
    private let dateRepository: DateRepositoryProtocol
    
    init(dateRepository: DateRepositoryProtocol ) {
        self.dateRepository = dateRepository
    }
}

extension DateUseCase: DateUseCaseProtocol {
    func calculatePassAndFutureWeeks(with date: Date) -> [WeekModel] {
        return dateRepository.calculatePassAndFutureWeeks(with: date)
    }
}
