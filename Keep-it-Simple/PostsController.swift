//
//  ViewController.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 18/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit
import SwiftSpinner

class PostsController: UICollectionViewController, UICollectionViewDelegateFlowLayout,UISearchBarDelegate {
    
    let postCellId = "postCellId"
    
    var apiService: ApiServiceDataSource?
    
    var posts: [Post]?
    
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.searchBarStyle = UISearchBarStyle.default
        search.placeholder = " Search..."
        search.sizeToFit()
        search.isTranslucent = false
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.backgroundColor = .blue
        
        apiService = ApiServiceDataSource()
        
        apiService?.sampleSetPostFirebase()
        
        collectionView?.register(PostCell.self, forCellWithReuseIdentifier: postCellId)
        
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
    }
    
    //Detail Post
    
    func fetchPosts(question: String) {
        
        
        SwiftSpinner.show("You look great today!")
        
        apiService?.fetchPosts(question: question, completion: { (posts) in
            
            if posts.count == 0 {
                print("0 elements")
            }
            
            SwiftSpinner.hide()
            
            self.posts = posts
            self.collectionView?.reloadData()
            
        })
    }
    
    func showAppDetailForPost(post: Post){
        let detailPostViewController = DetailPostViewController()
        detailPostViewController.post = post
        navigationController?.pushViewController(detailPostViewController, animated: true)
    }
    
    //For the Search Bar
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Clicked")
        
        fetchPosts(question: searchBar.text!)
        
        self.searchBar.setShowsCancelButton(false, animated: true)
        self.searchBar.endEditing(true)

    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.setShowsCancelButton(false, animated: true)
        self.searchBar.endEditing(true)
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let post = posts?[indexPath.item] {
            showAppDetailForPost(post: post)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(view.frame.width - 28, 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 14, bottom: 0, right: 14)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

