//
//  FavouritesList.swift
//  NavControllersTableViews
//
//  Created by Tarun Singh on 2017-11-29.
//  Copyright © 2017 Tarun Singh. All rights reserved.
//

import Foundation
import UIKit

class FavouritesList {
    // private instance members
    static let sharedFavouritesList = FavouritesList()
    private(set) var favourites:[String]
    
    // constructor
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
    }
    
    // This method adds a font to the User Preferences file.
    func addFavourite(fontName : String) {
        if !favourites.contains(fontName) {
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    // This methods saves font favourites to the user preferences file.
    private func saveFavourites() {
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
    }
    
    // This method removes a font favourite from the user preferences file.
    func removeFavourite(fontName: String) {
        if let index = favourites.index(of: fontName) {
            favourites.remove(at: index)
            saveFavourites()
        }
    }
}
