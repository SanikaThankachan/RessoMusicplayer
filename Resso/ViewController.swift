//
//  ViewController.swift
//  Resso
//
//  Created by Zakkariya K.A on 02/11/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    //let name = ["Best of Me(BTS)","Blood Sweat and       Tears(BTS)","Gangsta(Kehlani)","Good Life(Kehlani)","Life Goes On(Kehlani)"]
   // let pic = ["Bestofme","Bst","Gangsta","Goodlife","lifegoeson"]
    //let music = ["",""]
    let callFile = SecondFile()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        let nib = UINib(nibName: "NewTableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "NewTableViewCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return callFile.list.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewView") as! MusicViewController
        
        vc.img = callFile.list[indexPath.row].imgg
        vc.label = callFile.list[indexPath.row].labll
        vc.song = callFile.list[indexPath.row].songg
        present(vc,animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath) as! NewTableViewCell
        cell.label.text = callFile.list[indexPath.row].labll
        cell.imagevieww.image = UIImage(named: callFile.list[indexPath.row].imgg)

       
        return cell
    }

}

