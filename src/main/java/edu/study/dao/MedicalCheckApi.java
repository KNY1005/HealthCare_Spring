package edu.study.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class MedicalCheckApi {
	
    public static void main(String[] args) {
       
        try {
            // 인증키
            String serviceKey = "SXsBCxP5w%2BvYN0eL9xWlIZU5Ov2q0%2Bwuv76Q4LpEPsfTEjaZ1uJ9IoRCKmUv0zb%2Bxb7etRcQUBOA18BAgdrPYQ%3D%3D";
            
            String urlStr = "http://openapi1.nhis.or.kr/openapi/service/rest/HmcSearchService";
            urlStr += "?"+ URLEncoder.encode("ServiceKey","UTF-8") +"=" + serviceKey;
            urlStr += "&"+ URLEncoder.encode("numOfRows","UTF-8") +"=10";
            urlStr += "&"+ URLEncoder.encode("pageNo","UTF-8") +"=5";
            urlStr += "&"+ URLEncoder.encode("_returnType","UTF-8") +"=json";
         
            URL url = new URL(urlStr);
            
            String line = "";
            String result = "";
            
            BufferedReader br;
            br = new BufferedReader(new InputStreamReader(url.openStream()));
            while ((line = br.readLine()) != null) {
                result = result.concat(line);
                //System.out.println(line);                
            }            
            
            // JSON parser 만들어 문자열 데이터를 객체화한다.
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(result);
            
            // list 아래가 배열형태로
            // {"list" : [ {"returnType":"json","clearDate":"--",.......} ] 
            JSONArray parse_listArr = (JSONArray)obj.get("list");
            
            String miseType = "";
            
            // 객체형태로
            // {"returnType":"json","clearDate":"--",.......},... 
            for (int i=0;i< parse_listArr.size();i++) {
                JSONObject medicalCheck = (JSONObject) parse_listArr.get(i);
                String hmcNm = (String) medicalCheck.get("hmcNm");            
                String hmcTelNo = (String) medicalCheck.get("hmcTelNo");    
                String locAddr = (String) medicalCheck.get("locAddr");            
                String siDoCd = (String) medicalCheck.get("siDoCd");       
                String siGunGuCd = (String) medicalCheck.get("siGunGuCd");       
                String ltems  = (String) medicalCheck.get("ltems");       
                String resultCode  = (String) medicalCheck.get("resultCode");       
                String resultMsg  = (String) medicalCheck.get("resultMsg");        

                

                StringBuffer sb = new StringBuffer();
                sb.append("병원명 : " + hmcNm + ", 번호 : " + hmcTelNo + " , " + "주소 : "+ locAddr +""  );
                System.out.println("test"+sb.toString());                
            }
            
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
 
    }
 
}


