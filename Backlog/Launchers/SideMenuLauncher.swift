//
//  SideMenuLauncher.swift
//  Backlog
//
//  Created by Aaron Kiser on 3/1/21.
//

import Foundation
import UIKit

class SideMenuLauncher: NSObject {
    
    let popinMenuView = PopinMenuView()
    
    let blackView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        view.alpha = 0
        return view
    }()
    
    override init() {
        super.init()
        popinMenuView.setupView()
    }
    
    func launchSideMenu() {
        if self.popinMenuView.isDisplayed {
            self.popinMenuView.isDisplayed = false
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 0
                self.popinMenuView.view.center.x = -(self.popinMenuView.view.frame.width / 2)
            }
        } else {
            self.popinMenuView.isDisplayed = true
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
                self.popinMenuView.view.center.x = self.popinMenuView.view.frame.width / 2
            }
        }
    }
}
