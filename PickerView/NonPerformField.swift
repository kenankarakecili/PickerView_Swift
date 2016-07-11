//
//  NonPerformField.swift
//  PickerView
//
//  Created by Kenan Karakecili on 11/07/16.
//  Copyright © 2016 Kenan Karakecili. All rights reserved.
//

import UIKit

class NonPerformField: UITextField {
  
  override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
    return false
  }
  
}
