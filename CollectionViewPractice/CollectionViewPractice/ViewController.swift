//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 김승원 on 6/22/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // MARK: - Variables
    private let firstCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return cv
    }()
    
    private let secondCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return cv
    }()

    // MARK: - Life Cycle ⭐️
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setupCollectionView()
    }
    
    // MARK: - Set up CollectionView
    private func setupCollectionView() {
        self.view.addSubview(firstCollectionView)
        firstCollectionView.backgroundColor = .yellow
        
        firstCollectionView.dataSource = self
        firstCollectionView.delegate = self
        firstCollectionView.showsHorizontalScrollIndicator = false
        
        // 셀 등록
        firstCollectionView.register(MyCell.self, forCellWithReuseIdentifier: "Cell")
        
        setupCollectionViewContraints()
    }
    
    private func setupCollectionViewContraints() {
        firstCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(150)
        }
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCell
        cell.backgroundColor = .gray
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 15
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = firstCollectionView.frame.height
        let itemSize = CGSize(width: cellHeight, height: cellHeight)
        return itemSize
    }
}

