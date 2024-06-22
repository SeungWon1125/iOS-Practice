//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 김승원 on 6/22/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    // MARK: - Life Cycle ⭐️
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        setupCollectionView()
    }
    
    // MARK: - Set up CollectionView
    func setupCollectionView() {
        self.view.addSubview(collectionView)
        
        collectionView.backgroundColor = .blue
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 셀 등록
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        setupCollectionViewContraints()
    }
    
    func setupCollectionViewContraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
    }
}

// MARK: - CollectionView DataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

// MARK: - CollectionView Delegate FlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSize = view.frame.width
        let cellSize: CGSize = CGSize(width: widthSize, height: 200)
        return cellSize
    }
}

