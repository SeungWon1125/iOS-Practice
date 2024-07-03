//
//  MusicCell.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import UIKit
import SnapKit

class MusicCell: UICollectionViewCell {
    // MARK: - Properties
//    var viewModel = MusicViewModel()
    
    // MARK: - UIComponents
    let albumImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "tempImage")
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .gray
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 8
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "loading..."
        lb.textAlignment = .left
        lb.numberOfLines = 2
        lb.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        return lb
    }()
    
    lazy var gradientView: UIView = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.locations = [0.0, 0.15, 0.5, 1.0]
        let view = UIView()
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.alpha = 0.85
        return view
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.contentView.addSubview(albumImageView)
        self.albumImageView.addSubview(gradientView)
        self.gradientView.addSubview(nameLabel)
        
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints {
    private func setupConstraints() {
        albumImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(gradientView).offset(10)
            make.bottom.equalTo(gradientView).offset(-5)
        }
        
    }
    
}
