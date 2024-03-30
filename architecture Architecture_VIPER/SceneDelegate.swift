//
//  SceneDelegate.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 24/03/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var listOfMoviesRouter = ListOfMoviesRouter() //agregamos esta propiedad

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        listOfMoviesRouter.showListOfMovies(window: window)
    }


}

