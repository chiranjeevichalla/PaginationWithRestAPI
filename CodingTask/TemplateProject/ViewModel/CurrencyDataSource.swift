//
//  CurrencyDataSource.swift
//  TemplateProject
//
// Created by chiranjeevi on 28/05/24
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class CurrencyDataSource : GenericDataSource<User>, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! CurrencyCell
        
        let user = self.data.value[indexPath.row]
        cell.user = user
        
        return cell
    }
    
    
}
