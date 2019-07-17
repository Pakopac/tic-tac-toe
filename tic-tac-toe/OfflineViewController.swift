//
//  OfflineViewController.swift
//  tic-tac-toe
//
//  Created by SUPINT_12 on 18/06/2019.
//  Copyright © 2019 SUPINT_12. All rights reserved.
//

import UIKit

class OfflineViewController: UIViewController {
    
    var player1 = true
    var player2 = false
    var circle = [Int]()
    var cross = [Int]()
    var all = [Int]()
    

    @IBAction func A1(_ sender: Any) {
        let button = (sender as! UIButton)
        all.append(button.tag)
        if(player1){
            circle.append(button.tag)
            button.setBackgroundImage(UIImage(named: "circle.png"), for: UIControlState.normal)
        }
        if(player2){
            cross.append(button.tag)
            (sender as! UIButton).setBackgroundImage(UIImage(named: "cross.jpg"), for: UIControlState.normal)
        }

        circle.sort()
        cross.sort()
        
        if(win(array: circle)){
            alertWin(winner: "circle", title: "Player 1 won !!")
        }
        if(win(array: cross)){
            alertWin(winner: "cross", title: "Player 2 won !!")
        }
        
        print(all.count)
        if(all.count == 9 && !win(array: cross) && !win(array: circle)){
            alertWin(winner: "draw", title: "Draw")
        }
        
        
        //print(circle)
        //print(cross)
        button.isEnabled = false
        button.adjustsImageWhenDisabled = false
        
        player1 = !player1
        player2 = !player2
    }
  
    func contain(array:Array<Int>, n1: Int, n2: Int, n3: Int) -> Bool{
        return (array.contains(n1) && array.contains(n2) && array.contains(n3))
    }
    
    func win(array: Array<Int>) -> Bool{
        return (contain(array: array, n1: 0,n2: 1,n3: 2) ||
            contain(array: array, n1: 3,n2: 4,n3: 5) ||
            contain(array: array, n1: 6,n2: 7,n3: 8) ||
            contain(array: array, n1: 0,n2: 3,n3: 6) ||
            contain(array: array, n1: 1,n2: 4,n3: 7) ||
            contain(array: array, n1: 2,n2: 5,n3: 8) ||
            contain(array: array, n1: 0,n2: 4,n3: 8) ||
            contain(array: array, n1: 2,n2: 4,n3: 6))
    }
    
    func alertWin(winner: String, title: String){
        let defaults = UserDefaults.standard
        
        defaults.set(defaults.integer(forKey: winner) + 1, forKey: winner)
        
        let message = "\n Player 1: \(defaults.integer(forKey: "circle")) \n Player 2: \(defaults.integer(forKey: "cross")) \n Draw: \(defaults.integer(forKey: "draw"))"
        
        let alert = UIAlertController(title: title, message:message,preferredStyle: .alert)
        let buttonRestart = UIAlertAction(title: "Restart", style: .default, handler: {action in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(buttonRestart)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            
            alert .dismiss(animated: true, completion: nil)
            
            
        }))
        self.present(alert, animated: true)
        
        var historic = defaults.array(forKey: "historic") as! Array<String>
        historic.append(title)
        defaults.set(historic ,forKey: "historic")
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        if(UserDefaults.standard.object(forKey: "historic") == nil){
            let defaults = UserDefaults.standard
            defaults.set([String]() ,forKey: "historic")
        }
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
