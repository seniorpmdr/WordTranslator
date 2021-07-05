//
//  MeaningsService.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol MeaningsServiceProtocol {
    func getMeanings(for request: MeaningRequest) -> Observable<[MeaningResponse]>
}

final class MeaningsService: BaseNetworkService, MeaningsServiceProtocol {
    func getMeanings(for request: MeaningRequest) -> Observable<[MeaningResponse]> {
        let baseUrl = urlProvider.getBaseUrl()?.appendingPathComponent("meanings")
        
        guard let baseUrl = baseUrl,
              var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else {
            return Observable.error(BuildRequestError())
        }
        
        urlComponents.queryItems = request.queryItems
        
        let urlRequest = URLRequest(url: urlComponents.url!)
        return jsonModel(type: [MeaningResponse].self, request: urlRequest)
    }
}
