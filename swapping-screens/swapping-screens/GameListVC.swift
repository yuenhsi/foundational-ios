//
//  GameListVC.swift
//  swapping-screens
//
//  Created by Yuen Hsi Chang on 1/5/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class GameListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func loadBtnPressed(_ sender: Any) {
        let game = "dotes"
        performSegue(withIdentifier: "gamePageVC", sender: game)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GamePageVC {
            if let game = sender as? String {
                destination.game = game
            }
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
