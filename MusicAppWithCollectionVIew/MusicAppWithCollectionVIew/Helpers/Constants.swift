//
//  Constants.swift
//  MusicAppWithCollectionVIew
//
//  Created by 김승원 on 7/3/24.
//

import Foundation

// MARK: - Cell Reuse Identifier
public struct Cell {
    static let musicCellIdentifier = "MusicCell"
    private init() {}
}

// MARK: - api
public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
}

