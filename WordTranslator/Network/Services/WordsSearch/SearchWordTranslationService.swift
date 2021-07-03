//
//  WordsSearchService.swift
//  WordTranslator
//
//  Created by Vadim Salmin on 01.07.2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchWordTranslationServiceProtocol {
    func searchWord(using request: SearchWordTranslationRequest) -> Observable<[WordResponse]>
}

final class SearchWordTranslationService: SearchWordTranslationServiceProtocol {
    func searchWord(using request: SearchWordTranslationRequest) -> Observable<[WordResponse]> {
        #warning("TODO change")
        var components = URLComponents(string: "https://dictionary.skyeng.ru/api/public/v1/words/search")!
        
        let data = try! JSONEncoder().encode(request)
        let dict = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        components.queryItems = dict?.map { keyValue in
            URLQueryItem(name: keyValue.key, value: keyValue.value as? String)
        }
        
        let r = URLRequest(url: components.url!)
        return URLSession.shared.rx.data(request: r).map { data in
            try! JSONDecoder().decode([WordResponse].self, from: data)
        }.observe(on: MainScheduler.asyncInstance)
    }
}
