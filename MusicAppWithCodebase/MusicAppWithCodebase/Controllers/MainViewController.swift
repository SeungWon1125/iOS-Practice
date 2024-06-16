//
//  MainViewController.swift
//  MusicAppWithCodebase
//
//  Created by 김승원 on 6/16/24.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - Variables
    private let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)
    var networkManager = NetworkManager.shared
    var musicArray: [Music] = []

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
//        setupSearchBar()
        setupTableView()
        setupData()
        setupConstraints()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar()
    }
    
    // MARK: - Set up Data
    func setupData() {
        print(#function)
        networkManager.fetchMusic(searchTerm: "bilie") { result in
            print(#function)
            switch result {
            case Result.success(let musicDatas) :
                print("데이터 받아오기 성공")
                self.musicArray = musicDatas
            case Result.failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Set up NavigationBar & SearchBar
    func setupNavigationBar() {
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
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.placeholder = "Search Music"
        self.navigationItem.searchController = searchController
    }
    
    // MARK: - Set up TableView
    func setupTableView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(tableView)
        // dataSource, delegate 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        
        // 셀 등록
        tableView.register(MusicCell.self, forCellReuseIdentifier: Cell.musicCellIdentifier)
    }
    
    
    // MARK: - Set up Constraints
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}
// MARK: - TableView DataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let musicCount = self.musicArray.count
        return musicCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        
        let music = musicArray[indexPath.row]
        cell.imageUrl = music.imageUrl
        cell.songName.text = music.songName
        cell.artistName.text = music.artistName
        cell.albumName.text = music.albumName
        cell.releaseDate.text = music.releaseDateString
        
        cell.selectionStyle = .none
    
        return cell
    }
}

// MARK: - TableView Delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let music = musicArray[indexPath.row]
        let vc = DetailViewController()
        vc.music = music
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - SearchBar Delegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        self.musicArray = []
        networkManager.fetchMusic(searchTerm: searchText) { result in
            switch result {
            case Result.success(let musicDatas) :
                self.musicArray = musicDatas
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case Result.failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("검색 버튼 눌림")
        guard let text = searchController.searchBar.text else { return }
        print("\(text) 검색")
        self.musicArray = []
        networkManager.fetchMusic(searchTerm: text) { result in
            switch result {
            case Result.success(let musicDatas) :
                self.musicArray = musicDatas
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case Result.failure(let error) :
                print(error.localizedDescription)
            }
        }
        self.view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("취소 버튼 눌림")
        networkManager.fetchMusic(searchTerm: "bilie") { result in
            print(#function)
            switch result {
            case Result.success(let musicDatas) :
                print("데이터 받아오기 성공")
                self.musicArray = musicDatas
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case Result.failure(let error) :
                print(error.localizedDescription)
            }
        }
        self.view.endEditing(true)
    }
    
}

//extension MainViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        print("서치바에 입력되는 단어: ", searchController.searchBar.text ?? "")
//    }
//}
