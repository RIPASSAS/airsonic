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
package org.airsonic.player.dao;

import org.airsonic.player.domain.Rating_MyMusicQoE;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * Provides database services for rating from MyMusicQoE.
 *
 * @author Tiago Martins
 */
@Repository
public class Rating_MyMusicQoEDao extends AbstractDao {

    private static final Logger LOG = LoggerFactory.getLogger(Rating_MyMusicQoEDao.class);
    private static final String INSERT_COLUMNS = "numberofplaylist, iduser_mymusicqoe, idmediafile, mfTitle, mfArtist, mfGenre, idtranscoding, tcName, headphones, rating, date";
    private static final String QUERY_COLUMNS = INSERT_COLUMNS;
    private Rating_MyMusicQoERowMapper rowMapper = new Rating_MyMusicQoERowMapper();

    /**
     * Returns all ratings.
     *
     * @return Possibly empty list of all ratings.
     */
    public List<Rating_MyMusicQoE> getAllRatings() {
        String sql = "select " + QUERY_COLUMNS + " from rating_mymusicqoe";
        return query(sql, rowMapper);
    }

    /**
     * Returns all ratings from a specific user.
     *
     * @param idUser The user's id.
     * @return All ratings from the given user id.
     */
    public List<Rating_MyMusicQoE> getAllRatingsFromUser(int idUser) {
        String sql = "select " + QUERY_COLUMNS + " from rating_mymusicqoe " +
                      "where iduser_mymusicqoe = ?";
        return query(sql, rowMapper, idUser);
    }

    /**
     * Returns all ratings from a specific music.
     *
     * @param idSong The song's id.
     * @return All ratings from the given song id.
     */
    public List<Rating_MyMusicQoE> getAllRatingsFromSong(int idSong) {
        String sql = "select " + QUERY_COLUMNS + " from rating_mymusicqoe " +
                "where idmediafile = ?";
        return query(sql, rowMapper, idSong);
    }

    /**
     * Returns all ratings from a specific transcoding.
     *
     * @param idTrans The transcoding's id.
     * @return All ratings from the given transcoding id.
     */
    public List<Rating_MyMusicQoE> getAllRatingsFromTranscoding(int idTrans) {
        String sql = "select " + QUERY_COLUMNS + " from rating_mymusicqoe " +
                "where idtranscoding = ?";
        return query(sql, rowMapper, idTrans);
    }

    /**
     * Creates a new rating.
     *
     * @param rating The rating to create.
     */
    @Transactional
    public void createRating_MyMusicQoE(Rating_MyMusicQoE rating) {
        String date = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
        String sql = "insert into rating_mymusicqoe (" + QUERY_COLUMNS + ") values (" + questionMarks(QUERY_COLUMNS) + ")";
        update(sql, rating.getNumberOfPlaylist(), rating.getIdUser_MyMusicQoE(), rating.getIdMediaFile(), rating.getMfTitle(), rating.getMfArtist(), rating.getMfGenre(), rating.getIdTranscoding(), rating.getTcName(), rating.isHeadphones(),rating.getRating(), date);
        LOG.info("Created rating_mymusicqoe with CombinedID ("+ rating.getNumberOfPlaylist() +"," + rating.getIdUser_MyMusicQoE() + "," + rating.getIdMediaFile() +")");
    }

    /**
     * Deletes the rating with the given params.
     *
     * @param numberOfPlaylist The rating numberOfPlaylist.
     * @param idUser_MyMusicQoE The rating user ID.
     */
    public void deleteRating_MyMusicQoE(int numberOfPlaylist, int idUser_MyMusicQoE, int idMediaFile) {
        String sql = "delete from rating_mymusicqoe where numberofplaylist=? and iduser_mymusicqoe=? and idmediafile=?";
        update(sql, numberOfPlaylist, idUser_MyMusicQoE, idMediaFile);
        LOG.info("Deleted rating_mymusicqoe with CombinedID ("+ numberOfPlaylist + "," + idUser_MyMusicQoE + "," + idMediaFile +")");
    }

    /**
     * Updates the given rating.
     *
     * @param rating The rating to update.
     */
    public void updateRating_MyMusicQoE(Rating_MyMusicQoE rating) {
        String sql = "update rating_mymusicqoe set rating=? where numberofplaylist=? and iduser_mymusicqoe=? and idmediafile=?";
        update(sql, rating.getRating(), rating.getNumberOfPlaylist(), rating.getIdUser_MyMusicQoE(), rating.getIdMediaFile());
        LOG.info("Updated rating_mymusicqoe with CombinedID ("+ rating.getNumberOfPlaylist() +"," + rating.getIdUser_MyMusicQoE() + "," + rating.getIdMediaFile() +")");
    }

    private static class Rating_MyMusicQoERowMapper implements RowMapper<Rating_MyMusicQoE> {
        public Rating_MyMusicQoE mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new Rating_MyMusicQoE(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getInt(7), rs.getString(8), rs.getBoolean(9),rs.getInt(10), rs.getString(11));
        }
    }
}
