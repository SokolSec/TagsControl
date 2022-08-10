//
//  ViewController.swift
//  TagsControl
//
//  Created by Даниил on 07.08.2022.
//

import UIKit

//Exemple screen
final class ViewController: UIViewController, TagsViewDelegate {
    
    //MARK: Private instances of the class
    private let tagsView = TagsView()
    private let stackViewButton = StackViewButton()
    private let buttonClickStyle = ButtonClickStyle()
    
    //Variable with data type TagStyle and stock style2
    private let style : TagStyle = .style2()
    
    //Array words
    private let allWordArray = ["Даниил", "Влад", "Сергей", "Григорий", "Степан", "Марк", "Илья", "Антон"]
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tagsView)
        self.view.addSubview(stackViewButton)
        self.view.backgroundColor = .white
        
        tagsView.delegateTags = self
        tagsView.addWords(words: allWordArray, style: style)
        tagsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tagsView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
            tagsView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tagsView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
        stackViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewButton.topAnchor.constraint(equalTo: tagsView.bottomAnchor, constant: 10),
            stackViewButton.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            stackViewButton.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
        
        stackViewButton.didSelect = { [weak self] style in
            switch style {
            case .defaultStyle:
                self?.tagsView.currentStyle = .defaultStyle()
            case .style1:
                self?.tagsView.currentStyle = .style1()
            case .style2:
                self?.tagsView.currentStyle = .style2()
            }
        }
    }
    
    //MARK: TagsViewDelegate
    func didSelectTag(index: Int) {
        print("по индексу: \(index)\n\("------------------------")")
    }
    
    func removedTag(index: Int, word: String) {
        print("Вы удалили \(word) по \(index) индексу")
    }
}
