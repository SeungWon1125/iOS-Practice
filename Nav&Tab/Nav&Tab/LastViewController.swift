//
//  LastViewController.swift
//  Nav&Tab
//
//  Created by 김승원 on 5/28/24.
//

import UIKit

class LastViewController: UIViewController {
    
    private lazy var popButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("pop", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    private lazy var popRootButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("pop2Root", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        popButton.addTarget(self, action: #selector(popButtonTapped), for: .touchUpInside)
        popRootButton.addTarget(self, action: #selector(popRootButtonTapped), for: .touchUpInside)
        
        view.addSubview(popButton)
        popButton.translatesAutoresizingMaskIntoConstraints = false
        popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        popButton.heightAnchor.constraint(equalToConstant: 45).isActive = true

        view.addSubview(popRootButton)
        popRootButton.translatesAutoresizingMaskIntoConstraints = false
        popRootButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popRootButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        popRootButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        popRootButton.topAnchor.constraint(equalTo: popButton.bottomAnchor, constant: 20).isActive = true
        
        view.backgroundColor = .systemBackground
        self.title = "Last"
        
        navigationItem.hidesBackButton = true
    }
    
    @objc private func popButtonTapped() {
        print(#function)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func popRootButtonTapped() {
        print(#function)
        self.navigationController?.popToRootViewController(animated: true)
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
