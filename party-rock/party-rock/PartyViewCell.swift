//
//  PartyViewCell.swift
//  party-rock
//
//  Created by Yuen Hsi Chang on 1/6/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class PartyViewCell: UITableViewCell {

    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songPreviewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(partyRock: PartyRock) {
        songTitle.text = partyRock.songTitle
        let url = URL(string: partyRock.songImageURL)!
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.songPreviewImage.image = UIImage(data: data)
                }
            }
            catch {
                
            }
        }
    }

}
