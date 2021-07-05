//
//  MeaningRequest.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

struct MeaningRequest: Encodable, QueryItemsConvertable {
    /// An array of meaning ids
    let ids: [Int]
    
    /// Retrieve results from this date. * * Must be in UTC timezone. *
    var updatedAt: Date?
    
    var queryItems: [URLQueryItem]? {
        var stringIds = ids.reduce(into: String()) { result, id in
            result.append("\(id),")
        }
        _ = stringIds.removeLast()
        return [.init(name: "ids", value: stringIds)]
    }
}
