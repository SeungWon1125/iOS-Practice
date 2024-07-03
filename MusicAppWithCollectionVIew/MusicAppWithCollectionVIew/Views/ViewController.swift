//
//  ViewController.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // MARK: - CollectionView
    private let musicCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return cv
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setupCollectionView()
    }
    
    // MARK: - Set up CollectionView
    private func setupCollectionView() {
        self.view.addSubview(musicCollectionView)
        musicCollectionView.backgroundColor = .blue
        
        setupCollectionViewConstraints()
    }
    
    private func setupCollectionViewConstraints() {
        musicCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

