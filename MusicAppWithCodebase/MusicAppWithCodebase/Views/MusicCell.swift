//
//  MusicCell.swift
//  MusicAppWithCodebase
//
//  Created by 김승원 on 6/16/24.
//

import UIKit

class MusicCell: UITableViewCell {
    // MARK: - Variables
    var imageUrl: String? {
        didSet {
            print("imageUrl didSet")
            loadImage()
        }
    }
    
    // MARK: - 앨범 커버 이미지
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .gray
        return iv
    }()
    
    // MARK: - 음악 스택뷰
    let songName: UILabel = {
        let lb = UILabel()
        lb.text = "SONG name"
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        lb.backgroundColor = .red
        return lb
    }()
    
    let artistName: UILabel = {
        let lb = UILabel()
        lb.text = "artist name"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lb.textColor = .secondaryLabel
//        lb.backgroundColor = .blue
        return lb
    }()
    
    let albumName: UILabel = {
        let lb = UILabel()
        lb.text = "album name"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lb.numberOfLines = 3
//        lb.backgroundColor = .yellow
        return lb
    }()
    
    let releaseDate: UILabel = {
        let lb = UILabel()
        lb.text = "release date"
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .lightGray
//        lb.backgroundColor = .green
        return lb
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .leading
        sv.spacing = 3
//        sv.backgroundColor = .red
        return sv
    }()
    

    // MARK: - override init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    func setupUI() {
        self.contentView.backgroundColor = .systemBackground
        self.contentView.addSubview(mainImageView)
        setupStackView()
        setupConstraints()
    }
    
    // MARK: - Set up StackView
    func setupStackView() {
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(songName)
        stackView.addArrangedSubview(artistName)
        stackView.addArrangedSubview(albumName)
        stackView.addArrangedSubview(releaseDate)
    }
    
    // MARK: - Set up Constraints
    func setupConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: self.mainImageView.heightAnchor, multiplier: 1.0).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.mainImageView.trailingAnchor, constant: 20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

// 이미지 로드 함수
extension MusicCell {
    func loadImage() {
        guard let urlString = self.imageUrl else { return }
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }
    }
}
