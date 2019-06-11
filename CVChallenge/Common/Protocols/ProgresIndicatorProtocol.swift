//
//  ProgresIndicatorProtocol.swift
//  CVChallenge
//
//  Created by isela on 6/25/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

protocol ProgressIndicatorProtocol {
    func showProgressIndicator()
    func hideProgressIndicator()
}

extension ProgressIndicatorProtocol where Self: UIViewController {
    
    /// Adds Progress indicator view to the top VC.
    func showProgressIndicator(){
        self.view.isUserInteractionEnabled = false
        let progressIndicator = ProgressIndicator(text: "loading_message".localize())
        progressIndicator.tag = Constants.progressIndicatorViewTag
        self.view.addSubview(progressIndicator)
    }
    
    /// Removes the progress indicator view from its current parent.
    func hideProgressIndicator(){
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            if let viewWithTag = self.view.viewWithTag(Constants.progressIndicatorViewTag) {
                viewWithTag.removeFromSuperview()
            }
        }
    }
}
