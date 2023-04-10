package com.digitalproductsweb.dbContext;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB implements DatabaseInfor {

    private static ConnectDB instance;

    public ConnectDB() {
    }

    public Connection openConnection() throws Exception {
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url, user, pass);
        return con;
    }

    public static ConnectDB getInstance() {
        if (instance == null) {
            instance = new ConnectDB();
        }
        return instance;
    }
}