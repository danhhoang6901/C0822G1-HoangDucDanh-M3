package model;

public class BenhNhan {
    private int id;
    private String tenBenhNhan;

    public BenhNhan() {
    }

    public BenhNhan(int id, String tenBenhNhan) {
        this.id = id;
        this.tenBenhNhan = tenBenhNhan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenBenhNhan() {
        return tenBenhNhan;
    }

    public void setTenBenhNhan(String tenBenhNhan) {
        this.tenBenhNhan = tenBenhNhan;
    }
}
