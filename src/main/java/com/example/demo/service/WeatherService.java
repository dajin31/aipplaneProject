package com.example.demo.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;

public class WeatherService {
    private static final String SERVICE_KEY = "wlyAJBWheYEKlFs%2FbQKAmZYp1G%2FTDKpex1PIM%2BeLUtDj95XJmHUmYTer9tpQVR46BrFawvMAGwQzZoL7SXj0DQ%3D%3D";

    public static JSONObject getWeatherData(String baseDate, String baseTime, String nx, String ny) throws Exception {
        String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
                + "?serviceKey=" + SERVICE_KEY
                + "&dataType=JSON"
                + "&pageNo=1"
                + "&numOfRows=60"
                + "&base_date=" + baseDate
                + "&base_time=" + baseTime
                + "&nx=" + nx
                + "&ny=" + ny;

        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-Type", "application/json");

        int responseCode = conn.getResponseCode();
        if (responseCode != 200) {
            throw new RuntimeException("API 호출 실패: HTTP 응답 코드 " + responseCode);
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();

        JSONObject jsonResponse = new JSONObject(response.toString());
        return extractUsefulData(jsonResponse);
    }

    private static JSONObject extractUsefulData(JSONObject data) {
        JSONObject result = new JSONObject();
        if (data.has("response") && data.getJSONObject("response").has("body")) {
            result.put("weather", data.getJSONObject("response").getJSONObject("body"));
        } else {
            result.put("error", "데이터를 찾을 수 없습니다.");
        }
        return result;
    }
}
