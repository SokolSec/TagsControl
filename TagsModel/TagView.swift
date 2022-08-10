//
//  TagView.swift
//  TagsControl
//
//  Created by Даниил on 07.08.2022.
//

import UIKit

//Сreate class TagView
final class TagView: UIView {
    
    ///Closure for label
    var clickTagView: (() -> ())?
    
    ///Closure for imageView
    var clearLabel: (() -> ())?
    
    //CornerRadius UIView
    private var cornerRadius: CGFloat = 0
    
    //Create label
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Create imageView
    private let clearTapLabel: UIImageView = {
        let clearTapLabel = UIImageView()
        clearTapLabel.image = UIImage(systemName: "xmark.square.fill")
        clearTapLabel.isUserInteractionEnabled = true
        clearTapLabel.translatesAutoresizingMaskIntoConstraints = false
        return clearTapLabel
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //Override for correct display
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.cornerRadius
    }
    
    //Tagret label
    @objc private func clickLabel() {
        self.clickTagView?()
    }
    
    //Taget imageView
    @objc private func clickImage() {
        self.clearLabel?()
    }
    
    //Layout label, imageView and their installations
    private func setupUI() {
        self.addSubview(label)
        let tapLabel = UITapGestureRecognizer(target: self, action: #selector(clickLabel))
        label.addGestureRecognizer(tapLabel)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
        ])
        
        self.addSubview(clearTapLabel)
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(clickImage))
        clearTapLabel.addGestureRecognizer(tapImage)
        
        NSLayoutConstraint.activate([
            clearTapLabel.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            clearTapLabel.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 4),
            clearTapLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -4),
            clearTapLabel.heightAnchor.constraint(equalToConstant: 20),
            clearTapLabel.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    //Public Method for transmitting text on lanel
    func setText(text: String) {
        self.label.text = text
    }
    
    //Public Method for text processing
    func setStyle(_ style: TagStyle) {
        self.label.font = style.font
        self.backgroundColor = style.backgroundColor
        self.label.textColor = style.textColor
        self.label.layer.masksToBounds = true
        self.cornerRadius = style.cornerRadius
        self.layer.borderWidth = style.borderWidth
        self.layer.borderColor = style.borderColor
    }
}
