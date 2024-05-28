//
//  Movie.swift
//  TableView
//
//  Created by 김승원 on 5/28/24.
//

import UIKit

struct Movie {
    // 보통은 다 let으로 선언한다
    var movieImage: UIImage? // 얘만 옵셔널로 선언 (이미지가 없으면 모든 파일이 다 오류남을 방지)
    let movieName: String
    let movieDescription: String
}
