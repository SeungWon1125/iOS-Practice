//
//  MainView.swift
//  TableViewApp
//
//  Created by 김승원 on 5/28/24.
//

import UIKit

class MainView: UIView {

    
    // MARK: - 테이블 뷰
    let tableView = UITableView()


    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupUI()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    // MARK: - set up TableView
    func setupTableView() {
        tableView.rowHeight = 120
        
        // 셀 등록 과정 (필수)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }

    
    
    
    // MARK: - set up UI
    func setupUI() {
        self.backgroundColor = .red
        self.addSubview(tableView)
    }
    
    
    
    // MARK: - set up Constraints
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

