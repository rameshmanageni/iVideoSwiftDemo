//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class OrdersListViewModel {
    var orderStatus: String = ""
    var orderDateTime: String = ""
    var orderID: String = ""
    var billTotal: String = ""
    var orderFrom: String = ""
    
    init(orderStatus: String, orderDateTime: String, orderID: String, billTotal: String, orderFrom: String) {
        self.orderStatus = orderStatus
        self.orderDateTime = orderDateTime
        self.orderID = orderID
        self.billTotal = billTotal
        self.orderFrom = orderFrom
    }
}
