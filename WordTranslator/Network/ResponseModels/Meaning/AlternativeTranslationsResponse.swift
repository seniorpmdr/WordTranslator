//
//  AlternativeTranslationsResponse.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

struct AlternativeTranslationsResponse: Decodable {
    let text: String
    let translation: TranslationResponse
}
