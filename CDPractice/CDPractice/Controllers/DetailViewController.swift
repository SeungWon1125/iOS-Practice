//
//  DetailViewController.swift
//  CDPractice
//
//  Created by 김승원 on 6/4/24.
//

import UIKit
import PhotosUI

final class DetailViewController: UIViewController {
    // MARK: - Variables
    var member: Member?
    
    private let detailView = DetailView()
    
    weak var delegate: MemberDelegate?
    
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupButtonActions()
        setupDetailViewMemberIdTextFieldDelegate()
        setupTapGesture()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - set up Gesture
    private func setupTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.mainImageView.addGestureRecognizer(gesture)
        detailView.mainImageView.isUserInteractionEnabled = true // 필수
        
    }
    
    // MARK: - set up ButtonActions
    private func setupButtonActions() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - set up DetailView memberId TextField
    private func setupDetailViewMemberIdTextFieldDelegate() {
        detailView.memberIdTextField.delegate = self
    }
    
    // MARK: - set up Data
    private func setupData() {
        detailView.member = member
    }
    
    // MARK: - Selectors
    // 피커뷰
    @objc private func touchUpImageView() {
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
    
    // save, update버튼
    @objc private func saveButtonTapped() {
        print(#function)
        
        if member == nil {
            // 새 맴버를 추가한다면
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            var newMember =
            Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
//            // 1) 델리게이트 방식이 아닌 구현⭐️
//            let index = navigationController!.viewControllers.count - 2
//            // 전 화면에 접근하기 위함
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            // 전 화면의 모델에 접근해서 멤버를 추가
//            vc.dataManager.makeNewMember(newMember)
            
            delegate?.addNewMember(newMember)
            
        } else  {
            // 기존 맴버의 정보를 조회하는 거면
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            detailView.member = member
            
//            // 1) 델리게이트 방식이 아닌 구현⭐️
//            let index = navigationController!.viewControllers.count - 2
//            // 전 화면에 접근하기 위함
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            // 전 화면의 모델에 접근해서 멤버를 업데이트
//            vc.dataManager.updateMemberInfo(index: memberId, member!)
            
            delegate?.updateMember(index: memberId, member!)
            
        }
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extensions
extension DetailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == detailView.memberIdTextField {
            return false
        }
        return true
    }
}

// 피커뷰
extension DetailViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
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
