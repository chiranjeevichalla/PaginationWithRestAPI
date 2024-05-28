//
//  Converter.swift
//  TemplateProject
//
//  Created by chiranjeevi on 28/05/24.
//

import Foundation

struct User: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
//    {
//        "userId": 1,
//        "id": 1,
//        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//      },
}

extension User : Parceable {
    
    static func parseObject(dictionary: [String : AnyObject]) -> Result<User, ErrorResult> {
        
        
        if let userId = dictionary["userId"] as? Int,
            let id = dictionary["id"] as? Int,
            let title = dictionary["title"] as? String, let body = dictionary["body"] as? String {
            let conversion = User(userId: userId, id: id, title: title, body: body)
            
            return Result.success(conversion)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
        }
    }
}
