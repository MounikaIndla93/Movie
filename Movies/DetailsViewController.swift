//
//  DetailsViewController.swift
//  Movies
//
//  Created by PTGHYD on 18/01/21.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverView: UILabel!
    @IBOutlet weak var lblpopularity: UILabel!
    
    var movieTitle:String = ""
    var header:String = ""
    var overview:String = ""
    var popularity:String = ""
    //var title:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblTitle.text = self.movieTitle
        self.lblHeader.text = self.header
        self.lblOverView.text = self.overview
        self.lblpopularity.text = self.popularity

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
