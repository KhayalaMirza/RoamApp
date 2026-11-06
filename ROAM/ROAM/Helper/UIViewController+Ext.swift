//
//  UIViewController+Ext.swift
//  ROAM
//
//  Created by Khayala Mirza on 06/11/2026.
//

import UIKit

extension UIViewController {
    func showDefaultAlert(title: String = "Error",
                          message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
