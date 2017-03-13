//
//  Post.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 18/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

struct Post {
    
    var title: NSString
    var views: NSNumber
    var answers: [NSString]?
    
    var userId: NSString
    
}

extension Post {
    
    init(json: [String: Any]) throws {
        guard let title = json["title"] as? NSString else {
            throw SerializationError.missing("Title")
        }
        
        
        guard let views = json["views"] as? NSNumber else {
            throw SerializationError.missing("Views")
            
        }
        
        
        guard let userId = json["userId"] as? NSString else {
            throw SerializationError.missing("User Id")
            
        }
        
        self.title = title
        self.views = views
        self.userId = userId
        
    }
    
}

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}
