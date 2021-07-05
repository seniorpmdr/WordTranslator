//
//  SearchModelIO.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation

protocol SearchModelInput {
    func search(word: String)
}

protocol SearchModelOutput: AnyObject {
    func searchModelDidLoadWord(translations: [WordResponse])
}
