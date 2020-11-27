//
//  HomeContentView.swift
//  DemoBrowser
//
//  Created by Vlad on 27.11.2020.
//

import Foundation
import UIKit

class HomeContentView:UIView{
    
    private let imageLogo:UIImageView = {
        var imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "google")
        imageLogo.contentMode = .scaleAspectFit
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        return imageLogo
    }()
    
    private let sizeImage:CGFloat = 100
    
    private let searchTextField:SearchTextField = {
        let searchView = SearchTextField()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
    }()
    
    private let buttonCancel:UIButton = {
        let buttonCancel = UIButton()
        buttonCancel.setTitle("Cancel", for: .normal)
        buttonCancel.setTitleColor(.blue, for: .normal)
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return buttonCancel
    }()
    
    var imageLogoConstraint:[NSLayoutConstraint]!
    var searchTextFieldConstraint:[NSLayoutConstraint]!
    
    var imageLogoAnimationConstraint:[NSLayoutConstraint]!
    var searchTextFieldAnimationConstraint:[NSLayoutConstraint]!
    
    var cancelButtonAnimationConstraint:[NSLayoutConstraint]!
    var cancelButtonConstraint:[NSLayoutConstraint]!
    
    private var buttonCancelWidth:CGFloat?
    
    init() {
        super.init(frame: .zero)
        searchTextField.setSearchTextFieldDelegate(searchTextFieldDelegate: self)
        
        addSubview(imageLogo)
        addSubview(searchTextField)
        addSubview(buttonCancel)
        
        self.imageLogoConstraint = [
            imageLogo.topAnchor.constraint(equalTo:  safeAreaLayoutGuide.topAnchor, constant: 50),
            imageLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageLogo.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageLogo.widthAnchor.constraint(equalToConstant: sizeImage),
            imageLogo.heightAnchor.constraint(equalToConstant: sizeImage)
        ]
        
        self.searchTextFieldConstraint = [
            searchTextField.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 50),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: SearchTextField.heightSearchTextField),
            
        ]
        
        NSLayoutConstraint.activate(self.imageLogoConstraint)
        NSLayoutConstraint.activate(self.searchTextFieldConstraint)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.buttonCancelWidth = buttonCancel.bounds.width
        self.cancelButtonConstraint = [
            buttonCancel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            buttonCancel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: self.buttonCancelWidth ?? 0),
            buttonCancel.heightAnchor.constraint(equalToConstant: SearchTextField.heightSearchTextField)
        ]
        NSLayoutConstraint.activate(self.cancelButtonConstraint)
    }
    
    
    @objc func cancel(sender:UIButton){
        UIView.animate(withDuration: 0.4) {[weak self] in
            guard let self = self else { return }
            
            self.deactivateAnimationConstraint()
            self.activateConstraint()
            self.layoutIfNeeded()
        }
        self.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeContentView:SearchTextFieldDelegate{
    func isAnimating(start: Bool) {
        if start == true{
            UIView.animate(withDuration: 0.4) {[weak self] in
                guard let self = self else { return }
                
                self.deactivateConstraint()
                self.createAnimationConstraints()
                self.activateAnimationConstraint()
                
                self.layoutIfNeeded()
            }
            
        }else{
            UIView.animate(withDuration: 0.4) {[weak self] in
                guard let self = self else { return }
                
                self.deactivateAnimationConstraint()
                self.activateConstraint()
                
                self.layoutIfNeeded()
            }
        }
    }
}

extension HomeContentView{
    
    func createAnimationConstraints(){
        self.imageLogoAnimationConstraint = [
            imageLogo.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 50),
            imageLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageLogo.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageLogo.widthAnchor.constraint(equalToConstant: sizeImage),
            imageLogo.heightAnchor.constraint(equalToConstant: sizeImage)
        ]
        
        self.searchTextFieldAnimationConstraint = [
            searchTextField.topAnchor.constraint(equalTo: topAnchor , constant: 50),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: SearchTextField.heightSearchTextField),
            
        ]
        
        self.cancelButtonAnimationConstraint = [
            buttonCancel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            buttonCancel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            buttonCancel.heightAnchor.constraint(equalToConstant: SearchTextField.heightSearchTextField)
        ]
        NSLayoutConstraint.activate(self.cancelButtonAnimationConstraint)
    }
    
    
    func activateConstraint(){
        NSLayoutConstraint.activate(self.imageLogoConstraint)
        NSLayoutConstraint.activate(self.searchTextFieldConstraint)
        NSLayoutConstraint.activate(self.cancelButtonConstraint)
    }
    
    func deactivateConstraint(){
        NSLayoutConstraint.deactivate(self.imageLogoConstraint)
        NSLayoutConstraint.deactivate(self.searchTextFieldConstraint)
        NSLayoutConstraint.deactivate(self.cancelButtonConstraint)
    }
    
    func deactivateAnimationConstraint(){
        NSLayoutConstraint.deactivate(self.imageLogoAnimationConstraint)
        NSLayoutConstraint.deactivate(self.searchTextFieldAnimationConstraint)
        NSLayoutConstraint.deactivate(self.cancelButtonAnimationConstraint)
    }
    
    func activateAnimationConstraint(){
        NSLayoutConstraint.activate(self.imageLogoAnimationConstraint)
        NSLayoutConstraint.activate(self.searchTextFieldAnimationConstraint)
        NSLayoutConstraint.activate(self.cancelButtonAnimationConstraint)
    }
}
