//
//  ViewController.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 18/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var apiService: ApiServiceDataSource?
    
    var posts: [Post]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .blue
        
        apiService = ApiServiceDataSource()
        
        //ApiServiceDataSource.sharedInstance.sampleSetPostFirebase()
        
        fetchPosts()
        

    }
    
    func fetchPosts() {
        apiService?.fetchPosts { (posts) in
            self.posts = posts
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

