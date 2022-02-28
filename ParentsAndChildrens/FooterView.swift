//
//  FooterView.swift
//  ParentsAndChildrens
//
//  Created by Timofey Kharitonov on 28.02.2022.
//

import UIKit

final class FooterView: UIView {
    
    lazy var clearChildsButton: UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemRed.cgColor

        var config = UIButton.Configuration.plain()
        config.title = "Очистить"
        config.titlePadding = 20
        config.titleAlignment = .trailing
        config.buttonSize = .medium
        config.baseForegroundColor = UIColor.systemRed
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 70, bottom: 12, trailing: 70)
        
        button.configuration = config
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    var clearChildsButtonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        configureClearChildsButton()
    }

    func configureClearChildsButton() {
        addSubview(clearChildsButton)
        clearChildsButton.translatesAutoresizingMaskIntoConstraints = false
        clearChildsButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint.activate([
            clearChildsButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            clearChildsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        clearChildsButtonAction?()
    }
    
}
