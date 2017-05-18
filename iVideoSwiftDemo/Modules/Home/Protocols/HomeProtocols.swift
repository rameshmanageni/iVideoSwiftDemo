//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func displayErrorMessage(message: String)
    func setVideoDetails(details: [HomeViewOutputModel])
    func displayProgress(message: String)
    func dismissProgress()
    func getAlbumId() -> HomeViewModel
}

protocol HomeWireFrameProtocol: class {
    weak var view: UIViewController? {get set}
    static func setupHomeModule() -> UIViewController
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
}

protocol HomePresenterProtocol: class {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func notifyViewDidLoad()
    func notifyLoadMore()
    func notifyVideoSelected()
 }

protocol HomeInteractorOutputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    func onHomeFetchingFailed(error: EApiErrorType)
    func onHomeFetchingSucceeded(data: [HomeViewOutputModel])
}

protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol? { get set }
    var APIDataManager: HomeAPIDataManagerInputProtocol? { get set }
    var localDataManager: HomeLocalDataManagerInputProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func getVideoListWith(model: HomeViewModel)
}

protocol HomeDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
}

protocol HomeAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    func getVideoListWith(model: HomeViewModel, callback: @escaping (ECallbackResultType) -> Void)
}

protocol HomeLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
}
