//
//  DetailModel.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation
import RxSwift

final class MeaningDetailModel {
    weak var output: MeaningDetailModelOutput?
    
    private let inputData: MeaningDetailModuleInputData
    private let meaningsService: MeaningsServiceProtocol
    
    private let disposeBag = DisposeBag()
    
    init(inputData: MeaningDetailModuleInputData, meaningsService: MeaningsServiceProtocol) {
        self.inputData = inputData
        self.meaningsService = meaningsService
    }
}

// MARK: - Model Input

extension MeaningDetailModel: MeaningDetailModelInput {
    func getMeanings() {
        let request = MeaningRequest(ids: [inputData.meaningId], updatedAt: nil)
        meaningsService.getMeanings(for: request)
            .subscribe { [weak self] event in
                guard let meanings = event.element else {
                    return
                }
                
                self?.output?.meaningDetailModelDidLoad(meanings: meanings)
            }.disposed(by: disposeBag)
    }
}
