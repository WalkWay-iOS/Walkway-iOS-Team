//
//  cellPresentDelegate.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import Foundation

protocol cellPresentDelegate: class {
    func cellTapedPopularCourse()
    func cellTapedBookmarkCourse()
    func cellTapedLatestCourse()
    func collectionViewCellTapedCourse(dvc: CourseDetailVC)
    func collectionViewCellTapedFollower(dvc: FollowerVC)
    func collectionViewCellTapedBanner(dvc: BannerVC)
}
