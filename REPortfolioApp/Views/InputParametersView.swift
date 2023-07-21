//
//  InputParametersView.swift
//  REPortfolioApp
//
//  Created by Joanna (Desislava) Nikolova on 2023-07-20.
//

import Foundation
import UIKit

class InputParametersView:CustomContainerView{
    @IBOutlet var latitudeTxtField:UITextField?
    @IBOutlet var longitudeTxtField:UITextField?
    @IBOutlet var numberOfModulesTxtField:UITextField?
    
    func setValues(){
        latitudeTxtField?.text = String(format: "%.2f", AppModel.siteLat())
        longitudeTxtField?.text = String(format: "%.2f", AppModel.siteLon())
        numberOfModulesTxtField?.text = String(format: "%d", AppModel.modsNum())
    }
}
