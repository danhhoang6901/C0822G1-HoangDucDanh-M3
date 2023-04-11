package repository;

import model.BenhAn;
import model.BenhNhan;

import java.util.List;

public interface IBenhAnRepository {
    List<BenhAn> displayAll();

    List<BenhNhan> findAll();

    boolean update(BenhAn benhAn);

    BenhAn findById(int id);

    boolean remove(int id);
}
