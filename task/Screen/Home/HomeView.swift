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
    
    func createNote() {
        
    }
    
    var body: some View {
        GeometryReader {_ in
            VStack {
                Text("Hello, World!")
                Divider()
                List {
                    Section(header: Text("Important tasks")) {
                        ForEach(0 ..< noteViewModel.listNote.count,  id: \.self) { i in
                            ItemCellNoteList(title: noteViewModel.listNote[i].title ?? "", isFavorite: noteViewModel.listNote[i].isFavorite ?? false)
                        }
                    }
                    Button(action: {
                        createNote()
                        
                    }){
                        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                            Text("Tạo note").foregroundColor(.white)
                        }
                    }.listRowBackground(Color.blue)
                }
                
            }
            .background(Color.purple)
        }.onAppear {
            fetchListNote()
        }.navigationTitle(" tTSTSTS")
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
