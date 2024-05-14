//
//  ViewController.swift
//  firstNewApp
//
//  Created by 김승원 on 5/14/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - Variables
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0
    
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
        number = Int(seconds)!
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈 때마다 무언가를 실행
        timer?.invalidate() // 혹시 몰라 타이머를 미리 죽이는 코드
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomthingAfter1Second), userInfo: nil, repeats: true)
        
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self]_ in
//            //  반복하고 싶은 코드
//            if number > 0 {
//                number -= 1
//                slider.value = Float(number) / Float(60) // value에 0~1사이의 Float값만 들어갈 수 있음
//                mainLabel.text = "\(number) sec"
//                
//            } else {
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//                // 소리를 나게 해야함
//                AudioServicesPlayAlertSound(SystemSoundID(1322))
//                
//                // 타이머 설정 죽어여야 함
//                timer?.invalidate() // 타이머 죽이는 코드
//            }
//            
//        }
        
    }
    
    @objc func doSomthingAfter1Second() {
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60) // value에 0~1사이의 Float값만 들어갈 수 있음
            mainLabel.text = "\(number) sec"
            
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            // 소리를 나게 해야함
            AudioServicesPlayAlertSound(SystemSoundID(1322))
            
            // 타이머 설정 죽어여야 함
            timer?.invalidate() // 타이머 죽이는 코드
            // 타이머는 스스로 언제 끝날지 모르기 때문에
            // 타이머를 죽이는 코드를 꼭 만들어야 함
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        mainLabel.text = "초를 선택하세요"

        // 슬라이더 가운데 설정
        slider.setValue(0.0, animated: true)
        
        // number 변수 초기화 세팅
        number = 0
        
        // 타이머 비활성화
        timer?.invalidate()
        
    }
    
}

