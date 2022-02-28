//
//  FieldView.swift
//  ParentsAndChildrens
//
//  Created by Timofey Kharitonov on 28.02.2022.
//

import UIKit

final class FieldView: UIView {
    
    lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        configurePlaceholderLabel()
        configureTextField()
    }
    
    func configurePlaceholderLabel() {
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func configureTextField() {
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: placeholderLabel.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
}
