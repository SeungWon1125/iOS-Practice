//
//  DetailViewController.swift
//  MusicAppWithCodebase
//
//  Created by 김승원 on 6/16/24.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Variables
    var music: Music?
    private let detailView = DetailView()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupNavigationBar()
        setupData()
    }
    
    // MARK: - Set up NavigationBar
    func setupNavigationBar() {
        self.title = "Infomation"
//        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    // MARK: - Set up Data
    func setupData() {
        detailView.musicInfo = music
    }


}
