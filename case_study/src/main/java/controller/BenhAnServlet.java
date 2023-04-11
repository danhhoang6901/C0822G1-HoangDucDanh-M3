package controller;

import model.BenhAn;
import model.BenhNhan;
import service.IBenhAnService;
import service.impl.BenhAnService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BenhAnServlet", urlPatterns = {"/benh_an"})
public class BenhAnServlet extends HttpServlet {
    private IBenhAnService benhAnService = new BenhAnService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                edit(request, response);
                break;
            default:
                listBenhAn(request,response);
                break;
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int idBenhNhan = Integer.parseInt(request.getParameter("idBenhNhan"));
        String ngayNhapVien = request.getParameter("ngayNhapVien");
        String ngayRaVien = request.getParameter("ngayRaVien");
        String lyDoNhapVien = request.getParameter("lyDoNhapVien");
        BenhAn benhAn = new BenhAn(id, idBenhNhan, ngayNhapVien, ngayRaVien, lyDoNhapVien);
        boolean check = benhAnService.update(benhAn);
        String mess = "Chỉnh sửa không thành công";
        if (check) {
            mess = "Cập nhật thành công";
        }
        request.setAttribute("mess", mess);
        try {
            response.sendRedirect("/benh_an");
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
            case "edit":
                showFormEdit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                listBenhAn(request, response);
                break;
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = false;
        check = benhAnService.remove(id);
        String mess = "Xóa không thành công";
        if (check) {
            mess = "Xóa thành công";
        }
        request.setAttribute("mess", mess);
        listBenhAn(request, response);
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        List<BenhNhan> benhNhans = benhAnService.findAll();
        request.setAttribute("benhNhanList", benhNhans);
        int id = Integer.parseInt(request.getParameter("id"));
        BenhAn benhAn = benhAnService.findById(id);
        try {
            request.setAttribute("benhAn", benhAn);
            request.getRequestDispatcher("view/benh_an/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void listBenhAn(HttpServletRequest request, HttpServletResponse response) {
        List<BenhAn> benhAnList = benhAnService.displayAll();
        List<BenhNhan> benhNhanList = benhAnService.findAll();
        request.setAttribute("benhAnList", benhAnList);
        request.setAttribute("benhNhanList", benhNhanList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/benh_an/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
