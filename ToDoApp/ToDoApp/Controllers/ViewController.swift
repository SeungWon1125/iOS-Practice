//
//  ViewController.swift
//  ToDoApp
//
//  Created by 김승원 on 6/19/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI Components
    private let tableView = UITableView()
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        setupNavigationBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Set up NavigationBar
    func setupNavigationBar() {
        self.title = "메모"
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 네비게이션바 우측에 Plus 버튼 만들기
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }
    
    // MARK: - Set up UI
    func setupUI() {
        self.view.backgroundColor = .systemBackground
    }
    
    // MARK: - Set Up TableView
    func setupTableView() {
        tableView.register(ToDoCell.self, forCellReuseIdentifier: Cell.ToDoCellIdentifier)
        self.view.addSubview(tableView)
        tableView.dataSource = self
//        tableView.delegate = self
        
        tableView.separatorStyle = .none
        
        setupTableViewConstrains()
    }
    
    // MARK: - Set up TableView Constraints
    func setupTableViewConstrains(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    // MARK: - Selectors
    @objc func plusButtonTapped() {
        print(#function)
        let vc = DetailViewViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


// MARK: - TableView DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.ToDoCellIdentifier, for: indexPath) as! ToDoCell
        return cell
    }
}

// MARK: - TableView Delegate
//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        200
//    }
//}
