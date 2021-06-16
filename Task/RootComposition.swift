//
//  RootComposition.swift
//  Task
//
//  Created by Mikhail Markin on 16.06.2021.
//

import Dip

enum RootComposition {
    static func configure() -> DependencyContainer {
        let container = DependencyContainer()
        Composition.configure(container)
        
        container.register { Network() as Networking }
        container.register { DefaultServerRemoteService(networking: $0) as ServerRemoteService }
        container.register { DefaultServerService(remoteService: $0) as ServerService }
        return container
    }
}
