//
//  ToolBarVIew.swift
//  DemoBrowser
//
//  Created by Vlad on 27.11.2020.
//

import Foundation
import UIKit

class ToolBarView:UIView{
 
    private var buttonToolBar:ButtonToolBar = {
        var viewButton = ButtonToolBar()
            viewButton.translatesAutoresizingMaskIntoConstraints = false
        
        return viewButton
    }()
    
    init() {
        super.init(frame: .zero)

        addSubview(buttonToolBar)

        let buttonToolBarViewConstraint = [
            buttonToolBar.topAnchor.constraint(equalTo: topAnchor),
            buttonToolBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonToolBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonToolBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(buttonToolBarViewConstraint)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
