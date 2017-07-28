//
//  KMToolbarItem.swift
//
//  Created by Krunal Mehta on 26/02/17.
//

import UIKit

class KMToolbarItem: UIView {
    var button: UIButton!
    var label = UILabel()
    var enabled = Bool()
    
    func initWithTitle(title: NSString, image: UIImage, selectedImage: UIImage){
        self.frame = CGRect(x: 0,y: 5,width: 71,height: 70)
        self.backgroundColor = UIColor.green
        self.autoresizesSubviews = true
        self.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleWidth]
        self.button = UIButton(type: .custom)
        self.button.frame = CGRect(x: 3,y: 5,width: self.frame.size.width,height: 60)
//---------------------- For iPad -------------------------------
//        if(OtherConstants().IPAD() == true){
//            self.frame = CGRect(x: 0,y: 5,width: 142,height: 100)
//            self.button.frame = CGRect(x: 3,y: 5,width: 142,height: 100)
//        }
//---------------------------------------------------------------
        
        self.button.backgroundColor = UIColor.clear
        self.button.setImage(image, for: .normal)
        self.button.setImage(selectedImage, for: .highlighted)
        self.button.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        self.addSubview(self.button)
        
    }
    func setEnabled(enabled: Bool){
        self.enabled = enabled
        if(self.button != nil){
            self.button.isEnabled = enabled
        }
    }
    func isEnabled()-> Bool{
        return self.button.isEnabled
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
