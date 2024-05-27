//
//  FirstViewController.swift
//  Nav&Tab
//
//  Created by 김승원 on 5/27/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("next", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        return btn
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTargets()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - addTargets
    private func addTargets() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    
    
    // MARK: - set up UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(nextButton)
        
        setupNavigationBar()
        setupConstraints()
    }
    
    
    // MARK: - set up Constraints
    private func setupConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
    }
    
    // MARK: - set up NavigationBar
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 색상 불투명
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .systemBlue // 버튼 색상
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.title = "Main"
    }

    
    
    // MARK: - Selectors
    @objc private func nextButtonTapped() {
        print(#function)
        let VC = NextViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }

}
