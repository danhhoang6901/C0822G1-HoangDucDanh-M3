package model;

public class BenhAn {
    private int id;
    private int idBenhNhan;
    private String ngayNhapVien;
    private String ngayRaVien;
    private String lyDoNhapVien;

    public BenhAn() {
    }

    public BenhAn(int id, int idBenhNhan, String ngayNhapVien, String ngayRaVien, String lyDoNhapVien) {
        this.id = id;
        this.idBenhNhan = idBenhNhan;
        this.ngayNhapVien = ngayNhapVien;
        this.ngayRaVien = ngayRaVien;
        this.lyDoNhapVien = lyDoNhapVien;
    }

    public BenhAn(int idBenhNhan, String ngayNhapVien, String ngayRaVien, String lyDoNhapVien) {
        this.idBenhNhan = idBenhNhan;
        this.ngayNhapVien = ngayNhapVien;
        this.ngayRaVien = ngayRaVien;
        this.lyDoNhapVien = lyDoNhapVien;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdBenhNhan() {
        return idBenhNhan;
    }

    public void setIdBenhNhan(int idBenhNhan) {
        this.idBenhNhan = idBenhNhan;
    }

    public String getNgayNhapVien() {
        return ngayNhapVien;
    }

    public void setNgayNhapVien(String ngayNhapVien) {
        this.ngayNhapVien = ngayNhapVien;
    }

    public String getNgayRaVien() {
        return ngayRaVien;
    }

    public void setNgayRaVien(String ngayRaVien) {
        this.ngayRaVien = ngayRaVien;
    }

    public String getLyDoNhapVien() {
        return lyDoNhapVien;
    }

    public void setLyDoNhapVien(String lyDoNhapVien) {
        this.lyDoNhapVien = lyDoNhapVien;
    }
}
