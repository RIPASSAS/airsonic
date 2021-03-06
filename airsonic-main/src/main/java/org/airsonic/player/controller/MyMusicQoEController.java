/*
 This file is part of Airsonic.

 Airsonic is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Airsonic is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Airsonic.  If not, see <http://www.gnu.org/licenses/>.

 Copyright 2016 (C) Airsonic Authors
 Based upon Subsonic, Copyright 2009 (C) Sindre Mehus
 */
package org.airsonic.player.controller;

import org.airsonic.player.command.Rating_MyMusicQoECommand;
import org.airsonic.player.command.User_MyMusicQoECommand;
import org.airsonic.player.domain.MediaFile;
import org.airsonic.player.domain.Rating_MyMusicQoE;
import org.airsonic.player.domain.Transcoding;
import org.airsonic.player.domain.User_MyMusicQoE;
import org.airsonic.player.service.MediaFileService;
import org.airsonic.player.service.MyMusicQoEService;
import org.airsonic.player.service.TranscodingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

/**
 * Controller for the QoE Entries page.
 *
 * @author Tiago Martins
 */
@Controller
@RequestMapping("/qoeEntries")
public class MyMusicQoEController {

    @Autowired
    private MyMusicQoEService mymusicqoeService;
    @Autowired
    private MediaFileService mediaFileService;
    @Autowired
    private TranscodingService transcodingService;

    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<>();

        List<User_MyMusicQoE> musicqoeUsers = mymusicqoeService.getAllUsers();

        List<Rating_MyMusicQoE> musicqoeRatings = mymusicqoeService.getAllRatings();

        map.put("musicqoeUsers", musicqoeUsers);
        map.put("musicqoeRatings", musicqoeRatings);

        return new ModelAndView("qoeEntries","model",map);
    }

    public void createUser_MyMusicQoe(User_MyMusicQoECommand command) {
        User_MyMusicQoE user = new User_MyMusicQoE(command.getId(), command.getGender(), command.getAge(), command.getGenres());
        mymusicqoeService.createUser_MyMusicQoe(user);
    }

    public int getLastIdUser_MyMusicQoE(){
        return mymusicqoeService.getLastIdUser_MyMusicQoE();
    }

    public void createRating_MyMusicQoE(Rating_MyMusicQoECommand command){
        Rating_MyMusicQoE rating = new Rating_MyMusicQoE(command.getNumberOfPlaylist(), command.getIdUser_MyMusicQoE(), command.getIdMediaFile(), "", "", "", command.getIdTranscoding(), "", command.isHeadphones(),command.getRating(), "");
        MediaFile mf = mediaFileService.getMediaFile(rating.getIdMediaFile());
        rating.setMfTitle(mf.getTitle());
        rating.setMfArtist(mf.getArtist());
        rating.setMfGenre(mf.getGenre());
        Transcoding tc = transcodingService.getTranscoding(rating.getIdTranscoding());
        rating.setTcName(tc.getName());
        mymusicqoeService.createRating_MyMusicQoe(rating);
    }

    public void updateRating_MyMusicQoE(Rating_MyMusicQoECommand command){
        Rating_MyMusicQoE rating = new Rating_MyMusicQoE(command.getNumberOfPlaylist(), command.getIdUser_MyMusicQoE(), command.getIdMediaFile(), "", "", "", command.getIdTranscoding(), "", command.isHeadphones(),command.getRating(), "");
        MediaFile mf = mediaFileService.getMediaFile(rating.getIdMediaFile());
        rating.setMfTitle(mf.getTitle());
        rating.setMfArtist(mf.getArtist());
        rating.setMfGenre(mf.getGenre());
        Transcoding tc = transcodingService.getTranscoding(rating.getIdTranscoding());
        rating.setTcName(tc.getName());
        mymusicqoeService.updateRating_MyMusicQoe(rating);
    }



}
