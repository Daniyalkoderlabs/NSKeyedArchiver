//
//  ViewController.swift
//  NSKeyedArchiver
//
//  Created by Daniyal Yousuf on 3/15/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    var viewLoader : UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
     //   viewLoader = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
     //   viewLoader.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
      //  self.view.addSubview(viewLoader)
        loader.startAnimating()
        let operationQueue = OperationQueue()
        let operation1 = BlockOperation { [unowned self] in
            self.performWork()
        }
        operation1.qualityOfService = .userInteractive
        operation1.completionBlock = { [unowned self] in
            DispatchQueue.main.async {
                 self.loader.stopAnimating()
            }
           
        }
    
        
        let operation2 = BlockOperation { [unowned self] in
            self.performWork1()
        }
        operation2.qualityOfService = .userInteractive
        operation2.completionBlock = { [unowned self] in
            DispatchQueue.main.async {
                self.loader.stopAnimating()
            }
            
        }
        operationQueue.maxConcurrentOperationCount = 2
        operationQueue.name = "PerformTask1"
        operationQueue.qualityOfService = .userInitiated
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
        
        //--------------------------------------------------
        let operationQueue2 = OperationQueue()
        let operation12 = BlockOperation { [unowned self] in
            self.performWork2()
        }
        operation12.qualityOfService = .userInteractive
        operation12.completionBlock = { [unowned self] in
            DispatchQueue.main.async { //Queue2
                self.loader.stopAnimating()
            }
            
        }
        
        
        let operation22 = BlockOperation { [unowned self] in
            self.performWork3()
        }
        operation22.qualityOfService = .userInteractive
        operation22.completionBlock = { [unowned self] in
            DispatchQueue.main.async {//Queue2 
                self.loader.stopAnimating()
            }
            
        }
        operationQueue2.maxConcurrentOperationCount = 2
        operationQueue2.name = "PerformTask2"
        operationQueue2.qualityOfService = .userInteractive
        operationQueue2.addOperation(operation12)
        operationQueue2.addOperation(operation22)
        
        
        
        
        /*DispatchQueue.global(qos: .utility).async { [unowned self] in
            self.performWork()
            DispatchQueue.main.async {
                self.loader.stopAnimating()
            }
        }
        DispatchQueue.global(qos: .unspecified).async {
            self.performWork3()
            DispatchQueue.main.async {
                self.loader.stopAnimating()
            }
        }
        DispatchQueue.global(qos:.userInteractive).async { [unowned self] in
            self.performWork1()
            DispatchQueue.main.async {
                self.loader.stopAnimating()
            }
        }
        DispatchQueue.global(qos: .userInitiated).async {
            self.performWork2()
            DispatchQueue.main.async {
                self.loader.stopAnimating()
            }
        }*/
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func performWork() {
        let n = 500
        var matrix = Array(repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = i + j
                print("dani")
            }
        }
    }
    func performWork1() {
        let n = 500
        var matrix = Array(repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = i + j
                print("you")
            }
        }
    }
    
    func performWork2() {
        let n = 500
        var matrix = Array(repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = i + j
                print("nabel")
            }
        }
    }
    func performWork3() {
        let n = 500
        var matrix = Array(repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = i + j
                print("nehal")
            }
        }
    }
}

