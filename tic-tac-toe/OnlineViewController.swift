//
//  OnlineViewController.swift
//  tic-tac-toe
//
//  Created by SUP'Internet 02 on 28/06/2019.
//  Copyright © 2019 SUPINT_12. All rights reserved.
//

import UIKit

class OnlineViewController: UIViewController {
    
    let socketManager = TTTSocketWrapper.shared
    
    var name = (Any).self
    var board : [Any]?
    var playerO : String?
    var playerX : String?
    var currentTurn : String?
    
    @IBOutlet weak var playerOlabel: UILabel!
    @IBOutlet weak var playerXlabel: UILabel!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
 
    @IBAction func btnOnline(_ sender: Any) {
        let button = (sender as! UIButton)
        self.socketManager.socket.emit("movement", button.tag)
        
        self.socketManager.socket.on("movement") {data, ack in
            var data = data as! [[String: Any]]
            if(!(((data[0]["err"] as? String) != nil))){
                let grid = data[0]["grid"] as? [Any]
                print(grid)
                
                for (index, element) in (grid?.enumerated())! {
                    
                    if(index == button.tag){
                        
                    
                        if(data[0]["index"] as! Int == 0){
                           data[0]["index"] = 99
                        }
                        
                        if let number = element as? Int {
                            if (number == 0) {
                                
                            }
                        }
                        
                        if let letter = element as? String {
                            print(grid)
                            print(data[0]["index"])
                            print(letter)
                            print(letter == "x")
                            if(letter == "x"){
                                let thisButton = self.view.viewWithTag(data[0]["index"] as! Int) as? UIButton
                                print(thisButton)
                                thisButton?.setBackgroundImage(UIImage(named: "cross.jpg"), for: UIControlState.normal)
                            }
                            else if(letter == "o"){
                                let thisButton = self.view.viewWithTag(data[0]["index"] as! Int) as? UIButton
                                print(thisButton)
                                thisButton?.setBackgroundImage(UIImage(named: "circle.png"), for: UIControlState.normal)
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOlabel.text = "player O: " + self.playerO!
        playerXlabel.text = "player X: " + self.playerX!
        currentPlayerLabel.text = "Current Turn: player " + self.currentTurn!
        
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
