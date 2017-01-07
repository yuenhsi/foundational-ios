//
//  VideoVC.swift
//  party-rock
//
//  Created by Yuen Hsi Chang on 1/6/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = partyRock.songTitle
        webView.loadHTMLString(partyRock.songVideoURL, baseURL: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
