//
//  ViewController.swift
//  NextVCPractice
//
//  Created by 김승원 on 5/25/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    // MARK: - Variables
    
    // MARK: - UI Components
    private lazy var nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("next", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        setupUI()
    }
    
    // MARK: - set up UI
    private func setupUI() {
        view.addSubview(nextButton)
        
        setupConstraints()
    }
    
    // MARK: - set up Constraints
    private func setupConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 170).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    // MARK: - Selectors
    @objc private func nextButtonTapped() {
        let nextVC = NextViewController() // 인스턴스 생성 (메모리에만 올려놓기)
        nextVC.someString = "iOS-Practice"
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil) // completion: 화면 이동 후에 할 행동
        
        print("nextButton Tapped")
    }
    
    // MARK: - Extensions


}

