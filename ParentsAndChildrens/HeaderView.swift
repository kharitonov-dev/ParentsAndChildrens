//
//  HeaderView.swift
//  ParentsAndChildrens
//
//  Created by Timofey Kharitonov on 28.02.2022.
//

import UIKit

final class HeaderView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Персональные данные"
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var nameTextField: FieldView = {
        let textField = FieldView()
        
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        textField.placeholderLabel.text = "Имя"
        textField.textField.clearButtonMode = .whileEditing
        textField.textField.clearButtonMode = .unlessEditing
        textField.textField.clearButtonMode = .always
        textField.textField.becomeFirstResponder()
        
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
        
        return textField
    }()
    
    lazy var kidsLabel: UILabel = {
        let label = UILabel()
        label.text = "Дети (макс. 5)"
        
        return label
    }()
    
    lazy var addChildButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.isHidden = false

        var config = UIButton.Configuration.plain()
        config.title = "Добавить ребенка"
        config.image = UIImage(systemName: "plus")
        config.imagePadding = 10
        config.titlePadding = 20
        config.titleAlignment = .trailing
        config.buttonSize = .medium
        config.baseForegroundColor = UIColor.systemBlue
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
        
        button.configuration = config
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    var addChildButtonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        configureTitleLabel()
        configureNameTextField()
        configureAgeTextField()
        configureKidsLabel()
        configureAddChildButton()
    }
    
    func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func configureNameTextField() {
        addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func configureAgeTextField() {
        addSubview(ageTextField)
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            ageTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ageTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func configureKidsLabel() {
        addSubview(kidsLabel)
        kidsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kidsLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
            kidsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            kidsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func configureAddChildButton() {
        addSubview(addChildButton)
        addChildButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addChildButton.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
            addChildButton.leadingAnchor.constraint(equalTo: kidsLabel.trailingAnchor, constant: 20),
            addChildButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addChildButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        addChildButtonAction?()
    }
}
