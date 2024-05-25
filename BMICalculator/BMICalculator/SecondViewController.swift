//
//  SecondViewController.swift
//  BMICalculator
//
//  Created by 김승원 on 5/25/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Variables
    
    
    
    // MARK: - BMI 결과값
    private lazy var BMILabel: UILabel = {
        let lb = UILabel()
        lb.text = "BMI 결과값"
        lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        lb.textAlignment = .center
        lb.textColor = .label
        return lb
    }()
    
    // MARK: - 가운데 결과 라벨
    private lazy var resultLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Loading..."
        lb.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        lb.textColor = .label
        lb.textAlignment = .center
        lb.layer.cornerRadius = 5
        lb.layer.masksToBounds = true
        lb.backgroundColor = .red
        return lb
    }()
    
    // MARK: - 추가 라벨
    private lazy var adviceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Loading..."
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        lb.textColor = .label
        lb.textAlignment = .center
        return lb
    }()
    
    // MARK: - 스택뷰
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        sv.alignment = .fill
        sv.distribution = .fill
        return sv
    }()

    // MARK: - 버튼
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
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
        view.backgroundColor = .white
        
        stackView.addArrangedSubview(BMILabel)
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(adviceLabel)
        
        view.addSubview(stackView)
        
        view.addSubview(backButton)
        
        setupConstraints()
    }
    
    // MARK: - set up Constraints
    private func setupConstraints() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 130).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -30).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
    // MARK: - Selectors
    @objc private func backButtonTapped() {
        print("backButton Tapped")
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Extensions

