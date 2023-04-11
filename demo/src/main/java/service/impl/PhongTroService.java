package service.impl;

import model.PhongTro;
import model.ThanhToan;
import repository.IPhongTroRepository;
import repository.impl.PhongTroRepository;
import service.IPhongTroService;

import java.util.List;

public class PhongTroService implements IPhongTroService {
    private IPhongTroRepository phongTroRepository = new PhongTroRepository();
    @Override
    public List<PhongTro> displayAll() {
        return phongTroRepository.displayAll();
    }

    @Override
    public List<ThanhToan> findAll() {
        return phongTroRepository.findAll();
    }

    @Override
    public boolean add(PhongTro phongTro) {
        return phongTroRepository.add(phongTro);
    }

    @Override
    public List<PhongTro> search(String search) {
        return phongTroRepository.search(search);
    }

    @Override
    public boolean remove(int id) {
        return phongTroRepository.rexmove(id);
    }
}
