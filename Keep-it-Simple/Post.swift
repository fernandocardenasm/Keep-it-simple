//
//  Post.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 18/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct Post {
        
    var title: NSString
    var views: Int
    var answers: [Answer]?
    
    var userId: NSString
    
}

extension Post {
    
    init(json: [String: Any]) throws {
        guard let title = json["title"] as? NSString else {
            throw SerializationError.missing("Title")
        }
        
        
        guard let views = json["views"] as? Int else {
            throw SerializationError.missing("Views")
            
        }
        
        guard let userId = json["userId"] as? NSString else {
            throw SerializationError.missing("User Id")
            
        }
        
        
        if let auxAnswers = json["answers"] as? [[String: Any]]{
            
            self.answers = [Answer]()
            
            for answer in auxAnswers {
                
                do{
                    try self.answers?.append(Answer(json: answer))
                }
                catch let error as NSError {
                    print(error.localizedDescription)
                }
                
            }
            
        }
        
        self.title = title
        self.views = views
        self.userId = userId
        
    }
    
    func getMaxScoreForPost()-> Int{
        var scoreArray = [Int]()
        
        if let answers = self.answers {
            for answer in answers {
                
                scoreArray.append(answer.upVotes - answer.downVotes)
            }
        }
        
        return scoreArray.max() ?? 0
    }
    
    func getAnswerWithMaxScore()-> Answer{
        
        var max = -10000
        var auxAnswer: Answer?
    
        if let answers = self.answers {
            for answer in answers {
                
                if max < answer.upVotes - answer.downVotes {
                    max = answer.upVotes - answer.downVotes
                    auxAnswer = answer
                }
            }
        }
        
        return auxAnswer!
    }
    
}

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}
