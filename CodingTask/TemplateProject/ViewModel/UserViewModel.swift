//
//  CurrencyViewModel.swift
//  TemplateProject
//
// Created by chiranjeevi on 28/05/24
//

import Foundation

struct UserViewModel {
    
    // Initializer Injection (Dependency Injection), here we are injecting the data Source and service, to decouple the code and to write service mockup class
    weak var dataSource : GenericDataSource<User>?
    weak var service: CurrencyServiceProtocol?
    
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    init(service: CurrencyServiceProtocol = CurrencyService.shared, dataSource : GenericDataSource<User>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchCurrencies(currentPage: Int) {
        
        
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        
        service.fetchConverter(curentPage: currentPage) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    
                    if self.dataSource?.data.value.count == 0 {
                        self.dataSource?.data.value = converter
                    } else {
                        self.dataSource?.data.value.append(contentsOf: converter) 
                    }
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
    
    func selectedData(at indexPath: IndexPath) -> User? {
        
        return self.dataSource?.data.value[indexPath.row]
    }
}
