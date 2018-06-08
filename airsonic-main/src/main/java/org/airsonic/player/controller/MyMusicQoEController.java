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

import org.airsonic.player.domain.Rating_MyMusicQoE;
import org.airsonic.player.domain.User_MyMusicQoE;
import org.airsonic.player.service.MyMusicQoEService;
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

    @RequestMapping(method = RequestMethod.GET)
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<>();

        List<User_MyMusicQoE> musicqoeUsers = mymusicqoeService.getAllUsers();

        List<Rating_MyMusicQoE> musicqoeRatings = mymusicqoeService.getAllRatings();

        map.put("musicqoeUsers", musicqoeUsers);
        map.put("musicqoeRatings", musicqoeRatings);

        return new ModelAndView("qoeEntries","model",map);
    }

}
