package model;

public class ThanhToan {
    private int id;
    private String hinhThucThanhToan;

    public ThanhToan() {
    }

    public ThanhToan(int id, String hinhThucThanhToan) {
        this.id = id;
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHinhThucThanhToan() {
        return hinhThucThanhToan;
    }

    public void setHinhThucThanhToan(String hinhThucThanhToan) {
        this.hinhThucThanhToan = hinhThucThanhToan;
    }
}
