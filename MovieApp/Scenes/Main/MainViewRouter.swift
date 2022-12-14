//
//  MainViewRouter.swift
//  MovieApp
//
//  Created by Fatih Gursoy on 16.11.2022.
//

import UIKit

protocol MainViewRouterProtocol: AnyObject {
    var viewController: UIViewController {get set}
    
    func routeToDetail(movieId: Int)
}

class MainViewRouter: MainViewRouterProtocol {
    
    unowned var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func createScreen() -> UIViewController {
        let viewModel = MainViewModel()
        let mainViewController = MainViewController(viewModel: viewModel)
        mainViewController.viewModel.router = MainViewRouter(viewController: mainViewController)
        return mainViewController
    }
    
    func routeToDetail(movieId: Int) {
        let movieDetailVC = MovieDetailRouter.createScreen(with: movieId)
        viewController.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
