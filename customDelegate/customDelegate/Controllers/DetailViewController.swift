//
//  DetailViewController.swift
//  customDelegate
//
//  Created by 김승원 on 6/2/24.
//

import UIKit
import PhotosUI

final class DetailViewController: UIViewController {
    
    // MARK: - Variables
    var member: Member?

    private let detailView = DetailView()
    
    // 데리자 변수 설정
    weak var delegate: MemberDelegate? // weak으로 선언하기 위해 프로토콜을 AnyObject참조
    
    
    // MARK: - Life Cycle
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupButtonAction()
        setupTapGestures()
        // Do any additional setup after loading the view.
    }
    // MARK: - set up Data
    private func setupData() {
        detailView.member = member
    }
    // MARK: - 이미지뷰 제스처 설정
    func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.mainImageView.addGestureRecognizer(tapGesture)
        detailView.mainImageView.isUserInteractionEnabled = true
    }

    // MARK: - set up PickerView
    func setupImagePicker() {
        // 기본 설정 세팅
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0 // 무한대로 가지고 올 수 있다
        configuration.filter = .any(of: [.images, .videos]) // 사진과 비디오를 가지고 올 수 있다.
        
        // 기본 설정을 가지고, 피커뷰컨트롤러 생성
        let picker = PHPickerViewController(configuration: configuration)
        
        // 피커뷰 컨트롤러의 대리사 설정
        picker.delegate = self
        
        // 피커뷰 띄우기
        self.present(picker, animated: true, completion: nil)
    }

    
    
    // MARK: - set up Button Action
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    // MARK: - Selectors
    @objc func saveButtonTapped() {
        print(#function)
        
        // [1] 멤버가 없다면 (새로운 멤버를 추가하는 화면)
        if member == nil {
            // 입력이 안되어 있다면.. (일반적으로) 빈문자열로 저장
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            // 새로운 멤버 (구조체) 생성
            var newMember =
            Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
//            // 1) 델리게이트 방식이 아닌 구현⭐️
//            let index = navigationController!.viewControllers.count - 2
//            // 전 화면에 접근하기 위함
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            // 전 화면의 모델에 접근해서 멤버를 추가
//            vc.memberListManager.makeNewMember(newMember)
            
            
            // 2) 델리게이트 방식으로 구현⭐️
            delegate?.addNewMember(newMember)
            // 원래 델리게이트는 내부적으로 구현되어있지만
            // 커스텀 델리게이트는 직접적으로 호출해야 함
            // 이 코드를 타면 전화면(ViewController)에서 채택한 델리게이트에서
            // addNewMember()함수가 실행된다.
            
            
        // [2] 멤버가 있다면 (멤버의 내용을 업데이트 하기 위한 설정)
        } else {
            // 이미지뷰에 있는 것을 그대로 다시 멤버에 저장
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            // 뷰에도 바뀐 멤버를 전달 (뷰컨트롤러 ==> 뷰)
            detailView.member = member
            
//            // 1) 델리게이트 방식이 아닌 구현⭐️
//            let index = navigationController!.viewControllers.count - 2
//            // 전 화면에 접근하기 위함
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            // 전 화면의 모델에 접근해서 멤버를 업데이트
//            vc.memberListManager.updateMemberInfo(index: memberId, member!)
            
            
            // 델리게이트 방식으로 구현⭐️
            delegate?.update(index: memberId, member!)
        }
        
        // (일처리를 다한 후에) 전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }
    
    // 이미지뷰 제스처 셀렉터
    @objc func touchUpImageView() {
        print("이미지 뷰 터치")
        setupImagePicker()
    }

}

// MARK: - Extension
extension DetailViewController: PHPickerViewControllerDelegate {
    // 필수 구현 사항
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 복붙하여 사용
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    // 이미지 뷰에 표시
                    self.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 불러오지 못함")
        }
    }
    
    
}

