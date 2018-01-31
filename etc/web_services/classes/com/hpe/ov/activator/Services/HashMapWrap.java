package com.hpe.ov.activator.Services;

import java.io.Serializable;

import java.util.*;


/**
 * @author Code generated using HPSA WebServiceDesigner
 *
 * This class is made to overcome an issue with JAX-WS and HashMaps
 * confer http://forums.java.net/jive/message.jspa?messageID=185244
 */
public class HashMapWrap implements Serializable {
    protected HashMap<String, String> map;

    public HashMapWrap() {
        map = null;
    }

    public HashMap<String, String> getMap() {
        return map;
    }

    public void setMap(HashMap<String, String> map) {
        this.map = map;
    }
}
