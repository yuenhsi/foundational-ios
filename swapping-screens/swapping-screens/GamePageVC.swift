//
//  gamePageVC.swift
//  swapping-screens
//
//  Created by Yuen Hsi Chang on 1/5/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class GamePageVC: UIViewController {

    @IBOutlet weak var gameLabel: UILabel!
    
    private var _game: String!
    
    var game: String {
        get {
            return _game
        } set {
            _game = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameLabel.text = "Loading \(_game!)..."
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
