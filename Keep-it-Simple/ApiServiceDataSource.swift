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
        
        let postData =
        ["title":"What is sailing?",
         "description":"A sailing yacht is a leisure craft that uses sails as its primary means of propulsion. Sailing yachts are actively used in sport and are a category of classes recognized by the International Sailing Federation. Shown here is the Zapata II, built in 1964, during the 2013 Ahmanson Cup in Newport Beach, California.",
         "views": 10,
         "userId": "1",
         "upVotes": 4,
         "downVotes": 2
        ] as [String : Any]
        
        post.setValue(postData)
        
        let post2 = ref.child("posts").childByAutoId()
        
        let postData2 =
            ["title": "What is the structure of the Universe?",
            "description":"Further observational improvements led to the realization that our Solar System is located in the Milky Way galaxy, which is one of many galaxies in the Universe. It is assumed that galaxies are distributed uniformly and the same in all directions, meaning that the Universe has neither an edge nor a center. Discoveries in the early 20th century have suggested that the Universe had a beginning and that it is expanding[15] at an increasing rate.[16] The majority of mass in the Universe appears to exist in an unknown form called dark matter.",
            "views" : 20,
            "userId": "2",
            "upVotes": 0,
            "downVotes": 6
                ] as [String : Any]
        
        post2.setValue(postData2)
    }

}
