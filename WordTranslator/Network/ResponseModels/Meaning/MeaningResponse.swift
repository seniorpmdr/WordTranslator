//
//  MeaningResponse.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

struct MeaningResponse: Decodable {
    /// Meaning id.
    let id: String
    
    let wordId: Int
    
    /// There are 6 difficultyLevels: 1, 2, 3, 4, 5, 6.
    let difficultyLevel: Int?
    
    /// String representation of a part of speech.
    let partOfSpeechCode: PartOfSpeachCode
    
    let prefix: String?
    
    let text: String
    
    let transcription: String
    
    let updatedAt: String
    
    let mnemonics: String?
    
    ///
    let translation: TranslationResponse
    
    let images: [ImageUrlResponse]
    
    let definition: DefinitionResponse?
    
    let examples: [ExampleUsageResponse]
    
    let meaningsWithSimilarTranslation: [MeaningsWithSimilarTranslationResponse]
    
    let alternativeTranslations: [AlternativeTranslationsResponse]
}
