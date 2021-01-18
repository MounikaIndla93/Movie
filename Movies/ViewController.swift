//
//  ViewController.swift
//  Movies
//
//  Created by PTGHYD on 17/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblViewUpcoming: UITableView!
    
    var arrUpcomimgMovies = [Result]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tblViewUpcoming.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.identifier)
        self.tblViewUpcoming.delegate = self
        self.tblViewUpcoming.dataSource = self
        self.getUpcomimgMovies()
        // Do any additional setup after loading the view.
    }
    
    //MARK:Calling API
    func getUpcomimgMovies(){
        
        let serviceUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=55fa2e730062e71aeb5ecdf958df479b"
        print(serviceUrl)
        
        let urlStr = URL(string: serviceUrl)
        
        URLSession.shared.dataTask(with: urlStr!) { (data, responce, error) in
            
            do{
                if error == nil{
                    
                    let downloadData = try JSONDecoder().decode(ServicesAndProperties.self, from: data!)
                    self.arrUpcomimgMovies = downloadData.results ?? []
                    
                    DispatchQueue.main.async {
                        self.tblViewUpcoming.reloadData()
                    }
                }
                
            }catch{
                print("Something is Wrong")
                
            }
        }.resume()
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrUpcomimgMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewUpcoming.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as! MovieTableViewCell
        let movie = self.arrUpcomimgMovies[indexPath.row]
        cell.lblTitleMovie.text = movie.originalTitle ?? movie.title
        cell.lblLanguage.text = movie.originalLanguage ?? "en"
        cell.lblReleaseDate.text = movie.releaseDate
        cell.lblVoteCount.text = "\(movie.popularity ?? 0)"

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsVC.movieTitle = self.arrUpcomimgMovies[indexPath.row].title ?? ""
        detailsVC.overview = self.arrUpcomimgMovies[indexPath.row].overview ?? ""
        detailsVC.popularity = "\(self.arrUpcomimgMovies[indexPath.row].popularity ?? 0)"
        detailsVC.header = "Upcoming Movie"

        navigationController?.pushViewController(detailsVC, animated: true)

        self.tblViewUpcoming.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
}


