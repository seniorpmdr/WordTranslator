//
//  UITableViewExtensions.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation
import UIKit

extension UITableView {
    func dequeueReusableCell<C: UITableViewCell & Configurable>(_ cellType: C.Type, for indexPath: IndexPath) -> C? {
        dequeueReusableCell(withIdentifier: cellType.stringRepresentation, for: indexPath) as? C
    }
}
