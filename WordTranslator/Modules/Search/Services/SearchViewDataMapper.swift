//
//  SearchViewDataMapper.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

protocol SearchViewDataMapperProtocol {
    func toViewTranslation(_ wordResponse: WordResponse) -> SearchViewData.Translation
    func toViewMeaning(_ meaning: MeaningShortResponse) -> SearchViewData.Meaning
}

final class SearchViewDataMapper: SearchViewDataMapperProtocol {
    private enum Constants {
        static let httpsPrefix = "https"
    }
    
    func toViewTranslation(_ wordResponse: WordResponse) -> SearchViewData.Translation {
        SearchViewData.Translation(
            id: wordResponse.id,
            text: wordResponse.text,
            meanings: wordResponse.meanings.map(toViewMeaning(_:))
        )
    }
    
    func toViewMeaning(_ meaning: MeaningShortResponse) -> SearchViewData.Meaning {
        var url = URLComponents(url: meaning.imageUrl, resolvingAgainstBaseURL: false)
        url?.scheme = Constants.httpsPrefix
        
        return SearchViewData.Meaning(
            id: meaning.id,
            text: meaning.translation.text,
            note: meaning.translation.note ?? .empty,
            noteIsHidden: meaning.translation.note == nil,
            previewImageUrl: url?.url
        )
    }
}
