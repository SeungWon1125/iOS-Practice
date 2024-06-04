//
//  ViewController.swift
//  CDPractice
//
//  Created by 김승원 on 6/4/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    let dataManager = MemberListManager()
    
    // MARK: - TableView
    private let tableView = UITableView()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupUI()
        setupTableView()
        setupNavigationBar()
    }
    // MARK: - set up Data
    private func setupData() {
        dataManager.makeMembersListDatas()
    }
    
    // MARK: - set up NavigationBar
    private func setupNavigationBar() {
        self.title = "프로필"
    }
    
    // MARK: - set up TableView
    private func setupTableView() {
        tableView.rowHeight = 60
        tableView.dataSource = self
        setupTableViewConstraints()
        
    }
    // MARK: - set up UI
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(tableView)
    }
    
    // MARK: - set up Constraints
    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
    }
}

// MARK: - Extensions
// dataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let memberArray = dataManager.getMemberList()
        let memberCount = memberArray.count
        return memberCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

