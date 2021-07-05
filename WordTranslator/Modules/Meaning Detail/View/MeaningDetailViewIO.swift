//
//  DetailViewIO.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation

protocol MeaningDetailViewInput: AnyObject {
    func show(meaning: MeaningDetailViewData.Meaning)
}

protocol MeaningDetailViewOutput {
    func meaningDetailViewDidLoad()
}
