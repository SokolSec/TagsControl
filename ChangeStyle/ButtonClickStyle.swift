//
//  ButtonClickStyle.swift
//  TagsControl
//
//  Created by Даниил on 07.08.2022.
//

import UIKit

//Button design for changing the style
final class ButtonClickStyle: UIView {
    
    ///Closure for transferring data between classes
    var clickTapStyle: (() -> ())?
    
    //Create button
    let styledButton : UIButton = {
        let style = UIButton()
        style.backgroundColor = .systemOrange
        style.layer.borderWidth = 0.7
        style.layer.cornerRadius = 5.0
        style.clipsToBounds = true
        style.translatesAutoresizingMaskIntoConstraints = false
        return style
    }()
    
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //Processing an event from a button tap
    @objc private func tapStyle() {
        self.clickTapStyle?()
    }
    
    //Layout button and setup
    private func setupUI() {
        self.addSubview(styledButton)
        styledButton.addTarget(self, action: #selector(tapStyle), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            styledButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
            styledButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            styledButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            styledButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            styledButton.heightAnchor.constraint(equalToConstant: 40),
            styledButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
