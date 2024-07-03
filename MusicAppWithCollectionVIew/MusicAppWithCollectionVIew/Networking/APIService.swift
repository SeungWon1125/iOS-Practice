//
//  APIService.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import UIKit
import Alamofire

final class APIService {
    
    static let shared = APIService()
    private init() { }
    
    func fetchMusic(searchTerm: String, completion: @escaping (Result<[Music], AFError>) -> Void) {
        let urlString = "\(MusicApi.requestUrl)\(MusicApi.mediaParam)&term=\(searchTerm)"//주소입력
        AF.request(urlString,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .validate(statusCode: 200..<300)
        .responseDecodable(of: MusicData.self) { response in
            switch response.result {
            case .success(let musicData):
                dump(musicData)
                completion(.success(musicData.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

