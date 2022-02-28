//
//  TableViewCell.swift
//  ParentsAndChildrens
//
//  Created by Timofey Kharitonov on 28.02.2022.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    lazy var nameTextField: FieldView = {
        
        let textField = FieldView()
        
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        textField.placeholderLabel.text = "Имя"
        textField.textField.clearButtonMode = .whileEditing
        textField.textField.clearButtonMode = .unlessEditing
        textField.textField.clearButtonMode = .always
        textField.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        return textField
    }()
    
    lazy var ageTextField: FieldView = {
        let textField = FieldView()
        
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        textField.placeholderLabel.text = "Возраст"
        textField.textField.keyboardType = .asciiCapableNumberPad
        textField.textField.clearButtonMode = .whileEditing
        textField.textField.clearButtonMode = .unlessEditing
        textField.textField.clearButtonMode = .always
        textField.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        return textField
    }()
    
    lazy var deleteChildButton: UIButton = {
        let button = UIButton()
        button.setTitle("Удалить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    var deleteChildButtonAction: (() -> Void)?
    
    weak var child: Child?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        configureNameTextField()
        configureDeleteChildButton()
        configureAgeTextField()
    }
    
    func configureNameTextField() {
        contentView.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deleteChildButton.trailingAnchor.constraint(equalTo: deleteChildButton.leadingAnchor, constant: -20)
        ])
    }
    
    func configureDeleteChildButton() {
        contentView.addSubview(deleteChildButton)
        deleteChildButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35).isActive = true
        deleteChildButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deleteChildButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            deleteChildButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func configureAgeTextField() {
        contentView.addSubview(ageTextField)
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        NSLayoutConstraint.activate([
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            ageTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ageTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ageTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        child?.name = textField.text ?? ""
        child?.age = textField.text ?? ""
    }
    
    @objc func buttonAction(sender: UIButton!) {
        deleteChildButtonAction?()
    }
    
}
