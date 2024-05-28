//
//  ViewController.swift
//  TableView
//
//  Created by 김승원 on 5/28/24.
//

import UIKit

class ViewController: UIViewController {
    var movieDataManager = DataManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = 120 // 셀의 높이
        
        tableView.delegate = self
        
        self.title = "Movies"
        
        // 데이터 생성
        movieDataManager.makeMovieData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        movieDataManager.updateMovieData()
        // 데이터가 추가가 되면 TableView 리로드 필수!!
        tableView.reloadData()
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    // MARK: - UITabelView 필수적 구현 사항
    // 몇 개의 컨텐츠를 표시할지 (그룹의 행의 개수)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        let movieArray = movieDataManager.getMovieData()
        let movieCount = movieArray.count
        return movieCount
    }
    
    // 몇 번째에 있는 셀은 어떤 식으로 표현할지 (구체적으로 셀의 형태를 리턴)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        // 기존에 만들어놨던 셀을 deque(꺼낸다)
        // (힙에 올라간)재사용 가능한 cell을 꺼내서 사용하는 매서드 (애플이 이미 잘 만들어 놓음)
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell",
                                                 for: indexPath) // indexPath : 몇 번째 행에 있는 셀을 꺼낼 건지
                                                    as! MovieCell // MovieCell로 타입캐스팅하여 사용 (원래는 UITableViewCell로 나옴)
        // 애플이 미리 만들어놓은 셀 타입인 UITableViewCell인데, 우리가 만들어놓은 MovieCell타입으로 타입캐스팅
        
        // 현재 cell에 MovieCell이 담겨있다
        // indexPath.section => 테이블 뷰 그룹 (그룹에 번호)
        // indexPath.row => 정확한 행, 몇 번째 셀인지 (그룹 내에서의 행의 번호)
        /*
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
         */
        let movieArray = movieDataManager.getMovieData()
        let movie = movieArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        
        cell.selectionStyle = .none
        
        return cell
    }
}

// TabelView안에서 디테일한 행동들을 전달 받기 위해
extension ViewController: UITableViewDelegate {
    // TabelView 어떤 특정한 셀이(indexPath번째 셀이) 선택이 되었을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 다음 뷰로 넘어가
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let movieArray = movieDataManager.getMovieData()
            
            // 이 함수에 indexPath가 없기 때문에
            // 위 함수에서 sender를 통해 indexPath를 전달하고
            // 이 함수에서 sender에 있는 indexPath를 타입캐스팅하여 사용
            let indexPath = sender as! IndexPath
            detailVC.movieData = movieArray[indexPath.row]
        }
    }
}
