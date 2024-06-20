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
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let toDoTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let basicView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [toDoTextLabel, basicView])
        stview.spacing = 10
        stview.axis = .vertical
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    let dateTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var updateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 9)
        button.setImage(UIImage(systemName: "pencil.tip"), for: .normal)
        button.setTitle("UPDATE", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        return button
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
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    func setupConstraints() {
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25).isActive = true
        bgView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25).isActive = true
        bgView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        bgView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
    

}
