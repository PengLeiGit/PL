//
//  PLAppStore.swift
//  HealthXK
//
//  Created by 彭磊 on 2019/4/4.
//

import UIKit

public class PLAppStore: NSObject {
    /*
     * 去App Store评分
     * @param AppID: app的ID
     */
    public static func toScore(_ AppID: String) {
        let urlStr = "itms-apps://itunes.apple.com/app/id\(AppID)?action=write-review"
        UIApplication.shared.openURL(URL.init(string: urlStr)!)
    }
    
    /*
     * 去App Store下载
     */
    public static func toUpdate(_ AppID: String) {
        let urlStr = "itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=\(AppID)"
        UIApplication.shared.openURL(URL.init(string: urlStr)!)
    }
}
