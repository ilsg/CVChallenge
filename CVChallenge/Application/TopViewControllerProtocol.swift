//
//  TopViewControllerProtocol.swift
//  CVChallenge
//
//  Created by isela on 6/12/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var topViewController: UIViewController? {
        
        if keyWindow?.rootViewController == nil {
            return keyWindow?.rootViewController
        }
        var pointerView = keyWindow?.rootViewController
        
        while pointerView?.presentedViewController != nil {
            switch pointerView?.presentedViewController{
            case let navController as UINavigationController:
                pointerView = navController.topViewController
            case let tabController as UITabBarController:
                pointerView = tabController.selectedViewController
            default:
                pointerView = pointerView?.presentedViewController
            }
        }
        return pointerView
    }
}

protocol TopViewControllerProtocol  {
    var topViewController: UIViewController? { get }
    var topNavController: UINavigationController? { get }
    var topTabController: UITabBarController? { get }
}

extension TopViewControllerProtocol {

    var topViewController: UIViewController? {
        return UIApplication.shared.topViewController
    }
    
    var topNavController: UINavigationController? {
        return UIApplication.shared.topViewController as? UINavigationController
    }
    
    var topTabController: UITabBarController? {
        return UIApplication.shared.topViewController as? UITabBarController
    }
}

