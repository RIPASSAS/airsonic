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
package org.airsonic.player.command;

import org.airsonic.player.controller.MyMusicQoEController;

/**
 * Command used in {@link MyMusicQoEController}.
 *
 * @author Sindre Mehus
 */
public class Rating_MyMusicQoECommand {
    private int numberOfPlaylist;
    private int idUser_MyMusicQoE;
    private int idMediaFile;
    private String mfTitle;
    private String mfArtist;
    private String mfGenre;
    private int idTranscoding;
    private String tcName;
    private boolean headphones;
    private int rating;


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

    public String getMfTitle() {
        return mfTitle;
    }

    public void setMfTitle(String mfTitle) {
        this.mfTitle = mfTitle;
    }

    public String getMfArtist() {
        return mfArtist;
    }

    public void setMfArtist(String mfArtist) {
        this.mfArtist = mfArtist;
    }

    public String getMfGenre() {
        return mfGenre;
    }

    public void setMfGenre(String mfGenre) {
        this.mfGenre = mfGenre;
    }

    public int getIdTranscoding() {
        return idTranscoding;
    }

    public void setIdTranscoding(int idTranscoding) {
        this.idTranscoding = idTranscoding;
    }

    public String getTcName() {
        return tcName;
    }

    public void setTcName(String tcName) {
        this.tcName = tcName;
    }

    public boolean isHeadphones() {
        return headphones;
    }

    public void setHeadphones(boolean headphones) {
        this.headphones = headphones;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}