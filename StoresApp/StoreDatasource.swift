//
//  StoreDatasource.swift
//  StoresApp
//
//  Created by Jenifer  on 5/20/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import Foundation

struct StoreDatasource {
    private static var stores = [Store]()
    
    
    static func fetchAllStores() -> [Store]
    {
        let sunbirdCleaningServices = Store(category: "Cleaning Services", name: "Sunbird Cleaning Services", address: "4456 The Plaza", location: "Jersey City", image: "jcp.png", latitude: 40.726899, longitude: -74.034957)
        
        let qualiCareMaids = Store(category: "Cleaning Services", name: "QualiCare Maids", address: "2839 Selwyn Ave", location: "Raleigh", image: "macys.png", latitude: 35.782832, longitude: -78.679518)
        
        let turboTechNerds = Store(category: "Computer Repair & Service", name: "Computer Repair & Service", address: "1730 E Woodlawn Rd", location: "Jersey City", image: "chicos.png", latitude: 39.333583, longitude: -76.747548)
        
        stores += [sunbirdCleaningServices, qualiCareMaids, turboTechNerds, qualiCareMaids, sunbirdCleaningServices, turboTechNerds]
        
       return stores
    }
    
    
}