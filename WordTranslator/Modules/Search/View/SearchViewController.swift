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

final class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var output: SearchViewOutput?
    
    // MARK: - Properties
    
    private var translations = [SearchViewData.Translation]()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    // MARK: - Private
    
    private func setupSearchBar() {
        searchBar.rx.text.debounce(.seconds(1), scheduler: MainScheduler.instance).bind { [weak self] newText in
            guard let strongSelf = self, let newText = newText else {
                return
            }
            strongSelf.output?.searchViewDidChangeSearch(text: newText)
        }.disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView.register(SearchViewCell.nib, forCellReuseIdentifier: SearchViewCell.stringRepresentation)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: -  View Input

extension SearchViewController: SearchViewInput {
    func show(translations: [SearchViewData.Translation]) {
        self.translations = translations
        tableView.reloadData()
    }
}

// MARK: - TableView Delegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.searchViewDidSelect(meaning: translations[indexPath.section].meanings[indexPath.row])
    }
}

// MARK: - TableView Data Source

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        translations.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        translations[section].meanings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(SearchViewCell.self, for: indexPath)
        cell?.configure(using: translations[indexPath.section].meanings[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        translations[section].text
    }
}
