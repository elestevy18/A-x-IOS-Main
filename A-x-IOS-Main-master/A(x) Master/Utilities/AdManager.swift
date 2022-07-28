////TODO In the future abstract the loading and presenting of ads to a class
////  AdManager.swift
////  AofX
////
////  Created by Kevin Jimenez on 10/13/21.
////  Copyright © 2021 Aesthet(X). All rights reserved.



































//
//import Foundation
//import GoogleMobileAds
//import UIKit
//
//
//class AdManager: NSObject {
//
////    struct Constants{
////        static let volumeAD = "ca-app-pub-3950672419252348/8930486777"
////    }
//
//
//    let defaults        = UserDefaults.standard
//    var installDate: Date?
//    var interstitialAd: GADInterstitialAd?
//    var annual = false
//    var biannual = false
//    var monthly = false
//    var hsPromo = false
//    var premium = false
//    var adID: String
//
//    init(adID: String) {
//
//        installDate = defaults.object(forKey: Save.installDate) as? Date
//        annual = defaults.bool(forKey: Save.annualPurchased)
//        biannual = defaults.bool(forKey: Save.biannualPurchased)
//        monthly = defaults.bool(forKey: Save.monthlyPurchased)
//        hsPromo = defaults.bool(forKey: Save.HSPromo)
//        self.adID = adID
//        //TODO MAKE SURE THAT DEFAULTS IS ACTUALLY BEINMG CALLED
//    }
//
//    func loadAdInfo(request: GADRequest) {
//       // interstitialAd = createAd()
//        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
//                               request: request,
//                               completionHandler: { [self] ad, error in
//            if let error = error {
//                //print("Failed to load interstitial ad with error: \(error.localizedDescription)")
//                return
//            }
//            interstitial = ad
//        }
//        )
//
//            //Retrieve info for premium And SHOWADS
//        premium = annual || biannual || monthly || hsPromo
//        if (hsPromo && !(premium)){
//            var promoLength = defaults.double(forKey: Save.promoLength)
//                // //print("CALCULATING HS PROMO LENGTH" + String(promoLength))
//            promoLength = promoLength * 31536000
//            installDate = defaults.object(forKey: Save.installDate) as? Date
//            let expDate = installDate?.addingTimeInterval(promoLength) ?? Date()
//            if( Date() > expDate){
//                    //print("hspromo is flase now due to expiration. Date is:" )
//                defaults.set(false, forKey: Save.HSPromo)
//            }
//        }
//    }
//
////    private func createAd() -> GADInterstitial? {
////        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
////                               request: request,
////                               completionHandler: { [self] ad, error in
////            if let error = error {
////                //print("Failed to load interstitial ad with error: \(error.localizedDescription)")
////                return
////            }
////            interstitial = ad
////        }
////        )
////        //TODO check if the ad is being loaded AKA not nil
////    }
////
//
//    //This isprolly wrong. Call from preseting VC and pass in presentedVC
//    func displayAd(destinationVC: UIViewController) {
//        DispatchQueue.main.async {
//            let x = 3// Int.random(in: 0..<10)
//                //print(" ADS CALCULATED VALUES: " + String(annual) + String(biannual) + String(monthly) + String(hsPromo))
//            if self.interstitialAd?.isReady ==  true && !self.premium && (x % 3 == 0 ){
//                    //print ("adIsDisplaying")
//                self.interstitialAd?.present(fromRootViewController: destinationVC)
//            }
//        }
//    }
//
//
//
//}
//
//
//extension AdManager: GADInterstitialDelegate {
//    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
//        interstitialAd = createAd()
//    }
//    }
//
//
//
////FIND OUT WHERE interstitialDidDismissScreen IS BEING CALLED TO CALLE IT IN THE ORIGIN VC
////--------
////Retrieve info for premium And SHOWADS
////from history viewcontroller
////let annual = defaults.bool(forKey: Save.annualPurchased)
////let biannual = defaults.bool(forKey: Save.biannualPurchased)
////let monthly = defaults.bool(forKey: Save.monthlyPurchased)
////let hsPromo = defaults.bool(forKey: Save.HSPromo)
////
////    //TODO logic to see if promo is expired
////
////if (hsPromo){
////    var promoLength = defaults.double(forKey: Save.promoLength)
////    promoLength = promoLength * 31536000
////
////    installDate = defaults.object(forKey: Save.installDate) as! Date
////    let expDate = installDate.addingTimeInterval(promoLength)
////    if( Date() < expDate){
////        defaults.set(false, forKey: Save.HSPromo)
////    }
////
////}
////
////
////
////
////let premium = annual || biannual || monthly || hsPromo
////let x = Int.random(in: 0..<10)
////
////
////if interstitialAd?.isReady ==  true && !premium && (x % 2 == 0 ){
////    interstitialAd?.present(fromRootViewController: self)
////}
//
//
////---------------From volumetrackervc
//
//    //Retrieve info for premium And SHOWADS
////let annual = defaults.bool(forKey: Save.annualPurchased)
////let biannual = defaults.bool(forKey: Save.biannualPurchased)
////let monthly = defaults.bool(forKey: Save.monthlyPurchased)
////let hsPromo = defaults.bool(forKey: Save.HSPromo)
////let premium = annual || biannual || monthly || hsPromo
////
////if (hsPromo && !(premium)){
////    var promoLength = defaults.double(forKey: Save.promoLength)
////        // //print("CALCULATING HS PROMO LENGTH" + String(promoLength))
////    promoLength = promoLength * 31536000
////    installDate = defaults.object(forKey: Save.installDate) as! Date
////    let expDate = installDate.addingTimeInterval(promoLength)
////    if( Date() > expDate){
////            //print("hspromo is flase now due to expiration. Date is:" )
////        defaults.set(false, forKey: Save.HSPromo)
////    }
////}
////
////let x = Int.random(in: 1..<12)
////print(x)
////    //print(" ADS CALCULATED VALUES: " + String(annual) + String(biannual) + String(monthly) + String(hsPromo))
////if interstitialAd?.isReady ==  true && !premium && (x % 3 == 0 ){
////    interstitialAd?.present(fromRootViewController: self)
////} else
//
