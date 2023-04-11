package repository.impl;

import model.PhongTro;
import model.ThanhToan;
import repository.BaseRepository;
import repository.IPhongTroRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PhongTroRepository implements IPhongTroRepository {
    private final String SELECT_ALL = "select * from thue_tro where is_delete = 0;";
    private final String SELECT_THANH_TOAN = "select * from thanh_toan where is_delete = 0;";
    private final String SEARCH_NAME = "select * from thue_tro where is_delete = 0 and ten_nguoi_thue_tro like ? ;";
    private final String INSERT = "insert into thue_tro (ten_nguoi_thue_tro,so_dien_thoai,ngay_bat_dau_thue,hinh_thuc_thanh_toan,ghi_chu)" +
            "value (?,?,?,?,?);";
    private final String DELETE = "update thue_tro set is_delete = 1 where id = ? ;";

    @Override
    public List<PhongTro> displayAll() {
        List<PhongTro> phongTroList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int maPhongTro = resultSet.getInt("ma_phong_tro");
                String tenNguoiThueTro = resultSet.getString("ten_nguoi_thue_tro");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String ngayBatDauThue = resultSet.getString("ngay_bat_dau_thue");
                int idThanhToan = resultSet.getInt("hinh_thuc_thanh_toan");
                String ghiChu = resultSet.getString("ghi_chu");
                PhongTro phongTro = new PhongTro(maPhongTro, tenNguoiThueTro, soDienThoai, ngayBatDauThue, idThanhToan, ghiChu);
                phongTroList.add(phongTro);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return phongTroList;
    }

    @Override
    public List<ThanhToan> findAll() {
        List<ThanhToan> thanhToans = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_THANH_TOAN);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String hinhThucThanhToan = resultSet.getString("hinh_thuc_thanh_toan");
                ThanhToan thanhToan = new ThanhToan(id, hinhThucThanhToan);
                thanhToans.add(thanhToan);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return thanhToans;
    }

    @Override
    public List<PhongTro> search(String search) {
        List<PhongTro> phongTroList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_NAME);
            preparedStatement.setString(1, "%" + search + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int maPhongTro = resultSet.getInt("ma_phong_tro");
                String tenNguoiThueTro = resultSet.getString("ten_nguoi_thue_tro");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String ngayBatDauThue = resultSet.getString("ngay_bat_dau_thue");
                int idThanhToan = resultSet.getInt("hinh_thuc_thanh_toan");
                String ghiChu = resultSet.getString("ghi_chu");
                PhongTro phongTro = new PhongTro(maPhongTro, tenNguoiThueTro, soDienThoai, ngayBatDauThue, idThanhToan, ghiChu);
                phongTroList.add(phongTro);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return phongTroList;
    }

    @Override
    public boolean add(PhongTro phongTro) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, phongTro.getTenNguoiThueTro());
            preparedStatement.setString(2, phongTro.getSoDienThoai());
            preparedStatement.setString(3, phongTro.getNgayBatDauThue());
            preparedStatement.setInt(4, phongTro.getIdThanhToan());
            preparedStatement.setString(5, phongTro.getGhiChu());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean rexmove(int id) {
        boolean delete = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            delete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return delete;
    }
}
