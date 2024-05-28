//
//  DetailView.swift
//  TableViewApp
//
//  Created by 김승원 on 5/29/24.
//

import UIKit

class DetailView: UIView {
    // MARK: - UI Components
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func updateConstraints() {
//        setupConstraints()
//        super.updateConstraints()
//    }
    
    // MARK: - set up UI
    func setupUI() {
        self.backgroundColor = .white
        
        stackView.addArrangedSubview(mainImageView)
        stackView.addArrangedSubview(movieTitleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        self.addSubview(stackView)
    }

    // MARK: - set up Constraints
    func setupConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
    }

    
    

    
}
