//
//  Extension.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 09.10.23.
//

import Foundation
import UIKit

extension UIViewController {
    func createErrorAlert(errorMessage: String) -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка", message: errorMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ок", style: .cancel)
        alert.addAction(cancelAction)
        return alert
    }
}

extension UILabel {
    
    func createLabel(with text: String?, withTextColor color: UIColor, withAligment aligment:  NSTextAlignment = .left, withFontr font: UIFont = .systemFont(ofSize: 15)) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = aligment
        label.textColor = color
        label.font = font
        return label
    }
    
}
