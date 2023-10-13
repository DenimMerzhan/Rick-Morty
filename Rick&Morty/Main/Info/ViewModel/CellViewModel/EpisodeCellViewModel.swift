//
//  EpisodeCellViewModel.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation

class EpisodeCellViewModel: EpisodeCellViewModelType {
    
    var characterEpisode: Episode?
    
    var name: String? {
        return characterEpisode?.name
    }
    
    var episode: String? {
        return InfoModel.convertEpisodeOnServer(episode: characterEpisode?.episode)
    }
    
    var season: String? {
        return InfoModel.convertSeasonOnServer(season: characterEpisode?.episode)
    }
    
    var airDate: String? {
        return characterEpisode?.air_date
    }
    
    init(episode: Episode?){
        self.characterEpisode = episode
    }
    
    
}
