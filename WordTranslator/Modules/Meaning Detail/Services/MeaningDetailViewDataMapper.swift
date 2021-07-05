//
//  MeaningDetailViewDataMapper.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 05.07.2021.
//

import Foundation

protocol MeaningDetailViewDataMapperProtocol {
    func toViewMeaning(_ meaningResponse: MeaningResponse) -> MeaningDetailViewData.Meaning
}

final class MeaningDetailViewDataMapper: MeaningDetailViewDataMapperProtocol {
    func toViewMeaning(_ meaningResponse: MeaningResponse) -> MeaningDetailViewData.Meaning {
        var urlComponents: URLComponents?
        if let url = meaningResponse.images.first?.url {
            urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlComponents?.scheme = "https"
        }
        
        return MeaningDetailViewData.Meaning(
            text: meaningResponse.text,
            translationText: meaningResponse.translation.text,
            imageUrl: urlComponents?.url,
            examples: meaningResponse.examples.map(\.text)
        )
    }
}
