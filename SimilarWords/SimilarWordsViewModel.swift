//
//  SimilarWordsViewModel.swift
//  SimilarWords
//
//  Created by Emad Abdulrahim on 8/23/20.
//  Copyright © 2020 Emad Abdulrahim. All rights reserved.
//

import Foundation
import NaturalLanguage

class SimilarWordsViewModel: ObservableObject {
  @Published var similarWords: [(String, NLDistance)] = [("", 0.0)]
  @Published var targetWord: String = "" {
    didSet {
      findSimilarWords(targetWord: targetWord)
    }
  }
  
  func findSimilarWords(targetWord: String) {
    if let embedding = NLEmbedding.wordEmbedding(for: .english) {
      similarWords = embedding.neighbors(for: targetWord.lowercased(), maximumCount: 20).sorted(by: {$0.1 > $1.1})
      
      for word in similarWords {
          print("\(word.0) has a distance of \(word.1)")
      }
    }
  }
}
