//
//  ViewController.swift
//  BMICalculator
//
//  Created by 김승원 on 5/25/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables

    
    
    // MARK: - 메인 라벨
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "키와 몸무게를 입력해 주세요"
        lb.textColor = .label
        lb.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lb.textAlignment = .center
        return lb
    }()
    
    // MARK: - 키 입력
    // 키 라벨
    private lazy var heightLabel: UILabel = {
        let lb = UILabel()
        lb.text = "키"
        lb.textColor = .label
        lb.font = UIFont.systemFont(ofSize: 18)
//        lb.backgroundColor = .yellow
        lb.textAlignment = .center
        return lb
    }()
    
    // 키 텍스트 필드
    private lazy var heightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .label
        tf.tintColor = .black
        tf.placeholder = "키 입력"
        tf.borderStyle = .roundedRect
        tf.frame.size.height = 35
        tf.clearButtonMode = .always
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = true
        return tf
    }()
    
    // 키 스택 뷰
    private lazy var heightStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.spacing = 15
        sv.alignment = .center
        return sv
    }()
    
    // MARK: - 몸무게 입력
    // 몸무게 라벨
    private lazy var weightLabel: UILabel = {
        let lb = UILabel()
        lb.text = "몸무게"
        lb.textColor = .label
        lb.font = UIFont.systemFont(ofSize: 18)
//        lb.backgroundColor = .yellow
        lb.textAlignment = .center
        return lb
    }()
    
    // 몸무게 텍스트 필드
    private lazy var weightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .label
        tf.tintColor = .black
        tf.placeholder = "몸무게 입력"
        tf.borderStyle = .roundedRect
        tf.frame.size.height = 35
        tf.clearButtonMode = .always
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = true
        return tf
    }()
    
    // 몸무게 스택 뷰
    private lazy var weightStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.spacing = 15
        sv.alignment = .center
        return sv
    }()
    
    // MARK: - 전체 스택 뷰
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 15
        sv.alignment = .fill
//        sv.backgroundColor = .red
        return sv
    }()
    
    // MARK: - 다음 뷰 버튼
    private lazy var nextVCButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("다음", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return btn
    }()

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // 1
//        textField.resignFirstResponder() // 2
    }
    
    // MARK: - set up UI
    private func setupUI() {
        view.backgroundColor = .gray
        
        mainStackView.addArrangedSubview(mainLabel)
        
        heightStackView.addArrangedSubview(heightLabel)
        heightStackView.addArrangedSubview(heightTextField)
        mainStackView.addArrangedSubview(heightStackView)
        
        weightStackView.addArrangedSubview(weightLabel)
        weightStackView.addArrangedSubview(weightTextField)
        mainStackView.addArrangedSubview(weightStackView)
        
        view.addSubview(mainStackView)
        
        
        view.addSubview(nextVCButton)
        
        
        setupConstraints()
    }
    
    // MARK: - set up Constraints
    private func setupConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        heightLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        weightLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 130).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        nextVCButton.translatesAutoresizingMaskIntoConstraints = false
        nextVCButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -30).isActive = true
        nextVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextVCButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        nextVCButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    // MARK: - Selectors
    @objc private func nextButtonTapped() {
        print("nextButton Tapped")
        let VC = SecondViewController()
        present(VC, animated: true, completion: nil)
        
    }
}

extension ViewController: UITextFieldDelegate{
    
}

