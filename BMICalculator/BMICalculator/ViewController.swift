//
//  ViewController.swift
//  BMICalculator
//
//  Created by 김승원 on 5/25/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables
    var bmi: Double?
    
    
    // MARK: - 메인 라벨
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "키와 몸무게를 입력해 주세요 🫧"
        lb.textColor = .label
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textAlignment = .center
        return lb
    }()
    
    // MARK: - 키 입력
    // 키 라벨
    private lazy var heightLabel: UILabel = {
        let lb = UILabel()
        lb.text = "키"
        lb.textColor = .label
        lb.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
//        lb.backgroundColor = .yellow
        lb.textAlignment = .right
        return lb
    }()
    
    // 키 텍스트 필드
    private lazy var heightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .label
        tf.tintColor = .black
        tf.placeholder = "cm단위로 입력해 주세요"
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
        lb.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
//        lb.backgroundColor = .yellow
        lb.textAlignment = .right
        return lb
    }()
    
    // 몸무게 텍스트 필드
    private lazy var weightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .label
        tf.tintColor = .black
        tf.placeholder = "kg 단위로 입력해 주세요"
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
        btn.setTitle("BMI 계산하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
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
        view.backgroundColor = .systemGray5
        
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
        
        if weightTextField.text == "" || heightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야 합니다!! 🔥"
            mainLabel.textColor = .systemRed
        } else {
            guard let height = heightTextField.text, let weight = weightTextField.text else { return }
            
            let bmi = calculateBMI(height: height, weight: weight)
            let VC = SecondViewController()
            
            // 데이터 전달
            VC.bmiNumber = bmi
            VC.adviceString = getBMIAdviceString()
            VC.bmiColor = getBackgroundColor()
            
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: true, completion: nil)
            
            // 다음화면으로 넘어가기 전에 TextField 비우기
            mainLabel.text = "키와 몸무게를 입력해 주세요 🫧"
            mainLabel.textColor = .label
            heightTextField.text = ""
            weightTextField.text = ""
        }
    }
    
    // MARK: - Functions
    // bmi 계산 매서드
    private func calculateBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight) else { return 0.0 }
        bmi = w / (h * h) * 10000
        bmi = round((bmi ?? 0.0) * 10) / 10 // 반올림 코드
        print("BMI결과값: \(bmi ?? 0.0)")
        return bmi ?? 0.0
    }
    
    // 다음 화면 배경 색 매서드
    private func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    // 문자열 얻는 매서드
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30...:
            return "고도비만"
        default:
            return ""
        }
    }
}

// MARK: - Extensions

extension ViewController: UITextFieldDelegate{
    // 한 글자 마다 입력 허락 여부
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 숫자만 입력 허용
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
}

