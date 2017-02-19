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
    var description: NSString
    var tags: [NSString]
    var userId: NSString
    var upVotes: NSNumber
    var downVotes: NSNumber
    
    
}

extension Post {
    
    init(json: [String: Any]) throws {
        guard let title = json["title"] as? NSString else {
            throw SerializationError.missing("Title")
        }
        
        guard let description = json["description"] as? NSString else {
            throw SerializationError.missing("Description")
            
        }
        
        guard let tags = json["tags"] as? [NSString] else {
            throw SerializationError.missing("Tags")
            
        }
        
        guard let userId = json["userId"] as? NSString else {
            throw SerializationError.missing("User Id")
            
        }
        
        guard let upVotes = json["upVotes"] as? NSNumber else {
            throw SerializationError.missing("up votes")
            
        }
        
        guard let downVotes = json["downVotes"] as? NSNumber else {
            throw SerializationError.missing("downVotes")
            
        }
        self.title = title
        self.description = description
        self.tags = tags
        self.userId = userId
        self.upVotes = upVotes
        self.downVotes = downVotes
        
    }
    
}

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}
