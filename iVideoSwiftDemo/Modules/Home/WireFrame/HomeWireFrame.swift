//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation
import UIKit

final class OrdersListWireFrame: OrdersListWireFrameProtocol {
    weak var view: UIViewController?
    
    class func setupOrdersListModule() -> UIViewController {
        // Generating module components
        let storyboard = UIStoryboard(name: "OrdersList", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "StoryboardOrdersListViewNavigation") as! UINavigationController
        let view: OrdersListViewProtocol = navigation.topViewController as! OrdersListView
        
        let presenter: OrdersListPresenterProtocol & OrdersListInteractorOutputProtocol = OrdersListPresenter()
        let interactor: OrdersListInteractorInputProtocol = OrdersListInteractor()
        let APIDataManager: OrdersListAPIDataManagerInputProtocol = OrdersListAPIDataManager()
        let localDataManager: OrdersListLocalDataManagerInputProtocol = OrdersListLocalDataManager()
        let wireFrame: OrdersListWireFrameProtocol = OrdersListWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDataManager = localDataManager
        wireFrame.view = navigation
        
        return navigation
    }
    
    class func OrdersListViewModule() -> UIViewController {
        // Generating module components
        let storyboard = UIStoryboard(name: "OrdersList", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "StoryboardOrdersListView") as! OrdersListView
        
        let presenter: OrdersListPresenterProtocol & OrdersListInteractorOutputProtocol = OrdersListPresenter()
        let interactor: OrdersListInteractorInputProtocol = OrdersListInteractor()
        let APIDataManager: OrdersListAPIDataManagerInputProtocol = OrdersListAPIDataManager()
        let localDataManager: OrdersListLocalDataManagerInputProtocol = OrdersListLocalDataManager()
        let wireFrame: OrdersListWireFrameProtocol = OrdersListWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDataManager = localDataManager
        wireFrame.view = view
        
        return view
    }
  
    func navigateToQuickOrdersModule() {
        let quickOrdersView = QuickOrdersWireFrame.setupQuickOrdersModule(object: AnyObject.self as AnyObject)
        if view is UINavigationController {
          (view as! UINavigationController).pushViewController(quickOrdersView, animated: true)
        } else {
          (view?.parent?.parent as! UINavigationController).pushViewController(quickOrdersView, animated: true)
        }
    }
    
    func navigateToOrderInfoBaseModule() {
        let orderInfoBaseView = OrderInfoBaseWireFrame.setupOrderInfoBaseModule(object: AnyObject.self as AnyObject)
        if view is UINavigationController {
          (view as! UINavigationController).pushViewController(orderInfoBaseView, animated: true)
        } else {
          (view?.parent?.parent as! UINavigationController).pushViewController(orderInfoBaseView, animated: true)
        }
    }
}
