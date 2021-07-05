//
//  WordTranslatorTests.swift
//  WordTranslatorTests
//
//  Created by Vadim Salmin on 01.07.2021.
//

import XCTest
@testable import WordTranslator

class SearchViewDataMapperTests: XCTestCase {

    var mapper: SearchViewDataMapperProtocol!
    
    override func setUp() {
        super.setUp()
        
        mapper = SearchViewDataMapper()
    }
    
    override func tearDown() {
        super.tearDown()
        
        mapper = nil
    }
    
    func testMapMeaningWithEmptyTranslationNote() {
        let response = meaningResponse(translation: TranslationResponse(text: "", note: nil))
        
        let result = mapper.toViewMeaning(response)
        
        XCTAssertTrue(result.noteIsHidden)
        XCTAssertTrue(result.note.isEmpty)
    }
    
    func testMapMeaningWithTranslationNote() {
        let note = "some note"
        let response = meaningResponse(translation: TranslationResponse(text: "", note: note))
        
        let result = mapper.toViewMeaning(response)
        
        XCTAssertFalse(result.noteIsHidden)
        XCTAssertFalse(result.note.isEmpty)
        XCTAssertEqual(result.note, note)
    }
    
    private func meaningResponse(translation: TranslationResponse) -> MeaningShortResponse {
        let exampleUrl = URL(string: "http://example.com")!
        
        return MeaningShortResponse(
            id: 0,
            partOfSpeechCode: .noun,
            translation: translation,
            previewUrl: exampleUrl,
            imageUrl: exampleUrl,
            transcription: "",
            soundUrl: ""
        )
    }
}
