//
//  BaseNetworkService.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation
import RxSwift

class BaseNetworkService {
    internal let urlProvider: BaseUrlProviderProtocol
    
    init(urlProvider: BaseUrlProviderProtocol) {
        self.urlProvider = urlProvider
    }
    
    func jsonModel<Item: Decodable>(type: Item.Type, request: URLRequest) -> Observable<Item> {
        URLSession
            .shared
            .rx
            .data(request: request)
            .decode(type: type, decoder: JSONDecoder())
            .observe(on: MainScheduler.asyncInstance)
    }
}
