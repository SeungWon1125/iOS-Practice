//
//  ViewController.swift
//  LoginProject
//
//  Created by 김승원 on 5/20/24.
//

import UIKit

// 클래스는 구조체보다 느림 (동적 디스패치 때문에)
// final 붙이면 더이상 상속을 하지 못하게 막음 -> 매서드가 다이렉트 디스패치가 일어나도록 하게 하는 키워드
final class ViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }

    
    
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // 1
//        textField.resignFirstResponder() // 2
    }
     
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: - Selectors
    
    @objc private func resetButtonTapped() {
        // 얼럿 컨트롤러 만들기
        let alertController = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert) // 뷰 같은 역할
        /* alertStyle */
        // alert: 알림 창
        // actionSheet: 아래에서 올라오는 창
        
        // action 만들기
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼 눌림")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소버튼 눌림")
        }
        
        // action 올리기
        alertController.addAction(success)
        alertController.addAction(cancel)
        
        // 다음 화면으로 넘어가는 매서드
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func loginButtonTapped() {
        print("loginButton Tapped")
    }
    
}

