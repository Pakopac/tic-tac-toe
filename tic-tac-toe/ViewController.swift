//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by SUPINT_12 on 18/06/2019.
//  Copyright © 2019 SUPINT_12. All rights reserved.
//

import UIKit
//import SocketIO

class ViewController: UIViewController {
    
    let socketManager = TTTSocketWrapper.shared
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBAction func onlineButton(_ sender: Any) {
        //socketManager.socket.emit("join_queue", "oui")
        
        let alert = UIAlertController(title: "Nom", message: "", preferredStyle: .alert)
        
    
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            self.loader.startAnimating()
            let textField = alert?.textFields![0]
            self.socketManager.socket.emit("join_queue", (textField?.text)!)
            self.socketManager.socket.on("join_game") {data, ack in
                print(ack)
                
                self.performSegue(withIdentifier: "SegueOnline", sender: data)
        
            
            }

        }))
        
        self.present(alert, animated: true, completion: nil)
        
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueOnline") {
            let data = sender as! [[String: Any]]
            let OnlineViewController = segue.destination as! OnlineViewController
            OnlineViewController.board = data[0]["grid"] as? [Any]
            OnlineViewController.playerO = data[0]["playerO"] as? String
            OnlineViewController.playerX = data[0]["playerX"] as? String
            OnlineViewController.currentTurn = data[0]["currentTurn"] as? String
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

