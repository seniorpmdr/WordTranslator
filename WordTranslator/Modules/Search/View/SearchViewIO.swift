//
//  SearchViewIO.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation

protocol SearchViewInput: AnyObject {
    func show(translations: [SearchViewData.Translation])
}

protocol SearchViewOutput {
    func searchViewDidChangeSearch(text: String)
    func searchViewDidSelect(meaning: SearchViewData.Meaning)
}
