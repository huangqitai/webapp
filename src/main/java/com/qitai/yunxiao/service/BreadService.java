package com.qitai.yunxiao.service;

import com.qitai.yunxiao.entity.Bread;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class BreadService {

    public Bread loginCheck(String loginName, String loginPassword){
        return new Bread(1,"admin","qq");
    }
    public int addBread(String loginName,String loginPassword){
        return 1;
    }
    public Integer rowCount(){
        return 100;
    }

    public List<Bread> getBreadAll(){
        List<Bread> breads = new ArrayList<>();
        Bread bread = new Bread(1,"admin","qq");
        Bread bread2 = new Bread(1,"admin2","qq");
        Bread bread3 = new Bread(1,"admin3","qq");
        Bread bread4 = new Bread(1,"admin4","qq");
        breads.add(bread);
        breads.add(bread2);
        breads.add(bread3);
        breads.add(bread4);
        return breads;
    }

    public void deleteBread(int id){

    }

    public void updateBread(Bread bread){

    }
    public Bread getBreadById(int id){
        return new Bread(id,"adminn","qq");
    }
}
