//
//  UIImageView+Extension.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 08/08/2022.
//
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageWith(urlString: String?) {
        
        guard let urlStr = urlString else {
            return
        }
        
        if let url = URL(string: urlStr){
            Utility.showIndicatorOnly(on: self)
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imgData = data {
                        self.image = UIImage(data: imgData)
                    }
                    Utility.hideIndicator(self)
                }
            }
        }
    }
    
    func makeCircularWith(bgColor: UIColor,
                          cornerRadius: CGFloat,
                          borderWidth: CGFloat,
                          borderColor: UIColor,
                          interactionEnabled: Bool) {
        self.backgroundColor = bgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.isUserInteractionEnabled = interactionEnabled
        self.clipsToBounds = true
    }
}
