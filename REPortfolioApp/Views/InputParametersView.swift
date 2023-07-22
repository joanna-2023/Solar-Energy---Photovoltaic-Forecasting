//
//  InputParametersView.swift
//  REPortfolioApp
//
//  Created by Joanna (Desislava) Nikolova on 2023-07-20.
//

import Foundation
import UIKit

class InputParametersView:CustomContainerView, UITextFieldDelegate, UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet var latitudeTxtField:UITextField?
    @IBOutlet var longitudeTxtField:UITextField?
    @IBOutlet var numberOfModulesTxtField:UITextField?
    @IBOutlet var moduleModelSelection:UIPickerView?
    
    
    func setValues(){
        //Assign current values: input parameters -
        latitudeTxtField?.text = String(format: "%.2f", AppModel.siteLat())
        longitudeTxtField?.text = String(format: "%.2f", AppModel.siteLon())
        numberOfModulesTxtField?.text = String(format: "%d", AppModel.modsNum())
        
        //Assign delegation to textfields so that values can be updated -
        latitudeTxtField?.delegate = self
        longitudeTxtField?.delegate = self
        numberOfModulesTxtField?.delegate = self
        
        //Picker view -
        moduleModelSelection?.delegate = self
        moduleModelSelection?.dataSource = self
        moduleModelSelection?.delegate?.pickerView?(moduleModelSelection!, didSelectRow: 2, inComponent: 0)
        //moduleModelSelection?.reloadAllComponents()

    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return AppModel.solarCompanies.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AppModel.solarCompanies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let currentValue = "Company name"
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        let num = (textField.text as? NSString)!.floatValue
        print("output:%f",num)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("output:",textField.text as? CGFloat)
        
        if textField == latitudeTxtField{
            //let value = NSNumber(<#UnsafeRawPointer#>, withObjCType: textField.text)
            
            //AppModel.siteLatitude = Double(
        }else if textField == longitudeTxtField{
            //AppModel.siteLatitude = Double(
        }else if textField == numberOfModulesTxtField{
            //AppModel.siteLatitude = Double(
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
