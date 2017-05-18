//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class OrdersListInteractor: OrdersListInteractorInputProtocol {
    weak var presenter: OrdersListInteractorOutputProtocol?
    var APIDataManager: OrdersListAPIDataManagerInputProtocol?
    var localDataManager: OrdersListLocalDataManagerInputProtocol?
    
    init() {}
    
    func getOrdersList() {
        APIDataManager?.getOrdersList(callback: { (result) in
            switch result {
            case .Failure(let error):
                self.presenter?.onOrdersListFetchingFailed(error: error)
            case .Success(let data as [OrdersListViewOutputModel]):
                self.presenter?.onOrdersListFetchingSucceeded(data: data)
            default:
                break
            }
        })
    }
}
