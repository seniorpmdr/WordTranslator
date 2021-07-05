//
//  DetailModuleAssembler.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation
import UIKit

final class MeaningDetailModuleAssembler {
    func assemble(with inputData: MeaningDetailModuleInputData) -> UIViewController {
        let viewController = UIStoryboard(name: MeaningDetailViewController.stringRepresentation, bundle: .main).instantiateInitialViewController()! as! MeaningDetailViewController
        let model = MeaningDetailModel(inputData: inputData, meaningsService: MeaningsService(urlProvider: BaseUrlProvider()))
        let presenter = MeaningDetailPresenter(view: viewController, model: model, mapper: MeaningDetailViewDataMapper())
        
        model.output = presenter
        viewController.output = presenter
        
        return viewController
    }
}
