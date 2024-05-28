//
//  ViewController.swift
//  TableView
//
//  Created by 김승원 on 5/28/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    // MARK: - UITabelView 필수적 구현 사항
    // 몇 개의 컨텐츠를 표시할지 (그룹의 행의 개수)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    // 몇 번째에 있는 셀은 어떤 식으로 표현할지 (구체적으로 셀의 형태를 리턴)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }


}

