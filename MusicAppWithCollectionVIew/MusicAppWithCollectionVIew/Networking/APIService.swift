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
            case .success(let musicArray):
//                dump(musicData)
                print("뮤직어레이 받아오기 성공")
                completion(.success(musicArray.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadImage(imageURL: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString = imageURL, let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    if let image = UIImage(data: data) {
                        completion(image)
                    } else {
                        completion(nil)
                    }
                case .failure(let error):
                    print("Error fetching image: \(error)")
                    completion(nil)
                }
            }
    }
    
}

