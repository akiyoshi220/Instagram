//
//  AddCommentViewController.swift
//  Instagram
//
//  Created by akiyoshi220 on 2021/07/27.
//

import UIKit
import Firebase
import SVProgressHUD

class AddCommentViewController: UIViewController {
    
    var postData: PostData!

    @IBOutlet weak var commentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleRegistButton(_ sender: Any) {
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        if let name = Auth.auth().currentUser?.displayName {
            let comment:String = commentField.text!
            let cm = ["name": name, "comment": comment]
            
            postRef.updateData(["comments": FieldValue.arrayUnion([cm])])
        }

        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメント投稿しました")
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
