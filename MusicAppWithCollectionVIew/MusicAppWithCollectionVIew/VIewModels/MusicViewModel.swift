//
//  MusicViewModel.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import UIKit

class MusicViewModel {
    
    let apiManager = APIService.shared // 싱글톤
    
    // MARK: - music Array
    var musicArray: [Music]? {
        didSet {
            print("Music didSet called")
            onCompleted(self.musicArray)
        }
    }
    
    // MARK: - music Image Array
    var musicImages: [UIImage?] = []
    
    // MARK: - Data For Views
    
    var musicCount: Int? {
        return musicArray?.count ?? 0
    }
    
    // MARK: - On Completed
    var onCompleted: ([Music]?) -> Void = { _ in }

    
    // MARK: - Api function
    func fetchMusic(searchTerm: String) {
        apiManager.fetchMusic(searchTerm: searchTerm) { result in
            switch result {
            case .success(let musicArray) :
                print("성공")
                dump(musicArray)
                self.musicArray = musicArray // music 배열에 결과 할당
                self.musicImages = Array(repeating: nil, count: musicArray.count)
                self.loadImage()
            case .failure :
                print("실패 (vm)")
            }
        }
    }
    
    func loadImage() {
        guard let musicArray = musicArray else { return }
        
        for (index, music) in musicArray.enumerated() {
            apiManager.loadImage(imageURL: music.imageUrl) { [weak self] image in
                self?.musicImages[index] = image
                self?.onCompleted(self?.musicArray)
            }
        }
    }
}
