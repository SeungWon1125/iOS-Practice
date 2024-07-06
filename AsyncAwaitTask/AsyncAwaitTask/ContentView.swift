//
//  ContentView.swift
//  AsyncAwaitTask
//
//  Created by 김승원 on 7/7/24.
//

import SwiftUI

struct ContentView: View {
    let imageURLString = "https://pbs.twimg.com/media/F0UHhb4acAAi5S5?format=jpg&name=4096x4096"
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<10) { _ in
//                    AsyncImage(url: URL(string: imageURLString)) // 비동기처리
                    let data = try! Data(contentsOf: URL(string: imageURLString)!) // 동기처리
                    Image(uiImage: UIImage(data: data)!)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
