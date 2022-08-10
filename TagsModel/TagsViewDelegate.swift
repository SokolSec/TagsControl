//
//  TagsViewDelegate.swift
//  TagsControl
//
//  Created by Даниил on 07.08.2022.
//

//Delegate
protocol TagsViewDelegate: AnyObject {
    
    //Information on which index the tag was deleted
    func didSelectTag (index: Int)
    
    //Information on which index the tag was deleted and what is its name
    func removedTag (index: Int, word: String)
}
