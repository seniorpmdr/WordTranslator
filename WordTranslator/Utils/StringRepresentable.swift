//
//  StringRepresentable.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation

/// Represents class name as string
protocol StringRepresentable {
    static var stringRepresentation: String { get }
}

extension StringRepresentable {
    static var stringRepresentation: String {
        String(describing: self)
    }
}
