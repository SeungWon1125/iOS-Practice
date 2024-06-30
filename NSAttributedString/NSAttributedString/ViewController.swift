//
//  ViewController.swift
//  NSAttributedString
//
//  Created by 김승원 on 6/30/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var testLabel: UILabel = {
        let lb = UILabel()
        lb.attributedText = boldAttributedString("Don't have an account?", "Sign Up")
        return lb
    }()
    
    lazy var testLabel2: UILabel = {
        let lb = UILabel()
        lb.attributedText = boldAttributedString2("Don't have an account? Sign Up", ["have", "Sign Up"])
        return lb
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [testLabel, testLabel2])
        sv.axis = .vertical
        sv.spacing = 10
        sv.alignment = .center
        sv.distribution = .fillEqually
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

// MARK: - NSAttributedString
extension ViewController {
    //bold - 텍스트 지정
    func boldAttributedString(_ plainPart: String, _ boldPart: String) -> NSAttributedString{
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.font] = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        let text = NSMutableAttributedString(string: "\(plainPart) ", attributes: plainTextAttributes)
        text.append(NSAttributedString(string: "\(boldPart)", attributes: boldTextAttributes))
        
        return text
    }
    
    // bold - 범위 지정
    func boldAttributedString2(_ fullString: String, _ boldParts: [String]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: fullString)
        let plainFont = UIFont.systemFont(ofSize: 15, weight: .regular)
        let boldFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        let fullRange = NSRange(location: 0, length: fullString.count)
        attributedString.addAttribute(.font, value: plainFont, range: fullRange)
        
        for boldPart in boldParts {
            let range = (fullString as NSString).range(of: boldPart)
            if range.location != NSNotFound {
                attributedString.addAttribute(.font, value: boldFont, range: range)
            }
        }
        
        return attributedString
    }
}

