//
//  SearchViewDataMapper.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

protocol SearchViewDataMapperProtocol {
    func toViewTranslation(_ wordResponse: WordResponse) -> SearchViewData.Translation
}

final class SearchViewDataMapper: SearchViewDataMapperProtocol {
    func toViewTranslation(_ wordResponse: WordResponse) -> SearchViewData.Translation {
        SearchViewData.Translation(id: wordResponse.id, text: wordResponse.text, partOfSpeach: "None")
    }
}
