//
//  ButtonToolBar.swift
//  DemoBrowser
//
//  Created by Vlad on 27.11.2020.
//

import Foundation
import UIKit

class ButtonToolBar:UIView{
    
    lazy var backButton = buttonToolBar(image: UIImage(systemName: "lessthan")!)
    lazy var homeButton = buttonToolBar(image: UIImage(systemName: "house")!)
    lazy var searchButton = buttonToolBar(image: UIImage(systemName: "magnifyingglass")!)
    lazy var listButton = buttonToolBar(image: UIImage(systemName: "doc.on.doc")!)
    lazy var menuButton = buttonToolBar(image: UIImage(systemName: "list.dash")!)
    
    private func buttonToolBar(image: UIImage)->UIButton{
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFill
        button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        button.contentMode = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        return button
    }
    
    func buttonConstraint(view:UIView)->[NSLayoutConstraint]{
        [
            view.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            view.heightAnchor.constraint(equalToConstant: 60),
            view.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
    }
    
    
    init() {
        super.init(frame: .zero)
        
        
        addSubview(backButton)
        addSubview(homeButton)
        addSubview(searchButton)
        addSubview(listButton)
        addSubview(menuButton)
        
        
        
        let defaultConstraint = [
            backButton.trailingAnchor.constraint(equalTo: homeButton.leadingAnchor),
            homeButton.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor),
            searchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            listButton.leadingAnchor.constraint(equalTo: searchButton.trailingAnchor),
            menuButton.leadingAnchor.constraint(equalTo: listButton.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(defaultConstraint)
        
        NSLayoutConstraint.activate(buttonConstraint(view: backButton))
        NSLayoutConstraint.activate(buttonConstraint(view: homeButton))
        NSLayoutConstraint.activate(buttonConstraint(view: searchButton))
        NSLayoutConstraint.activate(buttonConstraint(view: listButton))
        NSLayoutConstraint.activate(buttonConstraint(view: menuButton))
    }
    
    @objc func showMenu(sender: UIButton){
        switch sender {
        case backButton:
            print("backButton")
        case homeButton:
            print("homeButton")
        case searchButton:
            print("searchButton")
        case listButton:
            print("listButton")
        case menuButton:
            let tableMenu = CustomMenu()
            tableMenu.modalPresentationStyle = .popover
            let popOverTableMenu = tableMenu.popoverPresentationController
            popOverTableMenu?.delegate = self
            popOverTableMenu?.sourceView = menuButton
            popOverTableMenu?.sourceRect = menuButton.bounds
            tableMenu.preferredContentSize = CGSize(width: 250, height: 250)
            
            let currentController = self.getCurrentViewController()
            
            currentController?.present(tableMenu, animated: true, completion: nil)
//            self.presentationControllerDidAttemptToDismiss?(popOverTableMenu)
            
        default:
            print("error button")
        }
    }
    
    func getCurrentViewController() -> UIViewController? {

        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            var currentController: UIViewController! = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController
            }
            return currentController
        }
        return nil

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonToolBar:UIPopoverPresentationControllerDelegate{
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
