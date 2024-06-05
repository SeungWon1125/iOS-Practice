//
//  MemberCell.swift
//  CDPractice
//
//  Created by 김승원 on 6/4/24.
//

import UIKit

class MemberCell: UITableViewCell {
    // MARK: - UI Components
    // 사진
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person.fill")
        return iv
    }()
    
    // 멤버 라벨
    let memberNameLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 12)
        return lb
    }()
    
    // 주소
    let addressLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 10)
        return lb
    }()
    
    // 스택 뷰
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        return sv
    }()
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
    }
    
    // MARK: - set up UI
    private func setupUI() {
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(addressLabel)
        
        // 제약 조건 호출
        setupConstraints()
    }
    
    // MARK: - set up Constraints
    private func setupConstraints() {
        // 프로필 사진
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0).isActive = true
        
        // 이름, 주소 스텍 뷰
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor).isActive = true
        
        // 이름 라벨
        memberNameLabel.translatesAutoresizingMaskIntoConstraints = false
        memberNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // 주소 라벨
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
}
