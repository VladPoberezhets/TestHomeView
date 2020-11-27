//
//  SearchTextField.swift
//  DemoBrowser
//
//  Created by Vlad on 27.11.2020.
//

import Foundation
import UIKit


class SearchTextField:UIView{
    
    private let searchTextField = UITextField()
    
    static let heightSearchTextField:CGFloat = 45
    
    private var searchTextFieldDelegate:SearchTextFieldDelegate?
    
    var searchConstraint:[NSLayoutConstraint]!
    var searchAnimationConstraint:[NSLayoutConstraint]!
    
    init() {
        super.init(frame: .zero)
        addSubview(searchTextField)

        createSearchTextField()
        
        self.searchConstraint = [
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            searchTextField.topAnchor.constraint(equalTo: topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(searchConstraint)
    }
    
    
    private func createSearchTextField(){
        searchTextField.backgroundColor = UIColor.systemGray6
        searchTextField.placeholder = "Enter text to search"
        searchTextField.leftViewMode = .always
        searchTextField.contentVerticalAlignment = .center
        searchTextField.font = UIFont.systemFont(ofSize: 15)
        searchTextField.layer.cornerRadius = SearchTextField.heightSearchTextField / 2
                let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
                image.tintColor = .black
                searchTextField.leftView = image
        searchTextField.delegate = self
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func createAnimationConstraint(){
        self.searchAnimationConstraint = [
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -100),
            searchTextField.topAnchor.constraint(equalTo: topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
    }
    
    
    func setSearchTextFieldDelegate(searchTextFieldDelegate:SearchTextFieldDelegate){
        self.searchTextFieldDelegate = searchTextFieldDelegate
    }
    
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension SearchTextField:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("hello")
        searchTextFieldDelegate?.isAnimating(start: true)
        UIView.animate(withDuration: 0.4) {
            NSLayoutConstraint.deactivate(self.searchConstraint)
            self.createAnimationConstraint()
            NSLayoutConstraint.activate(self.searchAnimationConstraint)
            self.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextFieldDelegate?.isAnimating(start: false)
        
        UIView.animate(withDuration: 0.4) {
            NSLayoutConstraint.deactivate(self.searchAnimationConstraint)
            
            NSLayoutConstraint.activate(self.searchConstraint)
            self.layoutIfNeeded()
        }
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        UIView.animate(withDuration: 0.4) {
            NSLayoutConstraint.deactivate(self.searchAnimationConstraint)
            
            NSLayoutConstraint.activate(self.searchConstraint)
            self.layoutIfNeeded()
        }
    }
}








