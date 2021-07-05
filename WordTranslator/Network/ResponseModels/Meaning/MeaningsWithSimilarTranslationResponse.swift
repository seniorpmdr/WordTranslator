//
//  MeaningsWithSimilarTranslationResponse.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

struct MeaningsWithSimilarTranslationResponse: Decodable {
    let meaningId: Int
    let frequencyPercent: String
    let partOfSpeechAbbreviation: String
    let translation: TranslationResponse
}
