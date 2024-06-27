//
//  MyNewCell.swift
//  CollectionViewPractice
//
//  Created by 김승원 on 6/27/24.
//

import UIKit

class MyNewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
