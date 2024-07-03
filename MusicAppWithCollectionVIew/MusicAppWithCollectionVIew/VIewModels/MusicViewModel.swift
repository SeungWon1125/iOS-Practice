//
//  MusicViewModel.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import Foundation

class MusicViewModel {
    
    let apiManager = APIService.shared
    
    func apiTest() {
        apiManager.fetchMusic(searchTerm: "newjeans") { result in
            switch result {
            case .success(let musics) :
                print("성공 (vm)")
            case .failure(let error) :
                print("실패 (vm)")
            }
        }
    }
}
