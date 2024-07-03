//
//  MusicCell.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import UIKit
import SnapKit

class MusicCell: UICollectionViewCell {
    // MARK: - UIComponents
    let albumImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .gray
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "loading..."
        lb.textAlignment = .left
        lb.numberOfLines = 2
        lb.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        return lb
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.contentView.addSubview(albumImageView)
        self.contentView.addSubview(nameLabel)
        
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints {
    private func setupConstraints() {
        albumImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(albumImageView).offset(10)
            make.bottom.equalTo(albumImageView).offset(-10)
        }
        
    }
    
}
