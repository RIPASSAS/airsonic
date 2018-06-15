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
package org.airsonic.player.service;

import org.airsonic.player.dao.Rating_MyMusicQoEDao;
import org.airsonic.player.dao.User_MyMusicQoEDao;
import org.airsonic.player.domain.Rating_MyMusicQoE;
import org.airsonic.player.domain.User_MyMusicQoE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Provides services for user ratings.
 *
 * @author Tiago Martins
 */
@Service
public class MyMusicQoEService {

    @Autowired
    private User_MyMusicQoEDao userDao;

    @Autowired
    private Rating_MyMusicQoEDao ratingDao;

    /**
     * Returns all the users.
     *
     * @return a list of users.
     */
    public List<User_MyMusicQoE> getAllUsers() {
        List<User_MyMusicQoE> result = userDao.getAllUsers();
        return result;
    }

    /**
     * Returns all the ratings.
     *
     * @return a list of ratings.
     */
    public List<Rating_MyMusicQoE> getAllRatings() {
        List<Rating_MyMusicQoE> result = ratingDao.getAllRatings();
        return result;
    }

    /**
     * Creates the given user.
     *
     * @param user The user to create.
     */
    public void createUser_MyMusicQoe(User_MyMusicQoE user) {
        userDao.createUser_MyMusicQoE(user);
    }

    public int getLastIdUser_MyMusicQoE(){
        return userDao.getLastUser();
    }


    /**
     * Creates the given rating.
     *
     * @param rating The user to create.
     */
    public void createRating_MyMusicQoe(Rating_MyMusicQoE rating) {
        ratingDao.createRating_MyMusicQoE(rating);
    }

    /**
     * Updates the given rating.
     *
     * @param rating The user to update.
     */
    public void updateRating_MyMusicQoe(Rating_MyMusicQoE rating) {
        ratingDao.updateRating_MyMusicQoE(rating);
    }

    /*

    /**
     * Sets the rating for a music file and a given user.
     *
     * @param username  The user name.
     * @param mediaFile The music file.
     * @param rating    The rating between 1 and 5, or <code>null</code> to remove the rating.
     */
    /*
    public void setRatingForUser(String username, MediaFile mediaFile, Integer rating) {
        ratingDao.setRatingForUser(username, mediaFile, rating);
    }

    */
    public void setUserDao(User_MyMusicQoEDao userDao) {
        this.userDao = userDao;
    }

}
