//
//  UIViewControllerExtention.swift
//  SDUHelper
//
//  Created by Nurbek on 12/21/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Default cell ID
    var cellID: String {
        return "TweetTableViewCell"
    }
    
    // MARK: - Global date format
    var dateFormat: String {
        return "dd.MM.yyyy HH:mm:ss"
    }
    
    // MARK: - Error alert
    func showError(body: String) {
        let alertTitle = "Error!"
        let alertController = UIAlertController(title: alertTitle,
                                                message: body,
                                                preferredStyle: .alert)
        // Changing title color of alert сontroller
        alertController.setValue(
            NSAttributedString(
                string: alertTitle,
                attributes: [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
                    NSAttributedString.Key.foregroundColor: UIColor.red
                ]
            ),
            forKey: "attributedTitle"
        )
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    // MARK: - Success alert controller
    func showSuccess(body: String, shouldPopViewController: Bool = true) {
        let alertTitle = "Success!"
        let alertController = UIAlertController(title: alertTitle,
                                                message: body,
                                                preferredStyle: .alert)
        // Changing title color of alert сontroller
        alertController.setValue(
            NSAttributedString(
                string: alertTitle,
                attributes: [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
                    NSAttributedString.Key.foregroundColor: UIColor.systemGreen
                ]
            ),
            forKey: "attributedTitle"
        )
        let okAction: UIAlertAction!
        // Action when dismissing a view controller
        if shouldPopViewController {
            okAction = UIAlertAction(
                title: "OK",
                style: .default
            ) { _ in
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            okAction = UIAlertAction(
                title: "OK",
                style: .default
            ) { _ in
                self.view.window?.rootViewController?.dismiss(animated: true)
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    // MARK: - Present login view controller
    //         Login VC's Storyboard ID
    var loginViewControllerID: String {
        return "LoginViewController"
    }
    
    func presentLoginVC(animated: Bool) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: loginViewControllerID) else { return }
        vc.modalPresentationStyle = .currentContext
        present(vc, animated: animated)
    }
    
    // MARK: - Converts string type to the date type
    func stringToDate(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        guard let date = dateFormatter.date(from: string) else {
            return Date()
        }
        return date
    }
}
