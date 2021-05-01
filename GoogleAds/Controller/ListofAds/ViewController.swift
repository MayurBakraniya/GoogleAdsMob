//
//  ViewController.swift
//  GoogleAds
//
//  Created by Adsum MAC 3 on 30/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var AdsArr = ["Banner Ads","Interstitial Ads","Native Ads","Rewarded Ads"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableSetup()
    }
    
    // MARK: TableSetup
    func tableSetup(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .clear
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AdsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.lbl.text = AdsArr[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detail:bannerViewController = storyboard.instantiateViewController(withIdentifier: "bannerViewController") as! bannerViewController
            self.navigationController?.pushViewController(detail, animated: true)
        }else if indexPath.row == 1{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detail:InterstitialViewController = storyboard.instantiateViewController(withIdentifier: "InterstitialViewController") as! InterstitialViewController
            self.navigationController?.pushViewController(detail, animated: true)
        }else if indexPath.row == 2{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detail:nativeViewController = storyboard.instantiateViewController(withIdentifier: "nativeViewController") as! nativeViewController
            self.navigationController?.pushViewController(detail, animated: true)
        }else if indexPath.row == 3{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detail:rewardedViewController = storyboard.instantiateViewController(withIdentifier: "rewardedViewController") as! rewardedViewController
            self.navigationController?.pushViewController(detail, animated: true)
        }
    }
}
