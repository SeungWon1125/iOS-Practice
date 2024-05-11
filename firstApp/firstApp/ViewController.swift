//
//  ViewController.swift
//  firstApp
//
//  Created by 김승원 on 5/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    
    // 앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLabel.text = "안녕하세요"
        mainLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        mainLabel.textColor = .yellow
        
        myButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myButton.setTitleColor(.yellow, for: .normal)
    }
    


}

