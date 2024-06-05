//
//  ViewController.swift
//  CDPractice
//
//  Created by 김승원 on 6/4/24.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Variables
    let dataManager = MemberListManager()
    
    // MARK: - TableView
    private let tableView = UITableView()
    
    // MARK: - plucButton
    lazy var plusButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return btn
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupUI()
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - set up Data
    private func setupData() {
        dataManager.makeMembersListDatas()
    }
    
    // MARK: - set up NavigationBar
    private func setupNavigationBar() {
        self.title = "회원 목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    // MARK: - set up TableView
    private func setupTableView() {
        tableView.rowHeight = 60
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // 테이블 뷰 제약조건
        setupTableViewConstraints()
        
        // 테이블 뷰 등록
        tableView.register(MemberCell.self, forCellReuseIdentifier: "MemberCell")
        
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
    
    // MARK: - Selectors
    @objc private func plusButtonTapped() {
        print(#function)
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extensions
// tableView 데이터소스
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let memberArray = dataManager.getMemberList()
        let memberCount = memberArray.count
        return memberCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberCell
        
        let memberArray = dataManager.getMemberList()
        var member = memberArray[indexPath.row]
        
        cell.mainImageView.image = member.memberImage
        cell.memberNameLabel.text = member.name
        cell.addressLabel.text = member.address
        cell.selectionStyle = .none
        
        return cell
    }
}

// tableView 델리게이트
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) cell Tapped")
        
        let vc = DetailViewController()
        let memberArray = dataManager.getMemberList()
        let member = memberArray[indexPath.row]
        
        vc.member = member
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

