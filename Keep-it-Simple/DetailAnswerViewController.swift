//
//  DetailPostViewController.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 20/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class DetailAnswerViewController: UIViewController {
    
    var answer: Answer? {
        didSet {
            answerTextView.text = answer?.description as String?
        }
    }
    
    var post: Post? {
        didSet {
            titleLabel.text = post?.title as String?
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.backgroundColor = UIColor.rgb(red: 76, green: 103, blue: 140)
        return label
    }()
    
    
    let answerTextView: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .justified
        tv.font = .systemFont(ofSize: 18)
        tv.isEditable = false
        tv.backgroundColor = .white
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(answerTextView)
        
        view.addConstrainstWithFormat("H:|-4-[v0]-4-|", views: titleLabel)
        view.addConstrainstWithFormat("H:|-4-[v0]-4-|", views: answerTextView)
        
        view.addConstrainstWithFormat("V:[v0(\(view.frame.height * 0.15))][v1(\(view.frame.height * 0.75))]|", views: titleLabel, answerTextView)

        
    }
    
}
