//
//  CourseSearchVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/20.
//

import UIKit

var trendyCourseName = ["관악산 초급 코스", "관악산 중급 코스", "관악산 고급 코스", "관악산 초급 코스"]
//var courseImage
var trendyCourseDistance = ["6km", "8km", "10km", "6km"]
var trendyCourseTime = ["1시간30분", "1시간 50분", "2시간", "1시간 20분"]
var trendyCourseStar = ["4.95", "3.9", "3.85", "4.2"]

var bookmarkCourseName = ["관악산 달빛 둘레길", "숙명여대 효창공원 둘레길", "남산 둘레길"]
//var courseImage
var bookmarkCourseDistance = ["4km", "3km", "7km"]
var bookmarkCourseTime = ["1시간20분", "1시간 40분", "2시간"]
var bookmarkCourseStar = ["3.9", "4.9", "4.2"]

var followCourseName = ["남산 초급 코스", "관악산 달빛 둘레길"]
//var courseImage
var followCourseDistance = ["3km", "5km"]
var followCourseTime = ["1시간15분", "1시간 20분"]
var followCourseStar = ["2.4", "4.1"]

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
    
    var isTrendy = false
    var isBookmark = false
    var isFollow = false
    
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
        btnTrend.layer.cornerRadius = 13
        btnTrend.layer.borderWidth = 1.0
        btnTrend.layer.borderColor = UIColor.gray.cgColor
        btnTrend.layer.borderWidth = 0.5
        
        btnBookmark.layer.cornerRadius = 13
        btnBookmark.layer.borderWidth = 1.0
        btnBookmark.layer.borderColor = UIColor.gray.cgColor
        btnBookmark.layer.borderWidth = 0.5
        
        btnFollow.layer.cornerRadius = 13
        btnFollow.layer.borderWidth = 1.0
        btnFollow.layer.borderColor = UIColor.gray.cgColor
        btnFollow.layer.borderWidth = 0.5
    }
    
    func setNoSearching() {
        //imgNoSearchingLogo.image = ""
        lblInfoView.text = "검색어 입력 혹은 해시태그를 선택해주세요"
        btnKeyword1.isHidden = true
        btnKeyword2.isHidden = true
        btnKeyword3.isHidden = true
        btnKeyword4.isHidden = true
        btnKeyword5.isHidden = true
        
        courseListTableView.isHidden = true
    }
    
    
    @IBAction func btnSearchTrend(_ sender: UIButton) {
        courseListTableView.isHidden = false
        isTrendy = true
        isBookmark = false
        isFollow = false
        
        courseListTableView.reloadData()
        
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
        courseListTableView.isHidden = false
        isTrendy = false
        isBookmark = true
        isFollow = false
        
        courseListTableView.reloadData()
        
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
        courseListTableView.isHidden = false
        isTrendy = false
        isBookmark = false
        isFollow = true

        courseListTableView.reloadData()
        
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
        if isTrendy {
            return trendyCourseName.count
        }
        else if isBookmark {
            return bookmarkCourseName.count
        }
        else {
            return followCourseName.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseListTVC.identifier, for: indexPath) as? CourseListTVC else {
            return UITableViewCell()
        }
        if isTrendy {
            cell.setData(course: trendyCourseName[indexPath.row], distance: trendyCourseDistance[indexPath.row], time: trendyCourseTime[indexPath.row], rate: trendyCourseStar[indexPath.row])
        }
        else if isBookmark {
            cell.setData(course: bookmarkCourseName[indexPath.row], distance: bookmarkCourseDistance[indexPath.row], time: bookmarkCourseTime[indexPath.row], rate: bookmarkCourseStar[indexPath.row])
        }
        else {
            cell.setData(course: followCourseName[indexPath.row], distance: followCourseDistance[indexPath.row], time: followCourseTime[indexPath.row], rate: followCourseStar[indexPath.row])
        }
        return cell
    }
}

extension CourseSearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
