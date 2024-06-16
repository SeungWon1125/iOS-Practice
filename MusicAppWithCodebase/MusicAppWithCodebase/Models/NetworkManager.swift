//
//  NetworkManager.swift
//  MusicAppWithCodebase
//
//  Created by 김승원 on 6/16/24.
//

import Foundation

enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
    case responseError
}

// MARK: - Networking 클래스 모델
final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    // Result타입 선언
    typealias NetworkCompletion = (Result<[Music], NetworkError>) -> Void
    
    // 얘는 부르는 함수다
    func fetchMusic(searchTerm: String, completion: @escaping NetworkCompletion) {
        let urlString = "\(MusicApi.requestUrl)\(MusicApi.mediaParam)&term=\(searchTerm)"
        print(urlString)
    
        performRequest(with: urlString) { result in
            completion(result)
        }
    }
    
    // 실제 네트워킹 요청 함수 (비동기 처리)
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error)in
            guard error == nil else {
                print(error!)
                completion(Result.failure(NetworkError.networkingError))
                return
            }
            
            // 옵셔널 바인딩
            guard let safeData = data else {
                completion(Result.failure(NetworkError.dataError))
                return
            }
            
            // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                completion(Result.failure(NetworkError.responseError))
                return
            }
                
            // 디코딩
            if let musicArray = self.parseJSON(safeData) {
                print("parse실행")
                completion(Result.success(musicArray))
            } else {
                print("parse실패")
                completion(Result.failure(NetworkError.parseError))
            }
        }
        
        task.resume()
    }
    
    private func parseJSON(_ musicData: Data) -> [Music]? {
        do {
            let decoder = JSONDecoder()
            let musicData = try decoder.decode(MusicData.self, from: musicData)
            return musicData.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
