//
//  Answer.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 8/03/17.
//  Copyright © 2017 Fernando. All rights reserved.
//


import UIKit

struct Answer {
    
    var description: NSString
    var views: NSNumber
    var upVotes: NSNumber
    var downVotes: NSNumber
    
    var userId: NSString
    
    var postId: NSString

}

extension Answer {
    
    init(json: [String: Any]) throws {
        
        guard let description = json["description"] as? NSString else {
            throw SerializationError.missing("Description")
            
        }
        
        guard let views = json["views"] as? NSNumber else {
            throw SerializationError.missing("Views")
            
        }
        
        
        guard let upVotes = json["upVotes"] as? NSNumber else {
            throw SerializationError.missing("up votes")
            
        }
        
        guard let downVotes = json["downVotes"] as? NSNumber else {
            throw SerializationError.missing("downVotes")
            
        }
        
        guard let userId = json["userId"] as? NSString else {
            throw SerializationError.missing("User Id")
            
        }
        
        guard let postId = json["postId"] as? NSString else {
            throw SerializationError.missing("User Id")
            
        }
        
        self.description = description
        self.views = views
        self.upVotes = upVotes
        self.downVotes = downVotes
        self.userId = userId
        self.postId = postId
        
    }
    
}
