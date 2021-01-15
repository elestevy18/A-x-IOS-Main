//
//  File.swift
//  AofX
//
//  Created by Kevin Jimenez on 8/18/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import Foundation
import StoreKit

class IAPService: NSObject{
    private override init() {
    }
    static let shared = IAPService()
    
    let defaults = UserDefaults.standard
    
    struct Keys {
            static let annualPurchased    = "annual"
            static let monthlyPurchased   = "monthly"
            static let biannualPurchased  = "biannual"
        static let  premium               = "premium"
           
    }
    
    var products = [SKProduct]()
    let paymentQueue = SKPaymentQueue.default()
    
    func getProducts(){
        let products: Set = [Subscriptions.monthly.rawValue, Subscriptions.biannuallly.rawValue, Subscriptions.annually.rawValue]
        let request = SKProductsRequest(productIdentifiers: products)
        request.delegate = self
        request.start()
        paymentQueue.add(self)
    }
    func purchase(product: Subscriptions){
        guard let productToPurchase = products.filter({ $0.productIdentifier == product.rawValue}).first else {return}
        let payment = SKPayment(product:productToPurchase)
        paymentQueue.add(payment)
    }
    
    func restorePurchases(){
        print("restoring purchases")
        paymentQueue.restoreCompletedTransactions()
        print(paymentQueue.restoreCompletedTransactions())
    }
}

extension IAPService: SKProductsRequestDelegate{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        for product in response.products{
            print(product.localizedTitle)
        }
    }
}

extension IAPService: SKPaymentTransactionObserver{
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions{
            
            if transaction.payment.productIdentifier == "Annually" && ( transaction.transactionState == .purchased || transaction.transactionState == .restored ) {
                UserDefaults.standard.set(true, forKey: Save.annualPurchased)
                UserDefaults.standard.set(true, forKey: Save.premium)
            } else if transaction.payment.productIdentifier == "biannually" && ( transaction.transactionState == .purchased || transaction.transactionState == .restored ){
                           UserDefaults.standard.set(true, forKey: Save.biannualPurchased)
                UserDefaults.standard.set(true, forKey: Save.premium)
            } else if transaction.payment.productIdentifier == "monthly" && ( transaction.transactionState == .purchased || transaction.transactionState == .restored ){
                UserDefaults.standard.set(true, forKey: Save.monthlyPurchased)
                UserDefaults.standard.set(true, forKey: Save.premium)
            } else{
                UserDefaults.standard.set(false, forKey: Save.premium)
            }
    
//                     print(transaction.transactionState.status(), transaction.payment.productIdentifier)
//            let purchase = transaction.transactionState.status() + transaction.payment.productIdentifier
//            if (purchase == "restoredAnnually"){
//                UserDefaults.standard.set(true, forKey: Save.annualPurchased)
//            } else if (purchase == "restoredBiannually"){
//                UserDefaults.standard.set(true, forKey: Save.biannualPurchased)
//            } else if (purchase == "restoreMonthly"){
//
//            }
            
            
            switch transaction.transactionState{
            case .purchasing: break
            default: queue.finishTransaction(transaction)
            }
        }
    }
}
    
extension SKPaymentTransactionState {
        func status () -> String {
            switch self {
            case .deferred: return "deferred"
            case .failed: return "failed"
            case .purchased: return "purchased"
            case .purchasing: return "purchasing"
            case .restored: return "restored"
            default: return "default"
            }
        
        }
    }

