//
//  ViewController.swift
//  Rebirth-Ex
//
//  Created by Bahadır Kılınç on 2.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    let rebirthedPerson = Rebirther()
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName:"MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        tableView.rowHeight = 46
    }
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let message = messageTextField.text{
            messages.append(Message(sender: "first person", messageText: message))
            let otherMessage = try! rebirthedPerson.prediction(text: message)
            messages.append(Message(sender: "died one", messageText: otherMessage.label))
        }
        tableView.reloadData()
        messageTextField.text = ""
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
        
        let message = messages[indexPath.row]
        
        if message.sender == "first person" {
            cell.label.textAlignment = NSTextAlignment.left
            cell.label.text = message.messageText
        }
        else {
            cell.label.textAlignment = NSTextAlignment.right
            cell.messageView.image = UIImage(named: "MessageFromOther")
            animateTyping(for: cell,with: message.messageText)
        }
        
        return cell
    }
    private func animateTyping(for cell: MessageCell,with message: String){
        var typingText = "Typing"
        
        for i in 0...4 {
            Timer.scheduledTimer(withTimeInterval: 1 * Double(i), repeats: false) { (timer) in
                if i < 4 {
                    cell.label.text = typingText
                    typingText.append(".")
                }else{
                    cell.label.text = message
                }
            }
        }
    }
}

