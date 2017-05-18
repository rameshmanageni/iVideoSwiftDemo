//
//  OrdersListViewOutputModel.swift
//  Mezuka
//
//  Created by VikasRedbytes on 06/02/17.
//  Copyright © 2017 Mezuka. All rights reserved.
//

import Foundation

final class OrdersListViewOutputModel {
    var streetAddress: String = ""
    var unit: String = ""
    var zipcode: String = ""
    var city: String = ""
    var state: String = ""
    var country: String = ""
    var isOpen: Bool = true
    var states = [String]()
}
