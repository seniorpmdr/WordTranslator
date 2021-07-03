//
//  Configurable.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

protocol Configurable {
    associatedtype Data
     
    func configure(using data: Data)
}
