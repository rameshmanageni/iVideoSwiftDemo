//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation

final class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
    init() {}
    
    func notifyViewDidLoad() {
        let viewModel = view?.getAlbumId()
        let message = "Processing".localized(in: "HomeView")
        view?.displayProgress(message: message)

        DispatchQueue.global().async {
            self.interactor?.getVideoListWith(model:viewModel!)
        }
    }
    
    func notifyLoadMore() {
        let viewModel = view?.getAlbumId()
        let message = "LoadingMore".localized(in: "HomeView")
        view?.displayProgress(message: message)
        
        DispatchQueue.global().async {
            self.interactor?.getVideoListWith(model:viewModel!)
        }
    }

    func notifyVideoSelected() {
    }

    func onHomeFetchingFailed(error: EApiErrorType) {
        view?.dismissProgress()
        let message = "Unsuccessful".localized(in: "HomeView")
        view?.displayErrorMessage(message: message)
    }
    
    func onHomeFetchingSucceeded(data: [HomeViewOutputModel]) {
        view?.dismissProgress()
        view?.setVideoDetails(details: data)
    }
}
