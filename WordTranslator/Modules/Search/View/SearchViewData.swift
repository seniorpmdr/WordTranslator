//
//  SearchViewTranslation.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

enum SearchViewData {
    struct Translation: Identifiable {
        let id: Int
        let text: String
        let meanings: [Meaning]
    }
    
    struct Meaning: Identifiable {
        let id: Int
        let text: String
        
        let note: String
        let noteIsHidden: Bool
        
        let previewImageUrl: URL?
    }
}
