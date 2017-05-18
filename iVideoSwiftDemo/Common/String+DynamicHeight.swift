//
//  String+DynamicHeight.swift
//  ExpertConnect
//
//  Created by Supriya on 05/01/17.
//  Copyright © 2016 user. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.sizeToFit()        
        return label.frame.height
    }
    
    func heightForView(font:UIFont, width:CGFloat) -> CGFloat {
        var currHeight:CGFloat!
        
        let label:UILabel = UILabel(frame: CGRect(x:0, y:0, width:width, height:CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        
        currHeight = label.frame.height
        label.removeFromSuperview()
        
        return currHeight
    }
    
    func widthForView(font:UIFont, height:CGFloat) -> CGFloat {
        var currWidth:CGFloat!
        
        let label:UILabel = UILabel(frame: CGRect(x:0, y:0, width:CGFloat.greatestFiniteMagnitude, height:height))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        
        currWidth = label.frame.width
        label.removeFromSuperview()
        
        return currWidth
    }
}
