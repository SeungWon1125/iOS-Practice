//
//  DetailView.swift
//  MusicAppWithCodebase
//
//  Created by 김승원 on 6/16/24.
//

import UIKit

class DetailView: UIView {
    // MARK: - Variables
    var musicInfo: Music? {
        didSet {
            guard let musicInfo = musicInfo else { return }
            
            loadImage()
            
            songName.text = musicInfo.songName
            artistName.text = musicInfo.artistName
            albumName.text = musicInfo.albumName
            releaseDate.text = musicInfo.releaseDateString
        }
    }
    
    // MARK: - 앨범 커버 이미지
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .gray
        return iv
    }()
    
    // MARK: - 음악 스택뷰
    // 노래 제목
    
    let songName: UILabel = {
        let lb = UILabel()
        lb.text = "Song Name"
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        lb.textAlignment = .center
//        lb.backgroundColor = .blue
        return lb
    }()
    
    // 가수 이름
    let artistLabel: UILabel = {
        let lb = UILabel()
        lb.text = "가수"
        return lb
    }()
    
    let artistName: UILabel = {
        let lb = UILabel()
        lb.text = "artist name"
        return lb
    }()
    
    let artistStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    // 앨범 이름
    let albumLabel: UILabel = {
        let lb = UILabel()
        lb.text = "앨범"
        return lb
    }()
    
    let albumName: UILabel = {
        let lb = UILabel()
        lb.text = "album name"
//        lb.numberOfLines = 3
        return lb
    }()
    
    let albumStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    // 발매 날짜
    let dateLabel: UILabel = {
        let lb = UILabel()
        lb.text = "날짜"
        return lb
    }()
    
    let releaseDate: UILabel = {
        let lb = UILabel()
        lb.text = "release date"
        return lb
    }()
    
    let dateStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 15
//        sv.backgroundColor = .red
        return sv
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 7
//        sv.backgroundColor = .gray
        return sv
    }()
    

    // MARK: - override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    func setupUI() {
        self.backgroundColor = .systemBackground
        self.addSubview(mainImageView)
        self.addSubview(songName)
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(artistStackView)
        stackView.addArrangedSubview(albumStackView)
        stackView.addArrangedSubview(dateStackView)
        
        artistStackView.addArrangedSubview(artistLabel)
        artistStackView.addArrangedSubview(artistName)
        
        albumStackView.addArrangedSubview(albumLabel)
        albumStackView.addArrangedSubview(albumName)
        
        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(releaseDate)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    func setupConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: self.mainImageView.heightAnchor, multiplier: 1.0).isActive = true
        
        songName.translatesAutoresizingMaskIntoConstraints = false
        songName.topAnchor.constraint(equalTo: self.mainImageView.bottomAnchor, constant: 10).isActive = true
        songName.leadingAnchor.constraint(equalTo: self.mainImageView.leadingAnchor, constant: 0).isActive = true
        songName.trailingAnchor.constraint(equalTo: self.mainImageView.trailingAnchor, constant: 0).isActive = true
        songName.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.songName.bottomAnchor, constant: 15).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.mainImageView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.mainImageView.trailingAnchor, constant: 0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
}

extension DetailView {
    func loadImage() {
        guard let urlString = musicInfo?.imageUrl else { return }
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
