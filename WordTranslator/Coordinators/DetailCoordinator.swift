//
//  MainCoordinator.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 05.07.2021.
//

import Foundation

protocol DetailCoordinatorProtocol {
    func showMeaningDetails(with data: MeaningDetailModuleInputData)
}


class DetailCoordinator: Coordinator, DetailCoordinatorProtocol {
    weak var routableView: Routable?
    
    init(routableView: Routable) {
        self.routableView = routableView
    }
    
    func start() {
        
    }
    
    func showMeaningDetails(with data: MeaningDetailModuleInputData) {
        let vc = MeaningDetailModuleAssembler().assemble(with: data)
        routableView?.present(vc, animated: true, completion: nil)
    }
}
