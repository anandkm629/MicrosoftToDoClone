//
//  AppDelegateHelper.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 03/06/24.
//
import UIKit
import Foundation

class AppDelegateHelper {
    static let shared = AppDelegateHelper()

    private init() {}

    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

