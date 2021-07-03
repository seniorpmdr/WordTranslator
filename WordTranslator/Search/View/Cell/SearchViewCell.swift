//
//  SearchViewTranslationCell.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation
import UIKit

final class SearchViewCell: UITableViewCell, Configurable {
    
    @IBOutlet weak var translationTextLabel: UILabel!
    @IBOutlet weak var partOfSpeachTextLabel: UILabel!
    
    func configure(using data: SearchViewData.Translation) {
        translationTextLabel.text = data.text
    }
}
