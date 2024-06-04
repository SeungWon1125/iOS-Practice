//
//  Member.swift
//  CDPractice
//
//  Created by 김승원 on 6/4/24.
//

import UIKit

struct Member {
    static var memberNumbers: Int = 0
    var memberImage: UIImage?
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(memberImage: UIImage? = nil, name: String? = nil, age: Int? = nil, phone: String? = nil, address: String? = nil) {
        self.memberId = Member.memberNumbers
        
        self.memberImage = memberImage
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberNumbers += 1 // 멤버 추가 시 +1
    }
    
}
