//
//  InfoModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation

struct InfoModel {
    
    static func convertSeasonOnServer(season: String?) -> String? {
        guard let text =  season else {return nil}
        
        var seriesText = text.prefix(3)
        
        if let sIndex = seriesText.firstIndex(where: {$0 == "S"}) {
            seriesText.remove(at: sIndex)
            if let series = Int(seriesText) {
                return String(series)
            }
        }
        return nil
    }
    
    static func convertEpisodeOnServer(episode: String?) -> String? {
        guard let text =  episode else {return nil}
        
        var seasonText = text.suffix(3)
        
        if let eIndex = seasonText.firstIndex(where: {$0 == "E"}) {
            seasonText.remove(at: eIndex)
            if let season = Int(seasonText) {
                return String(season)
            }
        }
        return nil
    }
    
}
