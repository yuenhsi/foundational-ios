//
//  ViewController.swift
//  page-the-scroll
//
//  Created by Yuen Hsi Chang on 1/5/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var contentWidth: CGFloat = 0
        let scrollWidth = scrollView.frame.width
        
        for x in 0 ... 2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            let newX = scrollWidth / 2 + (CGFloat(x) * scrollWidth)
            imageView.frame = CGRect(x: newX - 75, y: view.frame.midY - 75, width: 150, height: 150)
            contentWidth += scrollWidth
            scrollView.addSubview(imageView)
            scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
            scrollView.clipsToBounds = false
        }
    }
}

