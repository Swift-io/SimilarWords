//
//  HomeView.swift
//  SimilarWords
//
//  Created by Emad Abdulrahim on 8/23/20.
//  Copyright © 2020 Emad Abdulrahim. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
  @EnvironmentObject var wordsViewModel: SimilarWordsViewModel
  
  
  var body: some View {
    TextField("Search ...", text: $wordsViewModel.targetWord)
      .padding(8)
      .padding(.horizontal, 24)
      .background(Color(.systemGray6))
      .cornerRadius(8)
      .overlay(
        HStack {
          Image(systemName: "magnifyingglass")
            .foregroundColor(.gray)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
        }
    )
      .padding(.horizontal, 10)
  }
}

struct HomeView: View {
  @EnvironmentObject var wordsViewModel: SimilarWordsViewModel
  
  func mapProximityToOpacity(value: Double) -> Double {
    let ProximityRange = 1.0 - 0.7
    let OpacityRange = 1.0 - 0.15
    let opacity = ((value - 0.7) * OpacityRange / ProximityRange) + 0.1
    
    return opacity
  }
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar()
        Spacer()
        List {
          ForEach(wordsViewModel.similarWords, id: \.0) { w in
            Text(w.0)
              .font(.subheadline)
              .foregroundColor(Color(.sRGB, red: 89 / 255, green: 52 / 255, blue: 228 / 255, opacity: self.mapProximityToOpacity(value: w.1)))
          }
        }
      }
    .navigationBarTitle("Related Words")
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
