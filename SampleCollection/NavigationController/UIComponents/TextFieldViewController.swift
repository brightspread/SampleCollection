//
//  TextFieldViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/12.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        tfName.becomeFirstResponder()
        setListeners()
    }
    
    func setListeners() {
        tfPhone.delegate = self
        tfName.delegate = self
        tfEmail.delegate = self
    }
    
    // MARK: UI Functions
    func initializeUI() {
        lbResult.isHidden = true
    }
    
    func isDoneAvailable() -> Bool {
        return !tfName.text!.isEmpty &&
        !tfPhone.text!.isEmpty &&
        !tfEmail.text!.isEmpty
    }
    
    // MARK: Actions
    @IBAction func doneButtonTouched(_ sender: Any) {
        registerUser()
    }
    
    func registerUser() {
        lbResult.isHidden = false
        
        if isDoneAvailable() {
            lbResult.text = """
                            이름 : \((tfName.text) ?? "empty")
                            전화번호 : \((tfPhone.text) ?? "empty")
                            이메일 : \((tfEmail.text) ?? "empty")
                            """
        } else {
            lbResult.text = "모든 항목을 입력해주세요."
        }
        resignAllResponsder()
    }
    
    // MARK: textFields functions
    func resignAllResponsder() {
        tfName.resignFirstResponder()
        tfEmail.resignFirstResponder()
        tfPhone.resignFirstResponder()
    }
}

extension TextFieldViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch (textField) {
        case tfPhone:
            let phoneCharacterSet = CharacterSet(charactersIn: "+-0123456789()")
            if (!phoneCharacterSet.isSuperset(of: CharacterSet(charactersIn: string))) {
                NSLog("tfPhone can't have a \(string)")
                return false
            }
        case tfName:
            if (!CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: string)) &&
                !CharacterSet.whitespaces.isSuperset(of: CharacterSet(charactersIn: string))) {
                NSLog("tfName can't have a \(string)")
                return false
            }
        default:
            break
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        NSLog("textFieldDidBeginEditing")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        NSLog("textFieldDidBeginEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("textFieldShouldReturn")
        switch(textField) {
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
