//
//  WordsSearchService.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 01.07.2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchWordTranslationServiceProtocol {
    func searchWord(using request: SearchWordTranslationRequest) -> Observable<[WordResponse]>
}

final class SearchWordTranslationService: BaseNetworkService, SearchWordTranslationServiceProtocol {
    
    func searchWord(using request: SearchWordTranslationRequest) -> Observable<[WordResponse]> {
        let baseUrl = urlProvider.getBaseUrl()?
            .appendingPathComponent("words")
            .appendingPathComponent("search")
        
        guard let baseUrl = baseUrl,
              var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else {
            return Observable.error(BuildRequestError())
        }
        
        urlComponents.queryItems = request.queryItems
        
        let urlRequest = URLRequest(url: urlComponents.url!)
        return URLSession
            .shared
            .rx
            .data(request: urlRequest)
            .decode(type: [WordResponse].self, decoder: JSONDecoder())
            .observe(on: MainScheduler.asyncInstance)
    }
}
