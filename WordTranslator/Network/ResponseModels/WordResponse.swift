//
//  SearchResponse.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 01.07.2021.
//

import Foundation

struct WordResponse: Decodable {
    let id: Int
    let text: String
    let meanings: [MeaningShortResponse]
}
