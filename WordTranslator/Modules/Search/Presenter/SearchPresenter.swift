//
//  SearchPresenter.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

final class SearchPresenter {
    
    private weak var view: SearchViewInput?
    private let model: SearchModelInput
    private let mapper: SearchViewDataMapperProtocol
    private let coordinator: DetailCoordinatorProtocol
    
    init(
        view: SearchViewInput,
        model: SearchModelInput,
        mapper: SearchViewDataMapperProtocol,
        coordinator: DetailCoordinatorProtocol
    ) {
        self.view = view
        self.model = model
        self.mapper = mapper
        self.coordinator = coordinator
    }
}

// MARK: - View Output

extension SearchPresenter: SearchViewOutput {
    func searchViewDidChangeSearch(text: String) {
        guard !text.isEmpty else {
            return
        }
        
        model.search(word: text)
    }
    
    func searchViewDidSelect(meaning: SearchViewData.Meaning) {
        coordinator.showMeaningDetails(with: MeaningDetailModuleInputData(meaningId: meaning.id))
    }
}

// MARK: - Model Output

extension SearchPresenter: SearchModelOutput {
    func searchModelDidLoadWord(translations: [WordResponse]) {
        view?.show(translations: translations.map(mapper.toViewTranslation))
    }
}
