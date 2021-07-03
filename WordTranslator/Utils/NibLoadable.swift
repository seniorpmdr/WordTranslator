//
//  NibLoadable.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation
import UIKit

protocol NibLoadable {
    static var nib: UINib { get }
}

extension NibLoadable where Self: StringRepresentable {
    static var nib: UINib {
        UINib(nibName: String(describing: stringRepresentation), bundle: nil)
    }
}
