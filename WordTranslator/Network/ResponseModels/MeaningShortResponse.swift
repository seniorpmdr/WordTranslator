//
//  MeaningResponse.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 01.07.2021.
//

import Foundation

struct MeaningShortResponse: Decodable {
    /// Meaning id.
    let id: Int
    
    /// String representation of a part of speech.
    let partOfSpeechCode: PartOfSpeachCode
    
    /// 
    let translation: TranslationResponse
    
    let previewUrl: URL
    
    let imageUrl: URL

    /// IPA phonetic transcription.
    let transcription: String
    
    /// URL to meaning sound.
    let soundUrl: String
}
