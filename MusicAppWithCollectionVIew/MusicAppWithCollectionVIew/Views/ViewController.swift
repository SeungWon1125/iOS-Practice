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
    
    // MARK: - SearchController
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setupCollectionView()
        setupNavigationBar()
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        self.title = "Music"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        // 네비 appearance 설정
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        self.navigationController?.navigationBar.prefersLargeTitles = true
            
        // UISearchController 설정
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self // 대리자 설정 필수
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.placeholder = "Search Music"
        self.navigationItem.searchController = searchController
    }
    
    // MARK: - Set up CollectionView
    private func setupCollectionView() {
        self.view.addSubview(musicCollectionView)
        
        self.musicCollectionView.dataSource = self
        self.musicCollectionView.delegate = self
        
        self.musicCollectionView.register(MusicCell.self, forCellWithReuseIdentifier: Cell.musicCellIdentifier)
        
        setupCollectionViewConstraints()
    }
    
    private func setupCollectionViewConstraints() {
        musicCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - CollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = musicCollectionView.dequeueReusableCell(withReuseIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        return cell
    }
}

// MARK: - CollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 1 - 1) / 3
        let itemSize = CGSize(width: width, height: width)
        return itemSize
    }
}

// MARK: - SearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    // 키보드 검색 버튼이 눌리면 호출되는 함수
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    // 서치바 옆에 Cancel버튼이 눌리면 호출되는 함수
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

