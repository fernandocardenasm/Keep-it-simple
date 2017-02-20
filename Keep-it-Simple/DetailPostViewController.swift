//
//  DetailPostViewController.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 20/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    var post: Post? {
        didSet {
            titleLabel.text = post?.title as String?
            descriptionTextView.text = post?.description as String?
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.backgroundColor = .red
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .justified
        tv.font = .systemFont(ofSize: 18)
        tv.isEditable = false
        tv.backgroundColor = .yellow
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionTextView)
        
        view.addConstrainstWithFormat("H:|-4-[v0]-4-|", views: titleLabel)
        view.addConstrainstWithFormat("H:|-4-[v0]-4-|", views: descriptionTextView)
        
        view.addConstrainstWithFormat("V:[v0(\(view.frame.height * 0.20))][v1(\(view.frame.height * 0.75))]|", views: titleLabel, descriptionTextView)

    }
    
}
