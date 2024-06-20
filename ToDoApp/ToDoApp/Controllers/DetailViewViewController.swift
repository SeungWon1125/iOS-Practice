//
//  DetailViewViewController.swift
//  ToDoApp
//
//  Created by 김승원 on 6/20/24.
//

import UIKit

class DetailViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        self.view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Set up NavigationBar
    func setupNavigationBar() {
        self.title = "새로운 메모 생성하기"
        
        navigationController?.navigationBar.prefersLargeTitles = false
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
