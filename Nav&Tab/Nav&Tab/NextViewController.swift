//
//  NextViewController.swift
//  Nav&Tab
//
//  Created by 김승원 on 5/27/24.
//

import UIKit

class NextViewController: UIViewController {
    
    private lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("next", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        self.title = "Next"

        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc private func nextButtonTapped() {
        print(#function)
        let vc = LastViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
