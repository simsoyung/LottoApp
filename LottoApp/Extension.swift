//
//  Extension.swift
//  LottoApp
//
//  Created by 심소영 on 6/7/24.
//

import UIKit

extension UILabel {
    
    func settingLabel(color: UIColor){
        self.textAlignment = .center
        self.textColor = .white
        self.font = .boldSystemFont(ofSize: 17)
        self.backgroundColor = color
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
    }
}
