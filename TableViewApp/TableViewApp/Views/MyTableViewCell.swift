//
//  MyTableViewCell.swift
//  TableViewApp
//
//  Created by 김승원 on 5/28/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    // MARK: - UI Components
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let movieTitleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        lb.numberOfLines = 1
        return lb
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 17)
        lb.numberOfLines = 3 //0
        return lb
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 8
        return sv
    }()

    // MARK: - Life Cycle
    // 이거 필수
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupStackView
    func setupStackView() {
        // cell에서는 그냥 addView보다 contentView에 addView하는 게 더 정확
        // 기본으로 contentView를 가지고 있기 때문에
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(movieTitleLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15).isActive = true
        stackView.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
        
    }


}
