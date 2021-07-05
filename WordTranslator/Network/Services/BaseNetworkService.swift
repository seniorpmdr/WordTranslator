//
//  BaseNetworkService.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation

class BaseNetworkService {
    internal let urlProvider: BaseUrlProviderProtocol
    
    init(urlProvider: BaseUrlProviderProtocol) {
        self.urlProvider = urlProvider
    }
}
