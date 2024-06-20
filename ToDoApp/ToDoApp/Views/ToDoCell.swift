//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by 김승원 on 6/20/24.
//

import UIKit

class ToDoCell: UITableViewCell {
    // MARK: - Variables
    
    // MARK: - UI Components
    // 배경
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryLabel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 투두 텍스트
    let toDoTextLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 17)
        lb.text = "0\n0\n0\n0\n0\n0\n0\n0\n0"
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    // 날짜, 버튼 담을 뷰
    let basicView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 날짜 텍스트
    let dateTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.text = "2024-06-20"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 업데이트 버튼
    lazy var updateButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 9)
        btn.setImage(UIImage(systemName: "pencil.tip"), for: .normal)
        btn.setTitle("UPDATE", for: .normal)
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .yellow
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // 삭제 버튼
    lazy var deleteButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 9)
        btn.setImage(UIImage(systemName: "x.circle"), for: .normal)
        btn.setTitle("DELETE", for: .normal)
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .yellow
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // 투두 텍스트랑 뷰 스텍뷰
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [toDoTextLabel, basicView])
        sv.spacing = 10
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    // MARK: - override init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    func setupUI() {
        self.contentView.addSubview(bgView)
        self.contentView.addSubview(stackView)
        
        basicView.addSubview(dateTextLabel)
        basicView.addSubview(updateButton)
        basicView.addSubview(deleteButton)
        
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 8
        
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 10
        
        deleteButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 10
        
        setupConstraints()
//        setConstraints()
    }
    
    // MARK: - Set up Constraints
    func setupConstraints() {
        bgView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25).isActive = true
        bgView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25).isActive = true
        bgView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        bgView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: self.bgView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.bgView.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: self.bgView.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bgView.bottomAnchor, constant: -10).isActive = true
        
        toDoTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        
        basicView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dateTextLabel.leadingAnchor.constraint(equalTo: self.basicView.leadingAnchor, constant: 0).isActive = true
        dateTextLabel.bottomAnchor.constraint(equalTo: self.basicView.bottomAnchor, constant: 0).isActive = true
        
        updateButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        updateButton.trailingAnchor.constraint(equalTo: self.basicView.trailingAnchor, constant: 0).isActive = true
        updateButton.bottomAnchor.constraint(equalTo: self.basicView.bottomAnchor, constant: 0).isActive = true
        
        deleteButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: self.updateButton.leadingAnchor, constant: -5).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: self.basicView.bottomAnchor, constant: 0).isActive = true
        
        // 우선순위 정하기
        toDoTextLabel.setContentCompressionResistancePriority(.init(rawValue: 751), for: .horizontal)
        
    }
    
    

}
