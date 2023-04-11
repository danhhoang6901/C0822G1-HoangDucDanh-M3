package service;

import model.BenhAn;
import model.BenhNhan;

import java.util.List;

public interface IBenhAnService {
    List<BenhAn> displayAll();

    List<BenhNhan> findAll();

    boolean update(BenhAn benhAn);

    BenhAn findById(int id);

    boolean remove(int id);
}
