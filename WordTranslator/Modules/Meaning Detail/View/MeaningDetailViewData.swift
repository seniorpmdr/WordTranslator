//
//  MeaningDetailViewData.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 05.07.2021.
//

import Foundation

enum MeaningDetailViewData {
    struct Meaning {
        let text: String
        let translationText: String
        let imageUrl: URL?
        let examples: [String]
    }
}
