//
//  AlertControllerProtocol.swift
//  CVChallenge
//
//  Created by isela on 6/25/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

protocol AlertControllerProtocol {
    func showAlertError(_ message: String?, callback: (() -> Void)?)
}

extension AlertControllerProtocol where Self: UIViewController {
    /// Displays the alert pop up with a message.
    ///
    /// - Parameters:
    ///   - message: String optional, the message to show.
    ///   - callback: Callback optional, execute after alert dismissed
    func showAlertError(_ message: String? = nil, callback: (() -> Void)?){
        DispatchQueue.main.async {
            let alertMessage = message ?? "generic_error_message"
            let alertVC = UIAlertController(title: "Alert", message: alertMessage.localize(), preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Ok", style: .default) { action -> Void in
                callback?()
            })
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
