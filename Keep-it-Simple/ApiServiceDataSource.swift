//
//  PostDataSource.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 18/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct ApiServiceDataSource {
    
    static let sharedInstance = ApiServiceDataSource()
    
    
    var ref = FIRDatabase.database().reference(fromURL: "https://keep-it-simple-30705.firebaseio.com/")
    
    func fetchPosts(question: String, completion: @escaping ([Post])-> ()){
        
        let query = ref.child("posts").queryOrdered(byChild: "title").queryStarting(atValue: question).queryEnding(atValue: question)
        
        query.observeSingleEvent(of: .value, with: { (snapshot) in
            
            var postArray = [Post]()
            
            if let posts = snapshot.value as? NSDictionary {
                                
                for post in posts {
                    
                    if let postDetail = post.value as? [String: Any] {
                        do{
                            
                            try postArray.append(Post(json: postDetail))
                        }
                        catch let error as NSError {
                            print(error.localizedDescription)
                        }
                        
                    }
                }
                
            }
            else {
                print("The query returned 0 elements")
            }
            
            completion(postArray)
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    

    
    
    func sampleSetPostFirebase(){
        
        let post = ref.child("posts").childByAutoId()
        
        let answerData =
            ["description":"A sailing yacht is a leisure craft that uses sails as its primary means of propulsion. Sailing yachts are actively used in sport and are a category of classes recognized by the International Sailing Federation. Shown here is the Zapata II, built in 1964, during the 2013 Ahmanson Cup in Newport Beach, California.",
             "views": 20,
             "userId": "robert_stein",
             "upVotes": 5,
             "downVotes": 10,
                ] as [String : Any]
        
        let answerData2 =
            ["description":"Sailing has been around for travel and fishing, but it’s only become a sport since the early 17th century. The Dutch are said to be the first nation who raced yachts for fun. They gave a ship to Charles II and the sport quickly became popular in England before being taken up in America.",
             "views": 100,
             "userId": "robert_stein",
             "upVotes": 100,
             "downVotes": 2,
             ] as [String : Any]
        
        let postData =
            ["title":"What is sailing?",
             "views": 10,
             "userId": "monkey_d_luffy",
             "answers":[answerData, answerData2]
                ] as [String : Any]
        
        
        post.setValue(postData)
        
        let post2 = ref.child("posts").childByAutoId()
        
        let answerData3 =
            ["description":"Burned by Harry's hands, which to Quirrell were white-hot and caused severe blistering, and abandonment by Voldemort's soul.",
             "views": 20,
             "userId": "john_smith",
             "upVotes": 8,
             "downVotes": 4,
                ] as [String : Any]
        
        let postData2 =
            ["title":"What killed Harry?",
             "views": 20,
             "userId": "jack_sparrow",
             "answers":[answerData3]
                ] as [String : Any]
        
        post2.setValue(postData2)
        
        let post3 = ref.child("posts").childByAutoId()
        
        let postData3 =
            ["title":"How can I smile more?",
             "views": 1000,
             "userId": "jack_sparrow",
             "answers":[]
                ] as [String : Any]
        
        post3.setValue(postData3)
        
    }

}
