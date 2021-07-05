//
//  QueryItemsConvertable.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

protocol QueryItemsConvertable {
    var queryItems: [URLQueryItem]? { get }
}

//extension QueryItemsConvertable where Self: Encodable {
//    @available(*, deprecated)
//    var queryItems: [URLQueryItem]? {
//        guard let data = try? JSONEncoder().encode(self),
//              let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
//              let dictionary = jsonObject as? [String: Any] else {
//            return nil
//        }
//        
//        return dictionary.map { keyValue in
//            URLQueryItem(name: keyValue.key, value: keyValue.value as? String)
//        }
//    }
//}
