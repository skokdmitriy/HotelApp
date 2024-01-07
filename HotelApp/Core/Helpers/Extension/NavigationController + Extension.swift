//
//  NavigationController + Extension.swift
//  HotelApp
//
//  Created by Дмитрий Скок on 07.01.2024.
//

import UIKit.UINavigationController

extension UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        UIBarButtonItem.appearance().tintColor = .black
    }

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
