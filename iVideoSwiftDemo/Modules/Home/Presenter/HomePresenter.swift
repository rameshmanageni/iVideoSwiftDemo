//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class OrdersListPresenter: OrdersListPresenterProtocol, OrdersListInteractorOutputProtocol {
    weak var view: OrdersListViewProtocol?
    var interactor: OrdersListInteractorInputProtocol?
    var wireFrame: OrdersListWireFrameProtocol?
    
    init() {}
    
    func notifyViewWillAppear() {
        DispatchQueue.global().async {
         self.interactor?.getOrdersList()
        }
    }
    
    func notifyQuickOrdersButtonTapped() {
        wireFrame?.navigateToQuickOrdersModule()
    }
    
    func notifyOrderSelected() {
        wireFrame?.navigateToOrderInfoBaseModule()
    }
    
    func onOrdersListFetchingFailed(error: EApiErrorType) {
        let message = "Unsuccessful".localized(in: "AddressesList")
        view?.displayErrorMessage(message: message)
    }
    
    func onOrdersListFetchingSucceeded(data: [OrdersListViewOutputModel]) {
        view?.ordersListDetails(details: data)
    }
}
