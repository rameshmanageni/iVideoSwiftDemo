//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation
import UIKit

protocol OrdersListViewProtocol: class {
    var presenter: OrdersListPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func displayErrorMessage(message: String)
    func ordersListDetails(details: [OrdersListViewOutputModel])
}

protocol OrdersListWireFrameProtocol: class {
    weak var view: UIViewController? {get set}
    static func setupOrdersListModule() -> UIViewController
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    func navigateToQuickOrdersModule()
    func navigateToOrderInfoBaseModule()
}

protocol OrdersListPresenterProtocol: class {
    var view: OrdersListViewProtocol? { get set }
    var interactor: OrdersListInteractorInputProtocol? { get set }
    var wireFrame: OrdersListWireFrameProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func notifyViewWillAppear()
    func notifyQuickOrdersButtonTapped()
    func notifyOrderSelected()
}

protocol OrdersListInteractorOutputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    func onOrdersListFetchingFailed(error: EApiErrorType)
    func onOrdersListFetchingSucceeded(data: [OrdersListViewOutputModel])
}

protocol OrdersListInteractorInputProtocol: class {
    var presenter: OrdersListInteractorOutputProtocol? { get set }
    var APIDataManager: OrdersListAPIDataManagerInputProtocol? { get set }
    var localDataManager: OrdersListLocalDataManagerInputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func getOrdersList()
}

protocol OrdersListDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
}

protocol OrdersListAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    func getOrdersList(callback: @escaping (ECallbackResultType) -> Void)
}

protocol OrdersListLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
}
