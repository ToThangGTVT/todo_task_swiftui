//
//  SwiftUIView.swift
//  task
//
//  Created by ThangTQ on 28/10/2022.
//

import SwiftUI
import MarkupEditor

struct NoteCreateView: View {
    @State private var content: String = "<pre>Hello World</pre>"
    @State private var title: String = ""
    @EnvironmentObject var noteViewModel: NoteViewModel
    
    func saveNote() {
        noteViewModel.saveNote(title: title, content: content)
    }
    
    init() {
        UITableView.appearance().sectionHeaderHeight = .zero
        
    }
    
    
    var body: some View {
        GeometryReader { geo in
            Form {
                Section(header: Text("Tiêu đề ghi chú:") ) {
                    TextField("Nhập vào đây...", text: $title)
                }.padding([.bottom], 0)
                Section(header: Text("Tiêu đề ghi chú:") ) {
                    MarkupEditorView(html: $content).frame(height: geo.size.height - 250)
                    Button(action: {
                        saveNote()
                    }) {
                        Text("Save").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center)
                    }.frame(height: 40.0).background(.blue).cornerRadius(8).padding([.leading, .trailing], 8)
                    
                }
            }.environment(\.defaultMinListRowHeight, 20) 
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteCreateView()
//    }
//}
