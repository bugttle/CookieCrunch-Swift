//
//  Level.swift
//  CookieCrunch
//
//  Created by UQ Times on 7/18/14.
//  Copyright (c) 2014 UQ Times. All rights reserved.
//

let NumColumns = 9
let NumRows = 9

class Level {
    let cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
    let tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)
    
    init(filename: String) {
        if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {
            if let tilesArray: AnyObject = dictionary["tiles"] {
                for (row, rowArray) in enumerate(tilesArray as [[Int]]) {
                    let tileRow = NumRows - row - 1
                    for (column, value) in enumerate(rowArray) {
                        if value == 1 {
                            tiles[column, tileRow] = Tile()
                        }
                    }
                }
            }
        }
    }
    
    func cookieAtColumn(column: Int, row: Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func tileAtColumn(column: Int, row: Int) -> Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
    
    func shuffle() -> Set<Cookie> {
        return createInitialCookies()
    }
    
    func createInitialCookies() -> Set<Cookie> {
        var set = Set<Cookie>()
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                if tiles[column, row] {
                    var cookieType = CookieType.random()
                    let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                    cookies[column, row] = cookie
                    
                    set.addElement(cookie)
                }
            }
        }
        return set
    }
}
