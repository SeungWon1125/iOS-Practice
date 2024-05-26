//
//  BMICalculatorManager.swift
//  BMICalculator
//
//  Created by 김승원 on 5/26/24.
//

import UIKit

// BMI를 계산하는 객체의 역할을 수행
// 사실상 구조체보다는 class로 만드는 것이 더 큰 프로젝트 단위에서는 좋음
struct BMICalculatorManager {
    var bmi: Double?
    
    // MARK: - bmi 계산 매서드
    // 속성을 수정하는 함수를 작성했다면
    // 앞에 mutating키워드를 작성해야 한다 (struct)
    // class로 만든다면 mutating키워드 필요 없음
    mutating func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = 0.0
            return
        }
        
        var bmiNumber = w / (h * h) * 10000
        bmi = round(bmiNumber * 10) / 10 // 반올림 코드
//        print("BMI결과값: \(bmi ?? 0.0)")
    }
    
    func getBMIResult() -> Double {
        // bmi에 nil이 들어있으면 기본값 0.0
        return bmi ?? 0.0
    }
        
    // MARK: -  다음 화면 배경 색 매서드
    func getBackgroundColor() -> UIColor {
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
    
    // MARK: - 문자열 얻는 매서드
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

