//
//  AddStudentVC.swift
//  ormanSchools
//
//  Created by zoza on 18/09/2018.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit

class AddStudentVC: BaseSideVC ,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var studentArray: [Students] = []
    let pId = UserStore.loadUser()?.parentId as! Int
    
    @IBOutlet weak var stdntNamTxtF: MainTextField!
    @IBOutlet weak var stdntIdTxtF: MainTextField!
    @IBOutlet weak var collecttionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collecttionView.dataSource = self
        collecttionView.delegate = self
        //let pId = UserStore.loadUser()?.parentId
        startAnimating()
        API.init().getStudent(parentId: pId ?? 0)
        {(done ,students) in
            if done {
                self.studentArray = students
                self.stopAnimating()
                self.collecttionView.reloadData()
            }else{
                self.stopAnimating()
            }
            
        }


    }

    
    @IBAction func addStdntBtnActn(_ sender: UIButton) {
        guard let name = stdntNamTxtF.text, !name.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        guard let id = stdntIdTxtF.text, !id.isEmpty else {
            showAlert("Please fill all fields", "Warning")
            return
        }
        
        startAnimating()
        API.init().addStudent(userName: name, passWord: id, parentId: pId ?? 0)
        {(done) in
            if done {
                print("student added")
                self.showAlert("Student is added Successfully", "Success")
                API.init().getStudent(parentId: self.pId ?? 0)
                {(done ,sttudents) in
                    if done {
                        self.studentArray = sttudents
                        self.stopAnimating()
                        self.collecttionView.reloadData()
                    }else{
                        self.stopAnimating()
                    }
                    
                }

            }
            else {
                self.showAlert("Enter valid user data", "Warning")
                self.stopAnimating()
                return
            }

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? StudentsCell
            else {
                return UICollectionViewCell()
        }
        cell.name.text = studentArray[indexPath.row].StudentName ?? ""
        cell.delete.tag = indexPath.row
        cell.delete.addTarget(self, action: #selector(delettStudent), for: .touchUpInside)
        return cell
    }
    @objc func delettStudent(_ sender : UIButton){
        startAnimating()
        API.init().deletStudent(parentId: pId ?? 0 , studentId: studentArray[sender.tag].StudentId ?? 0) { (done) in
            if done {
                self.studentArray.remove(at: sender.tag)
                self.collecttionView.reloadData()
                self.stopAnimating()
            }
        }
    }
    
    

    
    
}
