/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author duchi
 */
public class Image {

    private int id;

    private byte[] image;
    private String encode;

    public Image() {

    }

    private void encodeImage() {
         this.encode = Base64.getEncoder().encodeToString(this.image);
    }

    public Image(byte[] image) {
        this.image = image;
        encodeImage();
    }

    public Image(int id, byte[] image) {
        this.id = id;
        this.image = image;
        encodeImage();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
        
                
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
        encodeImage();
    }

    public String getEncode() {
        return encode;
    }

    public void setEncode(String encode) {
        this.encode = encode;
    }

}
