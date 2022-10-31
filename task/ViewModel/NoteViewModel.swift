//
//  NoteViewModel.swift
//  task
//
//  Created by ThangTQ on 28/10/2022.
//

import Foundation

class NoteViewModel: BaseViewModel {
    
    @Published var listNote: [ItemNoteModel] = []
    
    func getListNote() {
        service.callApiGet(url: Constant.BASE_URL + "api/note", returnType: [ItemNoteModel].self) { val in
            print(val)
            DispatchQueue.main.async {
                self.listNote = val
            }
        }
    }
    
    func setStar() {
        
    }
    
    func saveNote(title: String, content: String) {
        var body = NoteCreateRequest()
        body.content = content
        body.title = title
        service.post(url: Constant.BASE_URL + "api/note/save", body: body, typeResponse: NoteCreateResponse.self) { val in
            print("sssssss::::::::::")
        }
    }
}
