//
//  SearchModel.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation
import RxSwift

final class SearchModel {
    weak var output: SearchModelOutput?
    
    // MARK: - Services
    
    private let searchWordsService: SearchWordTranslationServiceProtocol
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    init(searchWordsService: SearchWordTranslationServiceProtocol) {
        self.searchWordsService = searchWordsService
    }
}

// MARK: - Model Input

extension SearchModel: SearchModelInput {
    func search(word: String) {
        let request = SearchWordTranslationRequest(search: word)
        searchWordsService.searchWord(using: request).subscribe { [weak self] event in
            guard let strongSelf = self, let element = event.element else {
                return
            }
            strongSelf.output?.searchModelDidLoadWord(translations: element)
        }.disposed(by: disposeBag)
    }
}
