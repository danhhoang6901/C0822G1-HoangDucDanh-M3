package service.impl;

import model.BenhAn;
import model.BenhNhan;
import repository.IBenhAnRepository;
import repository.impl.BenhAnRepository;
import service.IBenhAnService;

import java.util.List;

public class BenhAnService implements IBenhAnService {
    private IBenhAnRepository benhAnRepository = new BenhAnRepository();
    @Override
    public List<BenhAn> displayAll() {
        return benhAnRepository.displayAll();
    }

    @Override
    public List<BenhNhan> findAll() {
        return benhAnRepository.findAll();
    }

    @Override
    public boolean update(BenhAn benhAn) {
        return benhAnRepository.update(benhAn);
    }

    @Override
    public BenhAn findById(int id) {
        return benhAnRepository.findById(id);
    }

    @Override
    public boolean remove(int id) {
        return benhAnRepository.remove(id);
    }
}
