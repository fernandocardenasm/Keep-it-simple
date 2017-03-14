//
//  DisplayAnswersController.swift
//  Keep-it-Simple
//
//  Created by Fernando on 14/03/2017.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class DisplayAnswersController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let answerCellId = "answerCellId"
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .blue
        
        collectionView?.register(AnswerCell.self, forCellWithReuseIdentifier: answerCellId)

        
    }
    
    func showAppDetailForAnswer(answer: Answer){
        let detailPostViewController = DetailAnswerViewController()
        detailPostViewController.answer = answer
        detailPostViewController.post = post
        navigationController?.pushViewController(detailPostViewController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let answer = post?.answers?[indexPath.item] {
            showAppDetailForAnswer(answer: answer)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = post?.answers?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: answerCellId, for: indexPath) as! AnswerCell
        
        cell.answer = post?.answers?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(view.frame.width - 28, 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 14, bottom: 0, right: 14)
    }
    
}
