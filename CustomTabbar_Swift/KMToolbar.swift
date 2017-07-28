//
//  KMToolbar.swift
//
//  Created by Krunal Mehta on 26/02/17.
//

import UIKit

protocol KMToolbarDelegate : class {
    func toolbarItemClickedAtIndex(_ index: NSInteger)
}

class KMToolbar: UIView {
    var items = NSArray()
    var itemBackgroundColor = UIColor.clear
    var _delegate: KMToolbarDelegate?

    func initInView(view: UIView, withDelegate: KMToolbarDelegate){
        var toolbarHeight: CGFloat
        toolbarHeight = 65.0;
        
        self.frame = CGRect(x: 0,y: view.bounds.size.height - toolbarHeight,width: view.bounds.size.width,height: toolbarHeight)
//---------------------- For iPad -------------------------------
//        if(OtherConstants().IPAD() == true){
//            self.frame = CGRect(x:0,y: view.bounds.size.height - toolbarHeight + 10,width: view.bounds.size.width,height: toolbarHeight)
//        }
//---------------------------------------------------------------
        
        self.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        _delegate = withDelegate
//        self.backgroundColor = UIColor.init(red: 215.0/255, green: 215.0/255 , blue: 215.0/255 , alpha: 1.0)
        self.backgroundColor = UIColor.white
        self.autoresizesSubviews = true
//        return self
    }
    
    // If you support both orientations, you should call this method to update frames of items after the size of KMToolbar has changed.
    func setItems(items: NSArray){
        self.items = items
        self.updateItemFrames()
    }
    func updateItemFrames(){
        for case let item as KMToolbarItem in self.items {
            item.removeFromSuperview()
        }
        let dividerWidth: CGFloat = 0.0
        let numberOfItems: NSInteger = self.items.count
        let numberOfDividers: NSInteger = numberOfItems - 1
        let itemWidth = (Int(self.bounds.size.width) - ( numberOfDividers * Int(dividerWidth) )) / self.items.count;
        var itemHeight: CGFloat = 65.0
//---------------------- For iPad -------------------------------
//        if(OtherConstants().IPAD() == true){
//            itemHeight = 110.0
//        }
//---------------------------------------------------------------
        var i: NSInteger = 0
        for case let item as KMToolbarItem in self.items {
            item.backgroundColor = self.itemBackgroundColor
            let dx: CGFloat = CGFloat((Int(itemWidth) + Int(dividerWidth)) * Int(i))
            item.frame = CGRect(x:dx,y: CGFloat(1.0),width: CGFloat(itemWidth),height: itemHeight)
            item.button.addTarget(self, action: #selector(toolbarItemClickedAtIndex(_:)), for: UIControlEvents.touchUpInside)
            self.addSubview(item)
            i += 1
        }
    }
    func toolbarItemClickedAtIndex(_ sender: UIButton){
        var index: NSInteger = 0
        for case let item as KMToolbarItem in self.items {
            if (item.button == sender) {
                break
            }
            index += 1
        }
        _delegate?.toolbarItemClickedAtIndex(index)
    }
    func setItemBackgroundColor(itemBackgroundColor: UIColor){
        self.itemBackgroundColor = itemBackgroundColor;
        for case let item as KMToolbarItem in self.items {
            item.backgroundColor = itemBackgroundColor;
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
