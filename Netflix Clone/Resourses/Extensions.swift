//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Карина Дудка on 12.10.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
