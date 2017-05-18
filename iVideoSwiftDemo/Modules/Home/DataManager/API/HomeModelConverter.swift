//
//  OrdersListModelConverter.swift
//  Mezuka
//
//  Created by VikasRedbytes on 06/02/17.
//  Copyright © 2017 Mezuka. All rights reserved.
//

import Foundation
import SwiftyJSON

class OrdersListModelConverter {
    func fromJson(json: JSON) -> OrdersListViewOutputModel {
        let zip = json["zipcode"].stringValue
        let city = json["city"].stringValue
        let state = json["state"].stringValue
        let country = json["country"].stringValue
        let street = json["address1"].stringValue
        
        // Form the model to be sent
        let model: OrdersListViewOutputModel = OrdersListViewOutputModel()
        model.zipcode = zip
        model.city = city
        model.state = state
        model.country = country
        model.streetAddress = street
        
        return model
    }
    
    func fromJson(json: JSON) -> [OrdersListViewOutputModel] {
        var model: [OrdersListViewOutputModel] = []
        let jsonArray = json.arrayValue
        
        for jsonStore in jsonArray {
            let store = self.fromJson(json: jsonStore) as OrdersListViewOutputModel
            model.append(store)
        }
        return model
    }
}
