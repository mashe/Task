//
//  GetServerListUseCase.swift
//  Task
//
//  Created by Mikhail Markin on 16.06.2021.
//

import RxSwift

protocol FetchServerListUseCase {
    func fetchServerList() -> Single<[Server]>
}

extension FetchServerListUseCase where Self: ServerServiceHolder {
    func fetchServerList() -> Single<[Server]> {
        return Single.create { promise in
            serverService.fetchedRemoteServers(completion: promise)
            return Disposables.create()
        }
        
    }
}


protocol ServerServiceHolder {
    var serverService: ServerService { get }
}


protocol FetchSomethingElseUseCase {
    func fetchSomethingElse() -> Single<[Server]>
}

extension FetchSomethingElseUseCase where Self: Service_Holder {
    func fetchSomethingElse() -> Single<[Server]> {
        return Single.just([])
    }
}

struct Service_ {
    
}

protocol Service_Holder {
    var service: Service_ { get }
}
