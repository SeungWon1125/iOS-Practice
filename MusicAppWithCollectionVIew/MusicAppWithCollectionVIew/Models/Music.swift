//
//  Music.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import Foundation

// MARK: - Welcome
struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

// MARK: - Result
struct Music: Codable {
    let songName: String?
    let artistName: String?
    let albumName: String?
    let previewURL: String?
    let imageUrl: String?
    private let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
        case previewURL = "previewUrl"
        case imageUrl = "artworkUrl100"
        case releaseDate
    }
    
    // (출시 정보에 대한 날짜를 잘 계산하기 위해서) 계산 속성으로
    // "2011-07-05T12:00:00Z" ===> "yyyy-MM-dd"
    var releaseDateString: String? {
        // 서버에서 주는 형태 (ISO규약에 따른 문자열 형태)
        guard let isoDate = ISO8601DateFormatter().date(from: releaseDate ?? "") else {
            return ""
        }
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = myFormatter.string(from: isoDate)
        return dateString
    }
}


enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}
