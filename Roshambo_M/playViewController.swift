//
//  ViewController.swift
//  Roshambo_M
//
//  Created by Manish Sharma on 8/10/15.
//  Copyright (c) 2015 CelG Mobile LLC. All rights reserved.
//

import UIKit

class playViewController: UIViewController {

    var AppChoice = 0
    
    var selection = (0, 0)
    
    var resultText = ""

    var resultImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func rock(sender: AnyObject) {
        AppChoice = Int(arc4random_uniform(3))
        println("\(AppChoice)")
        selection = (0, AppChoice)
        nextView()
    }
    
    @IBAction func paper(sender: AnyObject) {
        AppChoice = Int(arc4random_uniform(3))
        
        selection = (1, AppChoice)
        nextView()
    }

//    @IBAction func scissors(sender: AnyObject) {
//        AppChoice = Int(arc4random_uniform(3))
//        
//        selection = (2, AppChoice)
//        nextView()
//    }
    
    func nextView() {
        
        switch selection {
            
        case (0, 0):
            println("case 0,0")
            resultImage = 0
            resultText = "It's A Tie!!"
//            toNextView()
            presentView()
        case (0, 1):
            println("case 0, 1")
            resultImage = 1
            resultText = "You Lose! Paper Covers Rock"
//            toNextView()
            presentView()
        case (0, 2):
            println("case 0, 2")
            resultImage = 2
            resultText = "You Win! Rock Crushes Scissors"
//            toNextView()
            presentView()
        case (1, 0):
            println("case 1, 0")
            resultImage = 1
            resultText = "You Win! Paper Covers Rock"
            toNextView()
        case (1, 1):
            println("case 1, 1")
            resultImage = 0
            resultText = "It's A Tie!!"
            toNextView()
        case (1, 2):
            println("case 1, 2")
            resultImage = 3
            resultText = "You Lose! Scissors Cut Paper"
            toNextView()
//        case (2, 0):
//            println("case 2, 0")
//            resultImage = 2
//            resultText = "You Lose! Rock Crushes Scissors"
////            toNextView()
//        case (2, 1):
//            println("case 2, 1")
//            resultImage = 3
//            resultText = "You Win! Scissors Cut Paper"
////            toNextView()
//        case (2, 2):
//            println("case 2, 2")
//            resultImage = 0
//            resultText = "It's A Tie!!"
////            toNextView()
        default:
            println("Another way to present view Controller with error")
        }            
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "result" {
            let controller = segue.destinationViewController as! resultViewController
            controller.text = resultText
            controller.imageNumber = resultImage
        }
        if segue.identifier == "scissor" {
            AppChoice = Int(arc4random_uniform(3))
            selection = (2, AppChoice)
            switch selection {
            case (2, 0):
                println("case 2, 0")
                resultImage = 2
                resultText = "You Lose! Rock Crushes Scissors"
            case (2, 1):
                println("case 2, 1")
                resultImage = 3
                resultText = "You Win! Scissors Cut Paper"
            case (2, 2):
                println("case 2, 2")
                resultImage = 0
                resultText = "It's A Tie!!"
            default:
                println("Another way to present view Controller with error")
            }
            let controller = segue.destinationViewController as! resultViewController
            controller.text = resultText
            controller.imageNumber = resultImage
        }                    
    }
    
    func toNextView() {
        performSegueWithIdentifier("result", sender: self)
    }
    
    func presentView() {
        let vc1 = storyboard!.instantiateViewControllerWithIdentifier("resultViewController") as! resultViewController
        vc1.text = resultText
        vc1.imageNumber = resultImage
//        let vc1: resultViewController = resultViewController()
//        vc1.text = resultText
//        vc1.imageNumber = resultImage
        self.presentViewController(vc1, animated: true, completion: nil)
    }


}

