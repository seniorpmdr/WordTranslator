//
//  UrlProvider.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

protocol BaseUrlProviderProtocol {
    func getBaseUrl() -> URL?
}

class BaseUrlProvider: BaseUrlProviderProtocol {
    private enum Constants {
        static var baseUrlKey = "BASE_URL"
    }
    
    func getBaseUrl() -> URL? {
        guard let baseUrlString = Bundle.main.infoDictionary?[Constants.baseUrlKey] as? String else {
            return nil
        }
        
        return URL(string: baseUrlString)
    }
}
