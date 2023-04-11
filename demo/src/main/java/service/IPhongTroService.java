package service;

import model.PhongTro;
import model.ThanhToan;

import java.util.List;

public interface IPhongTroService {
    List<PhongTro> displayAll();
    List<ThanhToan> findAll();
    boolean add (PhongTro phongTro);
    List<PhongTro> search(String search);

    boolean remove(int id);
}
