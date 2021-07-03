//
//  SearchViewController.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 03.07.2021.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

protocol SearchViewInput: AnyObject {
    func show(translations: [SearchViewData.Translation])
}

protocol SearchViewOutput {
    func searchView(_ searchView: SearchViewInput, didChangeSearchText text: String)
}

final class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var output: SearchViewOutput?
    
    // MARK: - Properties
    
    private var translations = PublishSubject<[SearchViewData.Translation]>()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    // MARK: - Private
    
    private func setupSearchBar() {
        #warning("move debounce from view")
        searchBar.rx.text.debounce(.seconds(1), scheduler: MainScheduler.instance).bind { [weak self] newText in
            guard let strongSelf = self, let newText = newText, !newText.isEmpty else {
                return
            }
            strongSelf.output?.searchView(strongSelf, didChangeSearchText: newText)
        }.disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView.register(SearchViewCell.nib, forCellReuseIdentifier: SearchViewCell.stringRepresentation)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        let configureCell = translations.bind(to: tableView.rx.items(cellIdentifier: SearchViewCell.stringRepresentation, cellType: SearchViewCell.self))
        configureCell { (row, item, cell) in cell.configure(using: item) }.disposed(by: disposeBag)
    }
}

// MARK: -  View Input

extension SearchViewController: SearchViewInput {
    func show(translations: [SearchViewData.Translation]) {
        self.translations.onNext(translations)
    }
}

extension SearchViewController: UITableViewDelegate {}
