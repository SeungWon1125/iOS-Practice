//
//  MainViewController.swift
//  TableViewApp
//
//  Created by 김승원 on 5/28/24.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Variables
    let mainView = MainView()
    let movieDataManager = DataManager()
    
    
    // MARK: - Life Cycle
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupNavigationBar()
        setupTableView()
    }
    // MARK: - 데이터 전달
    func setupData() {
        movieDataManager.makeMovieData()
    }

    
    // MARK: - 테이블 뷰 델리게이트 프로토콜 채택
    func setupTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    
    // MARK: - set up NavigationBar
    func setupNavigationBar() {
        self.title = "영화목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(barButtonItemTapped))
    }
    // MARK: - Selectors
    @objc func barButtonItemTapped() {
        print(#function)
        movieDataManager.addMovieData()
        mainView.tableView.reloadData()
    }

    
    
    
}

// MARK: - Extension
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let movieArray = movieDataManager.getMovieData()
        let movieCount = movieArray.count
        return movieCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MyTableViewCell
        
        let movieArray = movieDataManager.getMovieData()
        let movie = movieArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieTitleLabel.text = movie.movieTitle
        cell.descriptionLabel.text = movie.movieDescription
        
        return cell
    }
}



extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = DetailViewController()
        let movieArray = movieDataManager.getMovieData()
        VC.movieData = movieArray[indexPath.row]
        navigationController?.pushViewController(VC, animated: true)
    }
}
