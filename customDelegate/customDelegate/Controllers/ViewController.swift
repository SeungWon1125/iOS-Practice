//
//  ViewController.swift
//  customDelegate
//
//  Created by 김승원 on 6/2/24.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Variables
    var memberListManager = MemberListManager()
    
    lazy var plusButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return btn
    }()

    
    // MARK: - UI Components

    // 뷰를 따로 만들지 않아도 된다 (뷰의 역할을 함)
    private let tableView = UITableView()


    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDatas()
        setupTableView()
        setupNavigationBar()
        setupUI()
        setupConstraints()
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }
    // MARK: - set up NavigationBar
    func setupNavigationBar() {
        title = "회원 목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    // MARK: - set up TableView
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        // cell 등록
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }

    

    // MARK: - set up Datas
    func setupDatas() {
        // 멤버 데이터 생성
        memberListManager.makeMembersListDatas()
    }

    
    
    // MARK: - set up UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
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
    
    // MARK: - Selectors
    @objc func plusButtonTapped() {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

// MARK: - UITableView DataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
        
        // 멤버만 전달하여 셀에서 속성감시자를 통해
        // 알아서 관리하게끔 (변수가 바뀔 때마다 실행하도록)
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음 화면으로 넘어가는 코드
        let vc = DetailViewController()
        // DetailView로 넘어가기 전에 DetailView의 대리자를
        // 자기 자신인 ViewController로 설정
        // 이렇게만 하면 강한순환참조가 일어남
        vc.delegate = self
        
        let array = memberListManager.getMemberList()
        vc.member = array[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - 커스텀 델리게이트
extension ViewController: MemberDelegate {
    func addNewMember(_ member: Member) {
        print(#function)
        memberListManager.makeNewMember(member)
        tableView.reloadData()
    }
    
    func update(index: Int, _ member: Member) {
        print(#function)
        memberListManager.updateMemberInfo(index: index, member)
        tableView.reloadData()
    }
    
    
}
