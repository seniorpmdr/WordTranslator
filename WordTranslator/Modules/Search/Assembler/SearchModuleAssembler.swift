//
//  Asembler.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation
import UIKit

final class SearchModuleAssembler {
    func assemble() -> UIViewController {
        let viewController = UIStoryboard(name: SearchViewController.stringRepresentation, bundle: .main).instantiateInitialViewController()! as! SearchViewController
        let searchWordsService = SearchWordTranslationService(urlProvider: BaseUrlProvider())
        let model = SearchModel(searchWordsService: searchWordsService)
        let presenter = SearchPresenter(
            view: viewController,
            model: model,
            mapper: SearchViewDataMapper(),
            coordinator: DetailCoordinator(routableView: viewController)
        )
        
        viewController.output = presenter
        model.output = presenter
        
        return viewController
    }
}
