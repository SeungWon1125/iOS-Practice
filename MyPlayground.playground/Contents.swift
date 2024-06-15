import UIKit

// MARK: - Welcome
// 구조체 이름 바꿔줘도 된다.
struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
    
}

// MARK: - Result
// 실제로 앱에서 사용할 변수명
struct Music: Codable {
    let songName: String?
    let artistName: String?
    let albumName: String?
    let previewUrl: String?
    let imageUrl: String?
    private let releaseDate: String?
    
    // 앱에서 사용할 변수 명 = "서버에서 받은 이름"
    enum CodingKeys: String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
        case previewUrl
        case imageUrl = "artworkUrl100"
        case releaseDate
    }
}


func getMethod() {
    
    // URL구조체 만들기
    guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=newjeans") else {
        print("Error: cannot create URL")
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    
    // 요청을 가지고 작업세션시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
            
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
//        print(String(decoding: safeData, as: UTF8.self))
//        dump(String(decoding: safeData, as: UTF8.self))
        do {
            let decoder = JSONDecoder()
            // decoder.decode는 에러를 던질 수 있는 메서드이기 때문에
            // do catch, try문 사용
            let musicArray = try decoder.decode(MusicData.self, from: safeData)
            dump(musicArray)
        } catch {
            
        }


    }.resume()     // 시작
}

getMethod()

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)




