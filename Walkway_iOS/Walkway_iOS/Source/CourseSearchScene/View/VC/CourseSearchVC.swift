//
//  CourseSearchVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit

var courseName = ["관악산 초급 코스", "관악산 중급 코스", "관악산 고급 코스", "관악산 초급 코스"]
//var courseImage
var courseDistance = ["6km", "8km", "10km", "6km"]
var courseTime = ["1시간30분", "1시간 50분", "2시간", "1시간 20분"]
var courseStar = ["4.95", "3.9", "3.85", "4.2"]

class CourseSearchVC: UIViewController {
    
    @IBOutlet var btnUser: UIButton!
    
    @IBOutlet var searchCourseTextField: UITextField!
    
    @IBOutlet var btnTrend: UIButton!
    @IBOutlet var btnBookmark: UIButton!
    @IBOutlet var btnFollow: UIButton!
    
    @IBOutlet var imgNoSearchingLogo: UIImageView!
    @IBOutlet var lblInfoView: UILabel!
    
    @IBOutlet var btnKeyword1: UIButton!
    @IBOutlet var btnKeyword2: UIButton!
    @IBOutlet var btnKeyword3: UIButton!
    @IBOutlet var btnKeyword4: UIButton!
    @IBOutlet var btnKeyword5: UIButton!
    
    @IBOutlet var courseListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        courseListTableView.delegate = self
        courseListTableView.dataSource = self
        
        let nibName = UINib(nibName: "CourseListTVC", bundle: nil)
        courseListTableView.register(nibName, forCellReuseIdentifier: CourseListTVC.identifier)
        
        settingView()
        setCourseSearch()
        setNoSearching()
    }

    func settingView() {
        btnUser.layer.cornerRadius = btnUser.layer.frame.size.width/2
    }
    
    func setCourseSearch() {
        btnTrend.layer.cornerRadius = 10
        btnTrend.layer.borderWidth = 1.0
        btnTrend.layer.borderColor = UIColor.gray.cgColor
        
        btnBookmark.layer.cornerRadius = 10
        btnBookmark.layer.borderWidth = 1.0
        btnBookmark.layer.borderColor = UIColor.gray.cgColor
        
        btnFollow.layer.cornerRadius = 10
        btnFollow.layer.borderWidth = 1.0
        btnFollow.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setNoSearching() {
        //imgNoSearchingLogo.image = ""
        lblInfoView.text = "검색어 입력 혹은 해시태그를 선택해주세요"
        btnKeyword1.isHidden = true
        btnKeyword2.isHidden = true
        btnKeyword3.isHidden = true
        btnKeyword4.isHidden = true
        btnKeyword5.isHidden = true
    }
    
    @IBAction func btnSearchTrend(_ sender: UIButton) {
        btnTrend.backgroundColor = UIColor.systemGray
        btnBookmark.backgroundColor = UIColor.white
        btnFollow.backgroundColor = UIColor.white
        btnKeyword1.isHidden = false
        btnKeyword2.isHidden = false
        btnKeyword3.isHidden = true
        btnKeyword4.isHidden = true
        btnKeyword5.isHidden = true
        btnKeyword1.setTitle("#가벼운산책", for: .normal)
        btnKeyword2.setTitle("#풍경", for: .normal)
    }
    
    @IBAction func btnSearchBookmark(_ sender: UIButton) {
        btnBookmark.backgroundColor = UIColor.systemGray
        btnTrend.backgroundColor = UIColor.white
        btnFollow.backgroundColor = UIColor.white
        btnKeyword1.isHidden = false
        btnKeyword2.isHidden = false
        btnKeyword3.isHidden = false
        btnKeyword4.isHidden = true
        btnKeyword5.isHidden = true
        btnKeyword1.setTitle("#등산코스", for: .normal)
        btnKeyword2.setTitle("#산책코스", for: .normal)
        btnKeyword3.setTitle("#산책코스", for: .normal)
    }
    
    @IBAction func btnSearchFollow(_ sender: UIButton) {
        btnFollow.backgroundColor = UIColor.systemGray
        btnTrend.backgroundColor = UIColor.white
        btnBookmark.backgroundColor = UIColor.white
        btnKeyword1.isHidden = false
        btnKeyword2.isHidden = true
        btnKeyword3.isHidden = true
        btnKeyword4.isHidden = true
        btnKeyword5.isHidden = true
        btnKeyword1.setTitle("#20대인기", for: .normal)
    }
}

extension CourseSearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseListTVC.identifier, for: indexPath) as? CourseListTVC else {
            return UITableViewCell()
        }
        
        cell.courseNameLabel.text = courseName[(indexPath as NSIndexPath).row]
        cell.courseDistanceLabel.text = courseDistance[(indexPath as NSIndexPath).row]
        cell.courseTimeLabel.text = courseTime[(indexPath as NSIndexPath).row]
        cell.courseStarLabel.text = courseStar[(indexPath as NSIndexPath).row]
        return cell
    }
}

extension CourseSearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
