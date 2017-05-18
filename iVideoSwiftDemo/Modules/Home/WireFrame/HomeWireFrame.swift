
//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

final class HomeWireFrame: HomeWireFrameProtocol {
    weak var view: UIViewController?
    
    class func setupHomeModule() -> UIViewController {
        // Generating module components
        let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "StoryboardOrdersListViewNavigation") as! UINavigationController
        let view: HomeViewProtocol = navigation.topViewController as! HomeView
        
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol = HomeInteractor()
        let APIDataManager: HomeAPIDataManagerInputProtocol = HomeAPIDataManager()
        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager() as HomeLocalDataManagerInputProtocol
        let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
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
}
