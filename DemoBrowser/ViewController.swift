//
//  ViewController.swift
//  DemoBrowser
//
//  Created by Vlad on 27.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private let toolBarView:ToolBarView = {
        let toolBar = ToolBarView()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        return toolBar
    }()
    
    private var heightToolBar:CGFloat = 60
    
    private let homeContentView:HomeContentView = {
       let homeContent = HomeContentView()
//        homeContent.backgroundColor = .red
        homeContent.translatesAutoresizingMaskIntoConstraints = false
        return homeContent
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(toolBarView)
        view.addSubview(homeContentView)
    
        let homeContentViewConstraint = [
            homeContentView.topAnchor.constraint(equalTo: view.topAnchor),
            homeContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeContentView.bottomAnchor.constraint(equalTo: toolBarView.topAnchor)
        ]
        
        NSLayoutConstraint.activate(homeContentViewConstraint)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLayoutSubviews() {
        print(view.safeAreaInsets.bottom)
        let toolBarConstraint = [
            toolBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBarView.heightAnchor.constraint(equalToConstant: heightToolBar+view.safeAreaInsets.bottom)
        ]
        
        NSLayoutConstraint.activate(toolBarConstraint)
    }

   

}

