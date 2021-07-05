//
//  DetailModelIO.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation

protocol MeaningDetailModelInput {
    func getMeanings()
}

protocol MeaningDetailModelOutput: AnyObject {
    func meaningDetailModelDidLoad(meanings: [MeaningResponse])
}
