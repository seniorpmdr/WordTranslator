//
//  DetailPresenter.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation

final class MeaningDetailPresenter {
    
    private weak var view: MeaningDetailViewInput?
    private let model: MeaningDetailModelInput
    private let mapper: MeaningDetailViewDataMapperProtocol
    
    init(view: MeaningDetailViewInput, model: MeaningDetailModelInput, mapper: MeaningDetailViewDataMapperProtocol) {
        self.view = view
        self.model = model
        self.mapper = mapper
    }
}

// MARK: - Model Output

extension MeaningDetailPresenter: MeaningDetailModelOutput {
    func meaningDetailModelDidLoad(meanings: [MeaningResponse]) {
        guard let firstMeaning = meanings.first else {
            return
        }
        
        view?.show(meaning: mapper.toViewMeaning(firstMeaning))
    }
}

// MARK: - View Output

extension MeaningDetailPresenter: MeaningDetailViewOutput {
    func meaningDetailViewDidLoad() {
        model.getMeanings()
    }
}
