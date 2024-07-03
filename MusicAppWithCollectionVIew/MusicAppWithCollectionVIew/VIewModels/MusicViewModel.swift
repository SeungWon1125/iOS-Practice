//
//  MusicViewModel.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import UIKit

class MusicViewModel {
    
    let apiManager = APIService.shared // 싱글톤
    
    var music: [Music]? {
        didSet {
            print("Music didSet called")
            onCompleted(self.music)
        }
    }

    
    // MARK: - Data For Views
    var MusicArray: [Music]? {
        return music
    }
    
    var musicCount: Int? {
        return music?.count ?? 0
    }
    
    // MARK: - On Completed
    var onCompleted: ([Music]?) -> Void = { _ in }

    
    // MARK: - Api function
    func apiTest() {
        apiManager.fetchMusic(searchTerm: "newjeans") { result in
            switch result {
            case .success(let musicArray) :
                print("성공")
                dump(musicArray)
                self.music = musicArray // music 배열에 결과 할당
            case .failure :
                print("실패 (vm)")
            }
        }
    }
    
    // MARK: - Load Image
}
