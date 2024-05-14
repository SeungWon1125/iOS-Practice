//
//  ViewController.swift
//  firstNewApp
//
//  Created by 김승원 on 5/14/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    
    @IBOutlet weak var mainLabel: UILabel!
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    // MARK: - configureUI
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
    }
    
    // MARK: - Actions
    @IBAction func sliderChanged(_ sender: UISlider) {
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
    }
    
}

