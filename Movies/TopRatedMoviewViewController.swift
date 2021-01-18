//
//  TopRatedMoviewViewController.swift
//  Movies
//
//  Created by PTGHYD on 18/01/21.
//

import UIKit

class TopRatedMoviewViewController: UIViewController {
    
    
    
    @IBOutlet weak var tblViewTopRated: UITableView!
    
    var arrTopRatedMovies = [TopRatedResult]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tblViewTopRated.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.identifier)
        self.tblViewTopRated.delegate = self
        self.tblViewTopRated.dataSource = self
        self.getTopRatedMovies()
        // Do any additional setup after loading the view.
    }
    
    
    func getTopRatedMovies(){
        
        let serviceUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=55fa2e730062e71aeb5ecdf958df479b"
        print(serviceUrl)
            
            let urlStr = URL(string: serviceUrl)
            
            URLSession.shared.dataTask(with: urlStr!) { (data, responce, error) in
                
                do{
                    if error == nil{
                        
                        let downloadData = try JSONDecoder().decode(TopRated.self, from: data!)
                        self.arrTopRatedMovies = downloadData.results ?? []
                        
                        DispatchQueue.main.async {
                            self.tblViewTopRated.reloadData()
                        }
                    }
                    
                }catch{
                    print("Something is Wrong")
                    
                }
            }.resume()
    }
    
}

extension TopRatedMoviewViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrTopRatedMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewTopRated.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as! MovieTableViewCell
        let movie = self.arrTopRatedMovies[indexPath.row]
        cell.lblTitleMovie.text = movie.title
        cell.lblLanguage.text = movie.originalLanguage ?? "en"
        cell.lblReleaseDate.text = movie.releaseDate
        cell.lblVoteCount.text = "\(movie.popularity ?? 0)"

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsVC.movieTitle = self.arrTopRatedMovies[indexPath.row].title ?? ""
        detailsVC.overview = self.arrTopRatedMovies[indexPath.row].overview ?? ""
        detailsVC.popularity = "\(self.arrTopRatedMovies[indexPath.row].popularity ?? 0)"
        detailsVC.header = "TopRated Movie"

        navigationController?.pushViewController(detailsVC, animated: true)
        self.tblViewTopRated.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
}


