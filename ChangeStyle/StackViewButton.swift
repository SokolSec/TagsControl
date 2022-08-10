//
//  StackViewButton.swift
//  TagsControl
//
//  Created by Даниил on 07.08.2022.
//

import UIKit

//Placing ButtonClickStyle on StackView
final class StackViewButton: UIView {
    
    ///Closure for managing styles
    var didSelect: ((_ style: TagStyles) -> ())?
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //Create scrollView
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    //Create stackView
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //Layout scrollView, stackView and their installations
    private func setupUI() {
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        //Button generation and style management
        for i in 0...2 {
            let buttonClickStyle = ButtonClickStyle()
            buttonClickStyle.styledButton.setTitle("Стиль №\(i + 1) ", for: .normal)
            stackView.addArrangedSubview(buttonClickStyle)
            buttonClickStyle.clickTapStyle = { [weak self] in
                switch i {
                case 0:
                    self?.didSelect?(.defaultStyle)
                case 1:
                    self?.didSelect?(.style1)
                case 2:
                    self?.didSelect?(.style2)
                default: break
                }
            }
        }
    }
}
