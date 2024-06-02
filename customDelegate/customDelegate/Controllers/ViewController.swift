//
//  ViewController.swift
//  customDelegate
//
//  Created by 김승원 on 6/2/24.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - 테이블 뷰
    // 뷰를 따로 만들지 않아도 된다 (뷰의 역할을 함)
    private let tableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        addViews()
        setupConstraints()
        
    }
    // MARK: - addViews
    private func addViews() {
        view.addSubview(tableView)
    }

    
    
    // MARK: - 제약 조건
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

