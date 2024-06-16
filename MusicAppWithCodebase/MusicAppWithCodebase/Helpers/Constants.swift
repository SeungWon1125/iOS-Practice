//
//  Constants.swift
//  MusicAppWithCodebase
//
//  Created by 김승원 on 6/16/24.
//

import UIKit

// MARK: - Name Space
// Cell reuseIdentifier
public struct Cell {
    static let musicCellIdentifier = "MusicCell"
    private init() {}
}

// MARK: - api
public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
}
