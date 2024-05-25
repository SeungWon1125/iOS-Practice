//
//  NextViewController.swift
//  NextVCPractice
//
//  Created by 김승원 on 5/25/24.
//

import UIKit

class NextViewController: UIViewController {

    // MARK: - Variables
    // 일반적으로 데이터를 전달을 받을 때 옵셔널로 선언
    // 옵셔널로 선언하지 않으면 생성자를 만들어야 함
    // 저장속성에 기본값이 없기 때문에 옵셔널로 선언하면 초기값이 nil로 자동 선언
    var someString: String?
    
    // MARK: - UI Components
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = someString // 굳이 옵셔널 바인딩 필요 없음 (애초에 label의 text가 옵셔널 스트링으로 선언되어있음)
        lb.font = UIFont.systemFont(ofSize: 22)
        return lb
    }()
    
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - set up UI
    private func setupUI() {
        view.backgroundColor = .gray
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        
        setupConstraints()
    }
    
    // MARK: - set up Constraints
    private func setupConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    // MARK: - Selectors
    @objc private func backButtonTapped() {
        print("backButton Tapped")
        dismiss(animated: true, completion: nil) // 전 화면으로 돌아가기
    }
    
    // MARK: - Extensions
    

}
