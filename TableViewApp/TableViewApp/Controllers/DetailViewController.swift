//
//  DetailViewController.swift
//  TableViewApp
//
//  Created by 김승원 on 5/29/24.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Variables
    var movieData: Movie?
    let detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - set up UI
    func setupUI() {
        detailView.mainImageView.image = movieData?.movieImage
        detailView.movieTitleLabel.text = movieData?.movieTitle
        detailView.descriptionLabel.text = movieData?.movieDescription
    }

}
