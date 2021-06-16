//
//  Composition.swift
//  Task
//
//  Created by Mikhail Markin on 16.06.2021.
//

import Dip

enum Composition {
    static func configure(_ container: DependencyContainer) {
        container.register { Context(serverService: $0, service: Service_()) }
            .implements(ViewModel.UseCases.self)
        
        container.register { ViewModel($0) }
        
        container.register(storyboardType: ViewController.self, tag: "ViewController")
            .resolvingProperties { container, controller in
                controller.viewModel = try container.resolve()
        }
        
        DependencyContainer.uiContainers.append(container)
    }
}

extension ViewController: StoryboardInstantiatable {}

struct Context: ServerServiceHolder, Service_Holder {
    let serverService: ServerService
    let service: Service_
}

extension Context: FetchServerListUseCase {}
extension Context: FetchSomethingElseUseCase {} 
