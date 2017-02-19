//
//  PostCell.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 19/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class PostCell: BaseCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
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
        
//        addConstrainstWithFormat("H:|[v0][v1][v2][v3]|", views: titleLabel, descriptionLabel, upVotesLabel, downVotesLabel)
//        addConstrainstWithFormat("V:|[v0][v1][v2][v3]|", views: titleLabel, descriptionLabel, upVotesLabel, downVotesLabel)
        
        
    }
}
