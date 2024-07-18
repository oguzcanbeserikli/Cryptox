//
//  HomeControllerViewModel.swift
//  Cryptox
//
//  Created by Oğuzcan Beşerikli on 18.07.2024.
//

import Foundation

class HomeControllerViewModel {
    
    var onCoinsUpdated: (()->Void)?
    var onErrorMessage: ((CoinServiceError)->Void)?
    
    private(set) var coins: [Coin] = [] {
        didSet {
            self.onCoinsUpdated?()
        }
    }
    
    init() {
        self.fetchCoins()
        
//        self.coins.insert(Coin(id: <#T##Int#>, name: <#T##String#>, maxSupply: <#T##Int?#>, rank: <#T##Int#>, pricingData: <#T##PricingData#>), at: <#T##Int#>)
    }
    
    public func fetchCoins() {
        let endpoint = Endpoint.fetchCoins()
        
        CoinService.fetchCoins(with: endpoint) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.coins = coins
                print("DEBUG PRINT:", "\(coins.count) coin fetched.")
                
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
    }
    
}
