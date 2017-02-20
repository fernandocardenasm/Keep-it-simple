//
//  ViewController.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 18/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class PostsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let postCellId = "postCellId"
    
    var apiService: ApiServiceDataSource?
    
    var posts: [Post]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.backgroundColor = .blue
        
        apiService = ApiServiceDataSource()
        
//        apiService?.sampleSetPostFirebase()
        fetchPosts()
        
        collectionView?.register(PostCell.self, forCellWithReuseIdentifier: postCellId)
        
        
    }
    
    func fetchPosts() {
        apiService?.fetchPosts { (posts) in
            self.posts = posts
            //print(posts)
            self.collectionView?.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = posts?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postCellId, for: indexPath) as! PostCell
        
        cell.post = posts?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(view.frame.width - 28, 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 14, bottom: 0, right: 14)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

