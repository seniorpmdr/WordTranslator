//
//  SearchViewTranslationCell.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation
import UIKit
import Kingfisher

final class SearchViewCell: UITableViewCell, Configurable {
    
    @IBOutlet weak var translationTextLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var noteTextLabel: UILabel!
    
    func configure(using data: SearchViewData.Meaning) {
        translationTextLabel.text = data.text
        noteTextLabel.text = data.note
        noteTextLabel.isHidden = data.noteIsHidden
        
        previewImageView.kf.indicatorType = .activity
        if let previewImageUrl = data.previewImageUrl {
            previewImageView.kf.setImage(with: previewImageUrl)
            previewImageView.layer.cornerRadius = 10
        }
    }
}
