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
