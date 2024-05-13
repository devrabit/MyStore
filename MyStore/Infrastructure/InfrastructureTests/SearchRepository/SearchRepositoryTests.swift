//
//  SearchRepositoryTests.swift
//  InfrastructureTests
//
//  Created by Andrey Carreño on 12/05/24.
//

import XCTest
@testable import Infrastructure

final class SearchRepositoryTests: XCTestCase {
    
    func testSearchItems_Success() {
        // Given
        let mockWebService = MockWebService()
        let searchRepository = SearchRepository(webService: mockWebService)
        let successResponseData = """
            {
                "site_id": "",
                "query": "",
                "results": [
                    {
                          "id": "MLA1700686770",
                          "title": "Tv Led Philco Pld32hd23chpi 32 Hd",
                          "condition": "new",
                          "thumbnail_id": "750254-MLU74051952732_012024",
                          "catalog_product_id": "MLA27913050",
                          "listing_type_id": "gold_special",
                          "permalink": "https://www.mercadolibre.com.ar/tv-led-philco-pld32hd23chpi-32-hd/p/MLA27913050",
                          "buying_mode": "buy_it_now",
                          "site_id": "MLA",
                          "category_id": "MLA1002",
                          "domain_id": "MLA-TELEVISIONS",
                          "thumbnail": "http://http2.mlstatic.com/D_750254-MLU74051952732_012024-I.jpg",
                          "currency_id": "ARS",
                          "order_backend": 1,
                          "price": 172999,
                          "original_price": 269099,
                          "sale_price": null,
                          "available_quantity": 250,
                          "official_store_id": 1372,
                          "official_store_name": "Tienda Newsan",
                          "use_thumbnail_id": true,
                          "accepts_mercadopago": true,
                          "shipping": {},
                          "stop_time": "2044-03-07T04:00:00.000Z",
                          "seller": {},
                          "attributes": [],
                          "installments": {},
                          "winner_item_id": null,
                          "catalog_listing": true,
                          "discounts": null,
                          "promotions": [
                          ],
                          "inventory_id": "FCNG43384"
                        }
                ]
            }
            """.data(using: .utf8)!
        mockWebService.response = .success(successResponseData)
        
        var capturedResult: Result<[ProductEntity], RepositoryError>?
        
        // When
        let expectation = XCTestExpectation(description: "Wait for search completion")
        searchRepository.searchItems(with: "iphone") { result in
            capturedResult = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.5)
        
        // Then
        switch capturedResult {
        case .success(let products):
            XCTAssertEqual(products.count, 1)
            XCTAssertEqual(products[0].id, "MLA1700686770")
            XCTAssertEqual(products[0].title, "Tv Led Philco Pld32hd23chpi 32 Hd")
            XCTAssertEqual(products[0].price, 172999)
            XCTAssertEqual(products[0].thumbnail, "http://http2.mlstatic.com/D_750254-MLU74051952732_012024-I.jpg")
        case .failure(let error):
            XCTFail("Expected success, got failure: \(error)")
        case .none:
            XCTFail("Completion handler not called")
        }
    }
    
    func testSearchItems_Failure() {
        // Given
        let mockWebService = MockWebService()
        let searchRepository = SearchRepository(webService: mockWebService)
        let error = NSError(domain: "test", code: 500, userInfo: nil)
        let expected = "The operation couldn’t be completed. (Infrastructure.RepositoryError error 0.)"
        mockWebService.response = .failure(error)
        
        var capturedResult: Result<[ProductEntity], RepositoryError>?
        
        // When
        searchRepository.searchItems(with: "iphone") { result in
            capturedResult = result
        }
        
        // Then
        switch capturedResult {
        case .success:
            XCTFail("Expected failure, got success")
        case  .failure(let error):
            XCTAssertEqual(error.localizedDescription, expected)
        case .none:
            XCTFail("Completion handler not called")
        }
    }
    
}
