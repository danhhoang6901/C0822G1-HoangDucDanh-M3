package repository;

import model.PhongTro;
import model.ThanhToan;

import java.util.List;

public interface IPhongTroRepository {
    List<PhongTro> displayAll();

    List<ThanhToan> findAll();

    List<PhongTro> search(String search);

    boolean add(PhongTro phongTro);

    boolean rexmove(int id);
}
