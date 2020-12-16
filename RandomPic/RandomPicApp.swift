//
//  RandomPicApp.swift
//  RandomPic
//
//  Created by Lin Bo Rong on 2020/12/16.
//

import SwiftUI

@main
struct RandomPicApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(urlString: "https://picsum.photos/200/300")
        }
    }
}
