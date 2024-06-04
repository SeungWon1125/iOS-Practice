//
//  MemberCell.swift
//  CDPractice
//
//  Created by 김승원 on 6/4/24.
//

import UIKit

class MemberCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
