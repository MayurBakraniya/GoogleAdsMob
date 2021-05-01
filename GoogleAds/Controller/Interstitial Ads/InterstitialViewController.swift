//
//  InterstitialViewController.swift
//  GoogleAds
//
//  Created by Adsum MAC 3 on 30/04/21.
//

import UIKit
import GoogleMobileAds

class InterstitialViewController: UIViewController {
    
    private var interstitial: GADInterstitialAd!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",request: request,completionHandler: { [self] ad, error in
                if let error = error {
                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                    return
                }
                interstitial = ad
                interstitial?.fullScreenContentDelegate = self
            }
        )
    }
    
    @IBAction func doSomething(_ sender: Any) {
      if interstitial != nil {
        interstitial.present(fromRootViewController: self)
      } else {
        print("Ad wasn't ready")
      }
    }

}

extension InterstitialViewController : GADFullScreenContentDelegate{
    
    /// Tells the delegate that the ad failed to present full screen content.
      func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
      }

      /// Tells the delegate that the ad presented full screen content.
      func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did present full screen content.")
      }

      /// Tells the delegate that the ad dismissed full screen content.
      func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
      }
    
}
