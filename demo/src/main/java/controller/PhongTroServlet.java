package controller;

import model.PhongTro;
import model.ThanhToan;
import service.IPhongTroService;
import service.impl.PhongTroService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PhongTroServlet", urlPatterns = {"/phongTro"})
public class PhongTroServlet extends HttpServlet {
    private IPhongTroService phongTroService = new PhongTroService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                break;
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        String tenNguoiThueTro = request.getParameter("tenNguoiThueTro");
        String soDienThoai = request.getParameter("soDienThoai");
        String ngayBatDauThue = request.getParameter("ngayBatDauThue");
        int idThanhToan = Integer.parseInt(request.getParameter("idThanhToan"));
        String ghiChu = request.getParameter("ghiChu");
        PhongTro phongTro = new PhongTro(tenNguoiThueTro, soDienThoai, ngayBatDauThue, idThanhToan, ghiChu);
        boolean check = phongTroService.add(phongTro);
        String mess = "Thêm mới không thành công";
        if (check) {
            mess = "Thêm mới thành công";
        }
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("tro/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("search");
        List<PhongTro> phongTroList = phongTroService.search(search);
        request.setAttribute("phongTroList", phongTroList);
        request.setAttribute("saveSearch", search);
        RequestDispatcher dispatcher = request.getRequestDispatcher("tro/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormAdd(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                listPhongTro(request, response);
                break;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = false;
        check = phongTroService.remove(id);
        String mess = "Xóa không thành công";
        if (check) {
            mess = "Xóa thành công";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("check", check);
        listPhongTro(request, response);
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        List<ThanhToan> thanhToans = phongTroService.findAll();
        request.setAttribute("thanhToanList", thanhToans);
        RequestDispatcher dispatcher = request.getRequestDispatcher("tro/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listPhongTro(HttpServletRequest request, HttpServletResponse response) {
        List<PhongTro> phongTroList = phongTroService.displayAll();
        List<ThanhToan> thanhToanList = phongTroService.findAll();
        request.setAttribute("phongTroList", phongTroList);
        request.setAttribute("thanhToanList", thanhToanList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("tro/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
