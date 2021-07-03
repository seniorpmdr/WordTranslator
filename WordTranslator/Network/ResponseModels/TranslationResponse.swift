//
//  TranslationResponse.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 01.07.2021.
//

import Foundation

struct TranslationResponse: Decodable {
    /// A text of a translation.
    let text: String

    /// A note about translation.
    let note: String?
}
