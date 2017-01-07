//
//  ViewController.swift
//  party-rock
//
//  Created by Yuen Hsi Chang on 1/6/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRockData = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        partyRockData.append(PartyRock(songTitle: "i love u dear", songImageURL: "http://thecircular.org/wp-content/uploads/2014/03/VENNU.jpg", songVideoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/hKtjGr0lGe8\" frameborder=\"0\" allowfullscreen></iframe>"))
        partyRockData.append(PartyRock(songTitle: "its my life", songImageURL: "http://www.gratenews.com/wordpress/wp-content/uploads/2014/07/Vennu-Mallesh.jpg", songVideoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kJa2kwoZ2a4\" frameborder=\"0\" allowfullscreen></iframe>"))
        partyRockData.append(PartyRock(songTitle: "united india", songImageURL: "https://bandwagon-gig-finder.s3.amazonaws.com/editorials/uploads/article/19/530295_362506387178059_1592108944_n.jpeg.scaled999.jpg", songVideoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/T_0BgTyeyGY\" frameborder=\"0\" allowfullscreen></iframe>"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyViewCell") as? PartyViewCell {
            cell.updateUI(partyRock: partyRockData[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRockData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "VideoVC", sender: partyRockData[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let partyData = sender as? PartyRock {
                destination.partyRock = partyData
            }
        }
    }
}

