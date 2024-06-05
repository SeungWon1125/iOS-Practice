//
//  Member.swift
//  CDPractice
//
//  Created by 김승원 on 6/4/24.
//

import UIKit

struct Member {
    static var memberNumbers: Int = 0
    lazy var memberImage: UIImage? = {
        // 이름이 없다면, 시스템 사람 이미지로 세팅
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(memberImage: UIImage? = nil, name: String? = nil, age: Int? = nil, phone: String? = nil, address: String? = nil) {
        self.memberId = Member.memberNumbers
        
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberNumbers += 1 // 멤버 추가 시 +1
    }
    
}
