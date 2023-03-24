//
//  ContentView.swift
//  HackerNews
//
//  Created by Shashwat Panda on 23/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        VStack {
            NavigationView{
                List(networkManager.posts){post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                    
                }
                .navigationTitle("HackerNews")
            }
            .onAppear{self.networkManager.fetcData()}
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



