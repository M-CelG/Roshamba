//
//  resultViewController.swift
//  Roshambo_M
//
//  Created by Manish Sharma on 8/11/15.
//  Copyright (c) 2015 CelG Mobile LLC. All rights reserved.
//

import Foundation
import UIKit

class resultViewController: UIViewController {

    var text = ""
    var imageNumber:Int!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var message: UILabel!
    
    override func viewWillAppear(animated: Bool) {
   
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let imageNumber = self.imageNumber {
            switch imageNumber {
            case 0:
                imageView.image = UIImage(named: "itsATie")
                message.text = text
            case 1:
                imageView.image = UIImage(named: "PaperCoverRock")
                message.text = text
            case 2:
                imageView.image = UIImage(named: "RockCrushesScissors")
                message.text = text
            case 3:
                imageView.image = UIImage(named: "ScissorsCutPaper")
                message.text = text
            default:
                imageView.image = UIImage(named: "itsATie")
            }
            
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
//        
//        if let imageNumber = self.imageNumber {
//            switch imageNumber {
//            case 0:
//                imageView.image = UIImage(named: "itsATie")
//                message.text = text
//            case 1:
//                imageView.image = UIImage(named: "PaperCoverRock")
//                message.text = text
//            case 2:
//                imageView.image = UIImage(named: "RockCrushesScissors")
//                message.text = text
//            case 3:
//                imageView.image = UIImage(named: "ScissorsCutPaper")
//                message.text = text
//            default:
//                imageView.image = UIImage(named: "itsATie")
//            }
//        
//        }

        UIView.animateWithDuration(0.3) {
            self.imageView.alpha = 1
        }
    }
    
    @IBAction func back(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

