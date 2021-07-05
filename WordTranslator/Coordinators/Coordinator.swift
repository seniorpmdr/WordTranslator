//
//  Coordinator.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 05.07.2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var routableView: Routable? { get }
    
    func start()
}
