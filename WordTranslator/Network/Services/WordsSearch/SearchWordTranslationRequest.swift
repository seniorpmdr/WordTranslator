//
//  SearchRequest.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 01.07.2021.
//

import Foundation

struct SearchWordTranslationRequest: Encodable {
    /// Searching text.
    let search: String
    
    /// Number of searching page.
    var page: Int?
    
    /// Page size of search.
    var pageSize: Int?
}
