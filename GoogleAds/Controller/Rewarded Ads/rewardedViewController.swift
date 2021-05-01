//
//  rewardedViewController.swift
//  GoogleAds
//
//  Created by Adsum MAC 3 on 30/04/21.
//

import UIKit
import GoogleMobileAds

class rewardedViewController: UIViewController {
    
    private var rewardedAd: GADRewardedAd?
    @IBOutlet weak var rewardLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadRewardedAd()
    }
    
    func loadRewardedAd() {
        let request = GADRequest()
        GADRewardedAd.load(
            withAdUnitID: "ca-app-pub-3940256099942544/1712485313",
            request: request,
            completionHandler: { [self] ad, error in
                if let error = error {
                    print("Rewarded ad failed to load with error: \(error.localizedDescription)")
                    return
                }
                rewardedAd = ad
                print("Rewarded ad loaded.")
            })
    }
    
    @IBAction func playVideoAd(_ sender: UIButton) {
        show()
    }
    
    func show() {
        if (rewardedAd != nil) {
            rewardedAd!.present(
                fromRootViewController: self,
                userDidEarnRewardHandler: { [self] in
                    let reward = rewardedAd!.adReward
                    // TODO: Reward the user!
                    print(reward)
                })
        } else {
            print("Ad wasn't ready")
        }
    }
    
}

extension rewardedViewController : GADFullScreenContentDelegate{
    
    func ad(_ ad: GADFullScreenPresentingAd,didFailToPresentFullScreenContentWithError error: Error) {
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
