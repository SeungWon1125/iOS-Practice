//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김승원 on 5/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 컴퓨터가 랜덤으로 숫자 선택
    var comNumer = Int.random(in: 1...10)
    
    // 앱의 화면에 들어오면 가장 처음에 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 메인레이블에 "선택하세요" 표시
        // 숫자 레이블에 빈 문자열 표시

        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        // 버튼 숫자를 가져와야 함
        // 숫자 레이블이 변하도록 (숫자에 따라)
        // 선택한 숫자를 변수에 저장 (선택)
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 컴퓨터의 숫자와 내 숫자를 비교하여 Up / DOWN / BINGO 표시 (메인 레이블)
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 메인 레이블에 "선택하세요"
        // 컴퓨터의 랜덤숫자 다시 선택하도록
        // 숫자 레이블에 빈 문자열 표시
        
    }
    
    
}

