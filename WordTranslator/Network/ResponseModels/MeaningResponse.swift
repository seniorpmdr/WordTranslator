//
//  MeaningResponse.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 01.07.2021.
//

import Foundation

struct MeaningResponse: Decodable {
    
    enum PartOfSpeachCode: String, Decodable {
        case noun = "n"
        case verb = "v"
        case adjective = "j"
        case adverb = "r"
        case preposition = "prp"
        case pronoun = "prn"
        case cardinalNumber = "crd"
        case conjunction = "cjc"
        case interjection = "exc"
        case article = "det"
        case abbreviation = "abb"
        case particle = "x"
        case ordinalNumber = "ord"
        case modalVerb = "md"
        case phrase = "ph"
        case idiom = "phi"
    }
    
    /// Meaning id.
    let id: Int
    
    /// String representation of a part of speech.
    let partOfSpeechCode: PartOfSpeachCode
    
    /// 
    let translation: TranslationResponse
    
    let previewUrl: String
    
    let imageUrl: String

    /// IPA phonetic transcription.
    let transcription: String
    
    /// URL to meaning sound.
    let soundUrl: String
}
