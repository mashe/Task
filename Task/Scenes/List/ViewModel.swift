//
//  ViewModel.swift
//  Task
//
//  Created by Mikhail Markin on 16.06.2021.
//

import RxSwift
import RxCocoa

struct ViewModel {
    typealias UseCases = FetchServerListUseCase & FetchSomethingElseUseCase
    
    let servers: Driver<[Server]>
    
    init(_ useCases: UseCases) {
        self.servers = useCases.fetchServerList()
            .asDriver(onErrorJustReturn: [])
        
        useCases.fetchSomethingElse()
    }
}
