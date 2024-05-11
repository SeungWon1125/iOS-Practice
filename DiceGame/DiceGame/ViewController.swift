//
//  ViewController.swift
//  DiceGame
//
//  Created by 김승원 on 5/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.image = diceArray.randomElement()
        secondImageView.image = diceArray.randomElement()
        
    }

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        // 첫 번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = diceArray.randomElement()
        
        // 두 번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageView.image = diceArray.randomElement()
        
    }
    

}

