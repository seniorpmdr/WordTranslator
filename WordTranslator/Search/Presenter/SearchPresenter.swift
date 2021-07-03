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
    
    init(view: SearchViewInput, model: SearchModelInput, mapper: SearchViewDataMapperProtocol) {
        self.view = view
        self.model = model
        self.mapper = mapper
    }
}

// MARK: - View Output

extension SearchPresenter: SearchViewOutput {
    func searchView(_ searchView: SearchViewInput, didChangeSearchText text: String) {
        model.search(word: text)
    }
}

// MARK: - Model Output

extension SearchPresenter: SearchModelOutput {
    func searchModel(_ searchModel: SearchModelInput, didLoadWordTranslations translations: [WordResponse]) {
        view?.show(translations: translations.map(mapper.toViewTranslation))
    }
}
