//
//  QuizApp.swift
//  Quiz
//
//  Created by jaemin park on 2022/03/20.
//

import SwiftUI
import Firebase

@main
struct QuizApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
