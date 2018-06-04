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
package org.airsonic.player.domain;

/**
 * Represent a MyMusicQoE rating.
 *
 * @author Tiago Martins
 */
public class Rating_MyMusicQoE {

    private final int id;
    private int numberOfPlaylist;
    private int idUser_MyMusicQoE;
    private int idMediaFile;
    private String transcodedContentType;
    private String transcodedSuffix;
    private int transcodedBitrate;
    private int rating;

    public Rating_MyMusicQoE(int id, int numberOfPlaylist, int idUser_MyMusicQoE, int idMediaFile, String transcodedContentType, String transcodedSuffix, int transcodedBitrate, int rating) {
        this.id = id;
        this.numberOfPlaylist = numberOfPlaylist;
        this.idUser_MyMusicQoE = idUser_MyMusicQoE;
        this.idMediaFile = idMediaFile;
        this.transcodedContentType = transcodedContentType;
        this.transcodedSuffix = transcodedSuffix;
        this.transcodedBitrate = transcodedBitrate;
        this.rating = rating;
    }

    public int getId() {
        return id;
    }

    public int getNumberOfPlaylist() {
        return numberOfPlaylist;
    }

    public void setNumberOfPlaylist(int numberOfPlaylist) {
        this.numberOfPlaylist = numberOfPlaylist;
    }

    public int getIdUser_MyMusicQoE() {
        return idUser_MyMusicQoE;
    }

    public void setIdUser_MyMusicQoE(int idUser_MyMusicQoE) {
        this.idUser_MyMusicQoE = idUser_MyMusicQoE;
    }

    public int getIdMediaFile() {
        return idMediaFile;
    }

    public void setIdMediaFile(int idMediaFile) {
        this.idMediaFile = idMediaFile;
    }

    public String getTranscodedContentType() {
        return transcodedContentType;
    }

    public void setTranscodedContentType(String transcodedContentType) {
        this.transcodedContentType = transcodedContentType;
    }

    public String getTranscodedSuffix() {
        return transcodedSuffix;
    }

    public void setTranscodedSuffix(String transcodedSuffix) {
        this.transcodedSuffix = transcodedSuffix;
    }

    public int getTranscodedBitrate() {
        return transcodedBitrate;
    }

    public void setTranscodedBitrate(int transcodedBitrate) {
        this.transcodedBitrate = transcodedBitrate;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}
