//
//  HomeView.swift
//  task
//
//  Created by ToThang on 10/27/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var noteViewModel: NoteViewModel
    
    func fetchListNote() {
        noteViewModel.getListNote()
    }
    
    var body: some View {
        GeometryReader {_ in 
            VStack {
                Text("Hello, World!")
                Divider()
                List {
                    ForEach(0 ..< noteViewModel.listNote.count,  id: \.self) { i in
                        ItemCellNoteList(title: noteViewModel.listNote[i].title ?? "", isFavorite: noteViewModel.listNote[i].isFavorite ?? false)
                    }
                }
            }
            .background(Color.purple)
        }.onAppear {
            fetchListNote()
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
