//
//  DetailViewController.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 04.07.2021.
//

import Foundation
import UIKit

final class MeaningDetailViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let meaningDetailText = NSLocalizedString("meaning_detail_text", comment: .empty)
        static let meaningDetailTranslation = NSLocalizedString("meaning_detail_translation", comment: .empty)
    }
    
    var output: MeaningDetailViewOutput?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var translationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.meaningDetailViewDidLoad()
    }
}

// MARK: - View Input

extension MeaningDetailViewController: MeaningDetailViewInput {
    func show(meaning: MeaningDetailViewData.Meaning) {
        if let imageUrl = meaning.imageUrl {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: imageUrl)
        }
        
        textLabel.text = String(format: Constants.meaningDetailText, meaning.text)
        translationLabel.text = String(format: Constants.meaningDetailTranslation, meaning.translationText)
    }
}
