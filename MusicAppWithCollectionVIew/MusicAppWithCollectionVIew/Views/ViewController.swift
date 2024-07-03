//
//  ViewController.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // MARK: - Properties
    var viewModel = MusicViewModel()
    
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
        viewModel.fetchMusic(searchTerm: "twice")
        
        viewModel.onCompleted = { [weak self] _ in
            DispatchQueue.main.async {
                self?.musicCollectionView.reloadData()
            }
        }
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
        let musicCount = viewModel.musicCount!
        return musicCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = musicCollectionView.dequeueReusableCell(withReuseIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
//        cell.nameLabel.text = viewModel.musicArray?[indexPath.row].songName
        if let musicArray = viewModel.musicArray {
            let music = musicArray[indexPath.item]
            cell.nameLabel.text = music.songName
            cell.albumImageView.image = viewModel.musicImages[indexPath.item]
        }
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
    // 한 글자 입력되면 호출되는 함수
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchMusic(searchTerm: searchText)
    }
    
    // 키보드 검색 버튼이 눌리면 호출되는 함수
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        
        viewModel.fetchMusic(searchTerm: text)
    }
    
    // 서치바 옆에 Cancel버튼이 눌리면 호출되는 함수
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.fetchMusic(searchTerm: text)
    }
}

