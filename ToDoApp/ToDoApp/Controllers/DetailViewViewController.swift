//
//  DetailViewViewController.swift
//  ToDoApp
//
//  Created by 김승원 on 6/20/24.
//

import UIKit

class DetailViewViewController: UIViewController {
    // MARK: - Variables
    private let detailView = DetailView()
    
    
    // MARK: - Life Cycle
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Set up NavigationBar
    func setupNavigationBar() {
        self.title = "새로운 메모 생성하기"
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    

}
