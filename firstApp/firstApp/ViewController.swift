//
//  ViewController.swift
//  firstApp
//
//  Created by 김승원 on 5/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLabel.text = "안녕하세요"
        mainLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        mainLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    


}

