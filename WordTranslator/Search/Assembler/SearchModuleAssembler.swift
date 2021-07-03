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
        #warning("Убрать название сториборда в константы")
        let viewController = UIStoryboard(name: "SearchViewControllerStoryboard", bundle: .main).instantiateInitialViewController()! as! SearchViewController
        let model = SearchModel(searchWordsService: SearchWordTranslationService())
        let presenter = SearchPresenter(view: viewController, model: model, mapper: SearchViewDataMapper())
        
        viewController.output = presenter
        model.output = presenter
        
        return viewController
    }
}
