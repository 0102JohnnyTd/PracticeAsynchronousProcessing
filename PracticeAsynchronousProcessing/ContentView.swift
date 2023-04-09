//
//  ContentView.swift
//  PracticeAsynchronousProcessing
//
//  Created by Johnny Toda on 2023/04/07.
//

import SwiftUI

struct ContentView: View {
    // ViewModelのインスタンスを生成
    @StateObject var qiitaListViewModel = QiitaListViewModel()

    var body: some View {
        List(qiitaListViewModel.articlesList) {
            Text($0.title)
        }
        .onAppear(perform: qiitaListViewModel.onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
