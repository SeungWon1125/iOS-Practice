//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 김승원 on 5/14/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        configureUI()
        
    }
    
    func configureUI() {
        view.backgroundColor = .lightGray
        
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 입력!"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        textField.placeholder = "이메일 입력+"
    }
    
    // 텍스트필드의 입력을 시작할 때 호출 (입력을 시작할지 말지 여부를 허락하는 매서드)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 참과 거짓을 리턴하지 않는 매서드들은 보통 시점을 나타냄
    // 유저가 택스트필드의 입력을 시작한 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("user stared typing")
    }
    
    // 텍스트필드에 글자를 없앨지 말지
    // should가 들어가면 허락할지 말지임
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드 한글자 타이핑, 삭제 할 때마다 호출하는 매서드
    // 타이핑 허락 여부
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil {
            // 정수형으로 변환이 되면, 숫자라면 키보드 타이핑 x
            return false
        } else {
            textField.placeholder = "이메일 입력~"
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
    
    // 엔터가 눌러지면 다음 동작을 허락할 건지 말 것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        if textField.text == "" {
            textField.placeholder = "TYPE SOMETHING!!!"
            return false
        } else {
            textField.resignFirstResponder()
            return true
        }
    }
    
    // 텍스트필드의 입력이 끝날 때 호출 (텍스트 필드 입력을 끝날지 말지 여부)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드 실제 입력이 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("타이핑 끝")
        print(#function)
    }
    
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    


}

