package repository.impl;

import model.BenhAn;
import model.BenhNhan;
import repository.IBenhAnRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BenhAnRepository implements IBenhAnRepository {
    private final String SELECT_ALL = "select * from benh_an where is_delete = 0;";
    private final String SELECT_BENH_NHAN = "select * from benh_nhan where is_delete = 0;";
    private final String DELETE = "update benh_an set is_delete = 1 where id = ? ;";
    private final String UPDATE = "update benh_an set id_benh_nhan = ?,ngay_nhap_vien = ?," +
            "ngay_ra_vien = ?,ly_do_nhap_vien = ? where id = ?;";

    @Override
    public List<BenhAn> displayAll() {
        List<BenhAn> benhAns = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int idBenhNhan = resultSet.getInt("id_benh_nhan");
                String ngayNhapVien = resultSet.getString("ngay_nhap_vien");
                String ngayRaVien = resultSet.getString("ngay_ra_vien");
                String lyDoNhapVien = resultSet.getString("ly_do_nhap_vien");
                benhAns.add(new BenhAn(id, idBenhNhan, ngayNhapVien, ngayRaVien, lyDoNhapVien));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return benhAns;
    }

    @Override
    public List<BenhNhan> findAll() {
        List<BenhNhan> benhNhans = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BENH_NHAN);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String tenBenhNhan = resultSet.getString("ten_benh_nhan");
                benhNhans.add(new BenhNhan(id, tenBenhNhan));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return benhNhans;
    }

    @Override
    public boolean update(BenhAn benhAn) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setInt(1, benhAn.getIdBenhNhan());
            preparedStatement.setString(2, benhAn.getNgayNhapVien());
            preparedStatement.setString(3, benhAn.getNgayRaVien());
            preparedStatement.setString(4, benhAn.getLyDoNhapVien());
            preparedStatement.setInt(5, benhAn.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public BenhAn findById(int id) {
        List<BenhAn> benhAns = displayAll();
        for (BenhAn benhAn : benhAns) {
            if (benhAn.getId() == id) {
                return benhAn;
            }
        }
        return null;
    }

    @Override
    public boolean remove(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
