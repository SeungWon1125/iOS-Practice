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
    
    @IBOutlet weak var slider: UISlider!
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    // MARK: - configureUI
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        
        // 슬라이더 가운데 설정
        slider.value = 0.0
        
        
    }
    
    // MARK: - Actions
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더 벨류값을 가지고 메인 레이블의 텍스트 세팅
        let seconds = String(Int(slider.value * 60))
        mainLabel.text = seconds + " sec"
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈 때마다 무언가를 실행
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        mainLabel.text = "초를 선택하세요"

        // 슬라이더 가운데 설정
        slider.setValue(0.0, animated: true)
        
    }
    
}

