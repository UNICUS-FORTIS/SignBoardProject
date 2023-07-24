//
//  ViewController.swift
//  SignBoard
//
//  Created by LOUIE MAC on 2023/07/24.
//

import UIKit


//오토레이아웃 제약조건 설정하기
//키보드 내리기 : 리턴키 클릭시 / 탭 제스쳐 동작시
//텍스트컬러 랜덤으로 변경하기
//상단뷰 (텍스트필드 / 텍스트컬러버튼 등) 토글 처리

class ViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var randomColorButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var interactionView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    let buttonBorderColor = UIColor.systemPink.cgColor
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    
    func setupUI() {
        addButtonSettings()
        interactionButtonSettings()
        let displayGesture = UITapGestureRecognizer(target: self, action: #selector(displayLabelTapped))
        display.isUserInteractionEnabled = true
        display.addGestureRecognizer(displayGesture)
        
        inputTextField.backgroundColor = .black
        inputTextField.font = UIFont.boldSystemFont(ofSize: 30)
        inputTextField.textColor = .white
        
        interactionView.backgroundColor = .black
        interactionView.isHidden = true
        display.isHidden = true
        
        let underlineLayer = CALayer()
        underlineLayer.borderWidth = 1.0
        underlineLayer.borderColor = buttonBorderColor
        underlineLayer.frame = CGRect(x: 0, y: interactionView.frame.height - 1, width: interactionView.frame.width, height: 1)
        interactionView.layer.addSublayer(underlineLayer)
        
        display.textColor = .systemPink
        display.font = .boldSystemFont(ofSize: 70)
        
    }
    
    func interactionButtonSettings() {
        randomColorButton.setTitle("Aa", for: .normal)
        randomColorButton.setTitleColor(.cyan, for: .normal)
        sendButton.setTitle("Send", for: .normal)
        sendButton.setTitleColor(.cyan, for: .normal)
    }
    
    func addButtonSettings() {
        addButton.layer.borderColor = buttonBorderColor
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = addButton.frame.height / 2
        addButton.clipsToBounds = true
    }
    
    
    @objc func displayLabelTapped() {
        if interactionView.isHidden == false && display.text == "" {
            inputTextField.text = ""
            display.text = ""
            display.isHidden = true
            addButton.isHidden = false
        } else if interactionView.isHidden == true && display.text != "" {
            interactionView.isHidden = false
            display.text = ""
            display.isHidden = true
            addButton.isHidden = true
        }
    }
    
    @IBAction func changeColors(_ sender: UIButton) {
        let randomColor = UIColor.random()
        inputTextField.textColor = randomColor
        display.textColor = randomColor
        randomColorButton.setTitleColor(randomColor, for: .normal)
    }
    
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        if inputTextField.text != "" {
            display.isHidden = false
            display.text = inputTextField.text
            inputTextField.text = ""
            interactionView.isHidden = true
            addButton.isHidden = true
        } else if inputTextField.text == "" {
            display.isHidden = true
            interactionView.isHidden = true
            addButton.isHidden = false
            
        }
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        interactionView.isHidden = false
        addButton.isHidden = true
    }
}

extension UIColor {
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

