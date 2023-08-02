//
//  CustomContainerView.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-20.
//

import Foundation
import UIKit
import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

class CustomContainerView:UIView{
    func style(){
        UIFactory.styleMainSection(section: self)
    }
}
