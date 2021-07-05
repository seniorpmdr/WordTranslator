//
//  DefenitionResponse.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

struct DefinitionResponse: Decodable {
    let text: String
    let soundUrl: String
}
