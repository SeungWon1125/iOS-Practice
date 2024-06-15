//
//  MusicCell.swift
//  MusicApp
//
//  Created by Allen H on 2022/04/20.
//

import UIKit

final class MusicCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // 이미지 URL을 전달받는 속성
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        // 일반적으로 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행 ⭐️
        self.mainImageView.image = nil
    }

    
    // 스토리보드 또는 Nib으로 만들때, 사용하게 되는 생성자 코드
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainImageView.contentMode = .scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // URL ===> 이미지를 셋팅하는 메서드
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }
        
        // 정석 구현
//        guard let url = URL(string: urlString) else { return }
//        
//        let session = URLSession.shared
//        
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                print(error!)
//                return
//            }
//            
//            guard let safeData = data else {
//                return
//            }
//            DispatchQueue.main.async {
//                self.mainImageView.image = UIImage(data: safeData)
//            }
//        }
//        
//        task.resume()
        
        // 하지만 url을 가지고 이미지를 받아올 때는 세션을 사용하지 않고
        // Data(contentsOf: url)을 사용한다.
        // 하지만 동기적으로 처리가 되어있기 때문에 DispatchQueue.global().async를 이용
        
        DispatchQueue.global().async {
            // 얘는 에러를 던질 수 있기 때문에 try do catch 또는 try?
            guard let data = try? Data(contentsOf: url) else { return }

            // 오래걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거 ⭐️⭐️⭐️
            // 셀을 빠르게 내렸을 때 잘못된 셀에 이미지가 뜰 가능성을 없앤다 / url이 서로 같은 건지 확인하는 코드
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }
    }
}
