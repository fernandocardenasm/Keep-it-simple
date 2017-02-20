//
//  PostCell.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 19/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class PostCell: BaseCell {
    
    var post: Post? {
        didSet{
            titleLabel.text = post?.title as String?
            descriptionLabel.text = post?.description as String?
            upVotesLabel.text = post?.upVotes.stringValue
            downVotesLabel.text = post?.downVotes.stringValue
        }
    }
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        return label
    }()
    
    let descriptionLabel: UILabel  = {
        let label = UILabel()
        label.numberOfLines = 6
        label.textAlignment = .justified
        label.backgroundColor = .green
        return label
    }()
    
    let upVotesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    let downVotesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        return label
    }()
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(upVotesLabel)
        addSubview(downVotesLabel)
        
        addConstrainstWithFormat("H:|[v0]|", views: titleLabel)
        addConstrainstWithFormat("H:|[v0]|", views: descriptionLabel)
        addConstrainstWithFormat("H:[v0(\(frame.width * 0.5))]-2-[v1(\(frame.width * 0.5))]", views: upVotesLabel, downVotesLabel)
        
        
        addConstrainstWithFormat("V:[v0(50)]-2-[v1(100)]-2-[v2(40)]", views: titleLabel, descriptionLabel, upVotesLabel)
        
        //Constraint for DownVotes
        //Top
        addConstraint(NSLayoutConstraint(item: downVotesLabel, attribute: .top, relatedBy: .equal, toItem: descriptionLabel, attribute: .bottom, multiplier: 1, constant: 2))
        
        //Height
        let downVotesHeightConstraint = NSLayoutConstraint(item: downVotesLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 40)
        addConstraint(downVotesHeightConstraint)
        
        //addConstrainstWithFormat("V:|-154-[v0(30)]", views: downVotesLabel)
        
//        addConstrainstWithFormat("H:|[v0][v1][v2][v3]|", views: titleLabel, descriptionLabel, upVotesLabel, downVotesLabel)
//        addConstrainstWithFormat("V:|[v0][v1][v2][v3]|", views: titleLabel, descriptionLabel, upVotesLabel, downVotesLabel)
        
        
    }
}
