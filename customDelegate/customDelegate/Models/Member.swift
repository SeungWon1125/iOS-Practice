//
//  Member.swift
//  customDelegate
//
//  Created by 김승원 on 6/2/24.
//

import UIKit

struct Member {
    
    // 멤버 사진
    lazy var memberImage: UIImage? = {
        // 이름이 없다면, 시스템 사람 이미지로 세팅
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    // 멤버의 (절대적) 순서를 위한 타입 저장 속성
    static var memberNumbers: Int = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    // 구조체이기 때문에 생성자를 굳이 생성하지 않아도 자동적으로 생김 (자동적으로 생성자 제공)
    // 하지만 일부러 생성자 구현, 생성자 안에 논리를 구현하고 싶기 때문
    init(name: String? = nil, age: Int? = nil, phone: String? = nil, address: String? = nil) {
        // 0 일때는 0, 0이 아닐때는 타입저장속성의 절대적 값으로 세팅 (자동순번)
        self.memberId = Member.memberNumbers == 0 ? 0 : Member.memberNumbers
        
        // 나머지 저장속성은 외부에서 세팅
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        // 멤버를 생성한다면, 항상 타입 저장속성의 정수값 + 1
        Member.memberNumbers += 1
    }
}
