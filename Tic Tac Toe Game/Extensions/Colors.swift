//
//  Colors.swift
//  Tic Tac Toe Game
//
//  Created by Shishir_Mac on 18/7/22.
//

import Foundation
import UIKit

struct Colors{
    static let primaryColor = "#232328"
    static let buttonColor = "#0A84FF"
}

extension String{
    var hexColor: UIColor?{
        return UIColor(named: self)
    }
}

extension String{
    func uiColor () -> UIColor {
        var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
