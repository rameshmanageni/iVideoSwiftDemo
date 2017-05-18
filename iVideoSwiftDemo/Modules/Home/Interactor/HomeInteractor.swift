//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation

final class HomeInteractor: HomeInteractorInputProtocol {
    weak var presenter: HomeInteractorOutputProtocol?
    var APIDataManager: HomeAPIDataManagerInputProtocol?
    var localDataManager: HomeLocalDataManagerInputProtocol?
    
    init() {}
    
    func getVideoListWith(model: HomeViewModel) {
        APIDataManager?.getVideoListWith(model: model, callback: { (result) in
            switch result {
            case .Failure(let error):
                self.presenter?.onHomeFetchingFailed(error: error)
            case .Success(let data as [HomeViewOutputModel]):
                self.presenter?.onHomeFetchingSucceeded(data: data)
            default:
                break
            }
        })
    }
}
