//
//  SampleTextFieldViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/12.
//

import UIKit

class SampleTextFieldViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
        setDelegates()
        tfName.becomeFirstResponder()
    }
    
    func initializeUI() {
        lbResult.isHidden = true
    }
    
    func setDelegates() {
        tfName.delegate = self
        tfPhone.delegate = self
        tfEmail.delegate = self
    }
    
    @IBAction func doneButtonTouched(_ sender: Any) {
        NSLog("\(tfName.text!)")
        registerUser()
    }
    
    func registerUser() {
        lbResult.isHidden = false
        lbResult.text = """
        이름 : \(tfName.text!)
        전화번호 : \(tfPhone.text!)
        이메일 : \(tfEmail.text!)
        """
        resignAllResponder()
    }
    
    func resignAllResponder() {
        tfName.resignFirstResponder()
        tfEmail.resignFirstResponder()
        tfPhone.resignFirstResponder()
    }
}

extension SampleTextFieldViewController: UITextFieldDelegate {
    
    // 입력해서 바뀔때.. 불리는 함수
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        NSLog("shouldChangeCharactersIn \(range), \(string)")
        
        switch (textField) {
        case tfName:
            if !CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: string)) &&
                !CharacterSet.whitespaces.isSuperset(of: CharacterSet(charactersIn: string)) {
                return false
            }
        case tfPhone:
            let phoneCharacterSet = CharacterSet(charactersIn: "0123456789+-()")
            if !phoneCharacterSet.isSuperset(of: CharacterSet(charactersIn: string)) {
                return false
            }
        default:
            break
        }
        return true
    }

    // editing 끝
    func textFieldDidEndEditing(_ textField: UITextField) {
        NSLog("textFieldDidEndEditing")
    }
        
    // editing 시작
    func textFieldDidBeginEditing(_ textField: UITextField) {
        NSLog("textFieldDidBeginEditing")
    }
    
    // 엔터키 입력
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("textFieldShouldReturn")
        
        switch (textField) {
        case tfName:
            tfPhone.becomeFirstResponder()
        case tfPhone:
            tfEmail.becomeFirstResponder()
        case tfEmail:
            registerUser()
        default:
            break
        }
        return true
    }
}
