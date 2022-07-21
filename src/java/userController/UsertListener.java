/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userController;

import dal.DAOGallery;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import model.Gallery;

/**
 * Web application lifecycle listener.
 *
 * @author duchi
 */
public class UsertListener implements HttpSessionListener {

    private List<HttpSession> sessions = new ArrayList<>();
    private ArrayList<Gallery> gallerys = new ArrayList<>();
    private ArrayList<Gallery> homePageDisplay = new ArrayList<>();

    public UsertListener() {
        updateData();
       
    }

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        System.out.println("SessionCounter.sessionCreated");
        HttpSession session = event.getSession();
        sessions.add(session);
        session.setAttribute("gallerys", gallerys);
        session.setAttribute("homePageDisplay", homePageDisplay);
        session.setAttribute("UsertListener", this);
        for (HttpSession ses : sessions) {
            ses.setAttribute("numOnline", sessions.size());
            ses.setAttribute("numOnlineFormat", formatNumOnline());
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        System.out.println("SessionCounter.sessionDestroyed");
        HttpSession session = event.getSession();
        sessions.remove(session);
        for (HttpSession ses : sessions) {
            ses.setAttribute("numOnline", sessions.size());
            ses.setAttribute("numOnlineFormat", formatNumOnline());
        }

    }

    private char[] formatNumOnline() {
        String num = (sessions.size() + "");
        int enoughSix = 6 - num.length();
        String update = "";
        for (int i = 0; i < enoughSix; i++) {
            update = update + "0";
        }
        return (num+update).toCharArray();
    }

    public void updateData() {
        DAOGallery daog = new DAOGallery();
        gallerys = daog.getGallerys();
        homePageDisplay = daog.getFrontPageDisplay();
        for (HttpSession ses : sessions) {
            ses.setAttribute("gallerys", gallerys);
            ses.setAttribute("homePageDisplay", homePageDisplay);
        }

    }
    
}
