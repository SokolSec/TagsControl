//
//  TagsViews.swift
//  TagsControl
//
//  Created by Даниил on 07.08.2022.
//

import UIKit

//Create class for location and management tagsViews
final class TagsView: UIView {
    
    //Weak link and start delegate
    weak var delegateTags: TagsViewDelegate?
    
    //Array to iterate through TagsViews
    var tags: [TagView] = []
    
    //Instance of the class UIView
    private let spacerView = UIView()
    
    //Observer of style properties
    var currentStyle: TagStyle = .defaultStyle() {
        didSet {
            for tag in tags {
                tag.setStyle(currentStyle)
            }
        }
    }
    
    //Create scrollView
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    //Create stackView
    private let stackView : UIStackView = {
        let stackVIew = UIStackView()
        stackVIew.axis = .horizontal
        stackVIew.alignment = .leading
        stackVIew.spacing = 16
        stackVIew.distribution = .fill
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        return stackVIew
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
    
    //MARK: - Layout scrollView, stackView setup their installations
    private func setupUI() {
        self.backgroundColor = .systemGray6
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
    
    //MARK: - A method for adding, deleting, setup processing words
    func addWords(words: [String], style: TagStyle) {
        for (index,word) in words.enumerated() {
            let tagView = TagView()
            tagView.setText(text: word)
            tagView.setStyle(style)
            self.stackView.addArrangedSubview(tagView)
            self.tags.append(tagView)
            tagView.clickTagView = { [weak self] in
                self?.delegateTags?.didSelectTag(index: index)
            }
            tagView.clearLabel = { [weak self] in
                guard let self = self else {return}
                self.stackView.removeArrangedSubview(tagView)
                tagView.removeFromSuperview()
                self.tags =  self.tags.filter { tagView in
                    tagView != tagView
                }
                self.delegateTags?.removedTag(index: index, word: word)
            }
        }
        stackView.addArrangedSubview(spacerView)
    }
}
