//
//  BaseCell.swift
//  Keep-it-Simple
//
//  Created by Fernando Cardenas on 19/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

open class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews(){
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
