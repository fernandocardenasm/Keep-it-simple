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
            
            
            if let numAnswers = post?.answers?.count{
                numAnswersLabel.text = "Answers: \(numAnswers)"
                
                if let maxScore = post?.getMaxScoreForPost() {
                    maxScoreLabel.text = "Score: \(maxScore)"
                }
            }
            
            if let numViews = post?.views {
                viewsLabel.text = "Views: \(numViews)"
            }
            
        }
    }
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.backgroundColor = UIColor.rgb(red: 76, green: 103, blue: 140)
        return label
    }()
    
    let numAnswersLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    let maxScoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(titleLabel)
        addSubview(numAnswersLabel)
        addSubview(maxScoreLabel)
        addSubview(viewsLabel)
        
        addConstrainstWithFormat("H:|[v0]|", views: titleLabel)
        addConstrainstWithFormat("H:[v0(\(frame.width * 0.33))]-2-[v1(\(frame.width * 0.33))]-2-[v2(\(frame.width * 0.33))]", views: numAnswersLabel, maxScoreLabel, viewsLabel)
        
        
        addConstrainstWithFormat("V:[v0(50)]-2-[v1(40)]", views: titleLabel, numAnswersLabel)
        
        //Constraint for DownVotes
        //Top
        addConstraint(NSLayoutConstraint(item: maxScoreLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 2))
        
        //Height
        let downVotesHeightConstraint = NSLayoutConstraint(item: maxScoreLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 40)
        addConstraint(downVotesHeightConstraint)
        
        //Constraint for Views
        //Top
        addConstraint(NSLayoutConstraint(item: viewsLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 2))
        
        //Height
        let viewsHeightConstraint = NSLayoutConstraint(item: viewsLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 40)
        addConstraint(viewsHeightConstraint)
        
        //addConstrainstWithFormat("V:|-154-[v0(30)]", views: downVotesLabel)
        
//        addConstrainstWithFormat("H:|[v0][v1][v2][v3]|", views: titleLabel, descriptionLabel, upVotesLabel, downVotesLabel)
//        addConstrainstWithFormat("V:|[v0][v1][v2][v3]|", views: titleLabel, descriptionLabel, upVotesLabel, downVotesLabel)
        
        
    }
}
