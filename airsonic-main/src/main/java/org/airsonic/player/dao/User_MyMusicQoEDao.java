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

import org.airsonic.player.domain.User_MyMusicQoE;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Provides database services for user from MyMusicQoE.
 *
 * @author Tiago Martins
 */
@Repository
public class User_MyMusicQoEDao extends AbstractDao {

    private static final Logger LOG = LoggerFactory.getLogger(User_MyMusicQoEDao.class);
    private static final String INSERT_COLUMNS = "id, gender, age, genres";
    private static final String QUERY_COLUMNS = INSERT_COLUMNS;
    private User_MyMusicQoERowMapper rowMapper = new User_MyMusicQoERowMapper();

    /**
     * Returns all users.
     *
     * @return Possibly empty list of all users.
     */
    public List<User_MyMusicQoE> getAllUsers() {
        String sql = "select " + QUERY_COLUMNS + " from user_mymusicqoe";
        return query(sql, rowMapper);
    }

    /**
     * Returns all users with the given gender.
     *
     * @param gender The user's gender.
     * @return All users with the given gender.
     */
    public List<User_MyMusicQoE> getAllUsersWithGender(String gender) {
        String sql = "select " + QUERY_COLUMNS + " from user_mymusicqoe " +
                      "where gender = ?";
        return query(sql, rowMapper, gender);
    }

    public int getLastUser(){
        Integer existingMax = getJdbcTemplate().queryForObject("select max(id) from user_mymusicqoe", Integer.class);
        if(existingMax == null) {
            existingMax = 0;
        }
        return existingMax;
    }

    /**
     * Creates a new user.
     *
     * @param user The user to create.
     */
    @Transactional
    public void createUser_MyMusicQoE(User_MyMusicQoE user) {
        String sql = "insert into user_mymusicqoe (" + QUERY_COLUMNS + ") values (" + questionMarks(QUERY_COLUMNS) + ")";
        update(sql, user.getId(), user.getGender(), user.getAge(),
                user.getGenres());
        LOG.info("Created user_mymusicqoe " + user.getId());
    }

    /**
     * Deletes the user with the given ID.
     *
     * @param id The user ID.
     */
    public void deleteUser_MyMusicQoE(Integer id) {
        String sql = "delete from user_mymusicqoe where id=?";
        update(sql, id);
        LOG.info("Deleted user_mymusicqoe with ID " + id);
    }

    /**
     * Updates the given user.
     *
     * @param user The user to update.
     */
    public void updateUser_MyMusicQoE(User_MyMusicQoE user) {
        String sql = "update user_mymusicqoe set age=?, gender=?, " +
                "genres=? where id=?";
        update(sql, user.getGender(), user.getAge(),
                user.getGenres(), user.getId());
    }

    private static class User_MyMusicQoERowMapper implements RowMapper<User_MyMusicQoE> {
        public User_MyMusicQoE mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new User_MyMusicQoE(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4));
        }
    }
}
