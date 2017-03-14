//
//  AnswerCell.swift
//  Keep-it-Simple
//
//  Created by Fernando on 14/03/2017.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit


class AnswerCell: BaseCell {
    
    var answer: Answer? {
        didSet{
            userNameLabel.text = answer?.userId as String?
            
            
            if let upVotes = answer?.upVotes{
                upVotesLabel.text = "UpVotes: \(upVotes)"
                
            }
            
            if let downVotes = answer?.downVotes {
                downVotesLabel.text = "DownVotes: \(downVotes)"
            }
            
            if let numViews = answer?.views {
                viewsLabel.text = "Views: \(numViews)"
            }

        }
    }
    
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .center
        label.backgroundColor = UIColor.rgb(red: 76, green: 103, blue: 140)
        return label
    }()
    
    let upVotesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    let downVotesLabel: UILabel = {
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
        
        addSubview(userNameLabel)
        addSubview(upVotesLabel)
        addSubview(downVotesLabel)
        addSubview(viewsLabel)
        
        addConstrainstWithFormat("H:|[v0]|", views: userNameLabel)
        addConstrainstWithFormat("H:[v0(\(frame.width * 0.33))]-2-[v1(\(frame.width * 0.33))]-2-[v2(\(frame.width * 0.33))]", views: upVotesLabel, downVotesLabel, viewsLabel)
        
        
        addConstrainstWithFormat("V:[v0(50)]-2-[v1(40)]", views: userNameLabel, upVotesLabel)
        
        //Constraint for DownVotes
        //Top
        addConstraint(NSLayoutConstraint(item: downVotesLabel, attribute: .top, relatedBy: .equal, toItem: userNameLabel, attribute: .bottom, multiplier: 1, constant: 2))
        
        //Height
        let downVotesHeightConstraint = NSLayoutConstraint(item: downVotesLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 40)
        addConstraint(downVotesHeightConstraint)
        
        //Constraint for Views
        //Top
        addConstraint(NSLayoutConstraint(item: viewsLabel, attribute: .top, relatedBy: .equal, toItem: userNameLabel, attribute: .bottom, multiplier: 1, constant: 2))
        
        //Height
        let viewsHeightConstraint = NSLayoutConstraint(item: viewsLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 40)
        addConstraint(viewsHeightConstraint)
        
        //addConstrainstWithFormat("V:|-154-[v0(30)]", views: downVotesLabel)
        
        //        addConstrainstWithFormat("H:|[v0][v1][v2][v3]|", views: titleLabel, descriptionLabel, upVotesLabel, downVotesLabel)
        //        addConstrainstWithFormat("V:|[v0][v1][v2][v3]|", views: titleLabel, descriptionLabel, upVotesLabel, downVotesLabel)
        
        
    }
}
