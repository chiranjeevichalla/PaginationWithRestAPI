//
//  CurrencyService.swift
//  TemplateProject
//
// Created by chiranjeevi on 28/05/24
//

import Foundation

protocol CurrencyServiceProtocol : AnyObject {
    func fetchConverter(curentPage: Int,_ completion: @escaping ((Result<[User], ErrorResult>) -> Void))
}

final class CurrencyService : RequestHandler, CurrencyServiceProtocol {
    
    static let shared = CurrencyService()
    
    
    
    var task : URLSessionTask?
    
    func fetchConverter(curentPage: Int, _ completion: @escaping ((Result<[User], ErrorResult>) -> Void)) {
        let endpoint = "https://jsonplaceholder.typicode.com/posts?_page=\(curentPage)&_limit=10"
        // cancel previous request if already in progress
        self.cancelFetchCurrencies()
    
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchCurrencies() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
