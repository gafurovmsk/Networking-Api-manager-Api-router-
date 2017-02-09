//
//  Profile.swift
//  Magic Mirror
//
//  Created by Nik on 13/01/17.
//  Copyright © 2017 Gafurov Z. All rights reserved.
//

import UIKit

class Profile: NSObject {
    
    static let sharedInstance = Profile()
    
    
    private var favoritesList: FavoritesList
  
    
    private var cashData: NSData?
    private var imageManager: MMImageStore?
    
    var computed = MMDataItem()
    
    var id = ""
    var checkWord = ""
    var login = ""
    var name = ""
    var secondName = ""
    var lastName = ""
    var email = ""
    
    
    
    override init() {
        
        
        favoritesList = FavoritesList()
        
        // working with cash
        // working with net
        
    }
    
    
    func getFavoritesList() -> [FavoritesFetchData] {
        return favoritesList.getFavorites()
    }
    
    

}
