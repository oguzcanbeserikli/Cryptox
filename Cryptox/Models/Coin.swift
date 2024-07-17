//
//  Coin.swift
//  Cryptox
//
//  Created by Oğuzcan Beşerikli on 17.07.2024.
//

import Foundation

struct Coin {
    
    let id: Int
    let name: String
    let max_supply: Int?
    let cmc_rank: Int
    let quote: Quote
    
    struct Quote{
        let CAD: CAD
        
        struct CAD{
            private let price: Double
            let market_cap: Double
            
        }
    }
    
}
