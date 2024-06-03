//
//  Member.swift
//  customDelegate
//
//  Created by 김승원 on 6/2/24.
//

import UIKit

// 프로토콜 만들기
protocol MemberDelegate: AnyObject { // AnyObject: 클래스 에서만 채택을 할 수 있는 프로토콜로 만들기, 이렇게 해야 타입 선언시 weak으로 선언 가능
    // 대리자가 할 수 있는 일을 정의
    // 새로운 멤버 추가
    func addNewMember(_ member: Member)
    
    // 정보 업데이트
    func update(index: Int, _ member: Member)
    
    // 대리자에게 "이런 일이 일어났으니 너도 일을 해야해!"와 같은 느낌
    // DetailView 자체가 TextField, TableView라고 생각해야 함
    // DetailView에서 어떤 일이 발생하면 그 결과를
    // ViewController에게 전달함
    // 따라서 ViewController에서 프로토콜을 채택해야함
}

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
        self.memberId = Member.memberNumbers
        
        // 나머지 저장속성은 외부에서 세팅
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        // 멤버를 생성한다면, 항상 타입 저장속성의 정수값 + 1
        Member.memberNumbers += 1
    }
}
