//
//  Routable.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 05.07.2021.
//

import Foundation
import UIKit

protocol Routable: AnyObject {
    func present(_ vc: UIViewController, animated: Bool, completion: (() -> Void)?)
}

extension Routable where Self: UIViewController {
    func present(_ vc: UIViewController, animated: Bool, completion: (() -> Void)?) {
        present(vc, animated: animated, completion: completion)
    }
}
