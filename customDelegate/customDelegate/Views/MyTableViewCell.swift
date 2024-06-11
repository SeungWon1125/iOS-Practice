//
//  MyTableViewCell.swift
//  customDelegate
//
//  Created by 김승원 on 6/2/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    // 속성 감시자 구현
    // 멤버라는 저장속성을 항상 감시하는 속성 감시자
    // 멤버라는 변수가 변할 때마다 실행
    // 데이터 모델만 전달을 받으면 된다.
    var member: Member? {
        didSet {
            guard var member = member else { return }
            mainImageView.image = member.memberImage
            memberNameLabel.text = member.name
            addressLabel.text = member.address
        }
    }
    
    
    // MARK: - UI Components
    // 사진
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // 멤버 라벨
    let memberNameLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 12)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    // 주소
    let addressLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 10)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    // 스택 뷰
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setupConstraints()
    }

    func setupStackView() {
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(addressLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - update Constraints
//    override func updateConstraints() {
//        setupConstraints()
//        super.updateConstraints()
//    }
    
    // MARK: - layout SubViews
    // 레이아웃이 결정되는 순간이 이 함수 이후이기 때문에
    // 이 함수에서 cornerRadius를 설정해줘야 정확히 동그랗게 자를 수 있다.
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
    }
    
    // MARK: - set up Constraints
    func setupConstraints() {
        mainImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0).isActive = true
        
        memberNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor).isActive = true
    }
}
