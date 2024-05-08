package com.rehousing.controller;

import com.rehousing.app.data.dto.HouseDto;
import com.rehousing.app.service.HouseService;
import com.rehousing.app.service.HousepicService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/house")
public class HouseController {
    @Value("${app.key.kakaomapkey}")
    String kakaomapkey;
    String dir= "house/";;
    final HouseService houseService;
    private final HousepicService housepicService;

    @RequestMapping("/list")
    public String list(Model model) {
        try {
            List<HouseDto> houses = houseService.get();


            log.info("Accessing house list view with photos");
            model.addAttribute("houses", houses);
        } catch (Exception e) {
            log.error("Error retrieving houses", e);
            throw new RuntimeException("Error retrieving houses", e);
        }
        return dir + "houseList";
    }

    @RequestMapping("/region")
    public String region(@RequestParam(value = "cityName", required = false) String cityName, Model model){
        model.addAttribute("kakaomapkey",kakaomapkey);
        model.addAttribute("cityName", cityName);
        return dir+"houseRegion";
    }
    @RequestMapping("/getHousesByCity")
    @ResponseBody
    public List<HouseDto> getHousesByCity(@RequestParam("cityName") String cityName, Model model) throws Exception {
        List<HouseDto> houses = houseService.getByCity(cityName);
        model.addAttribute("kakaomapkey",kakaomapkey);
        return houses;

    }
    @RequestMapping("/getHouseDetail")
    public String getHouseDetail(Model model, @RequestParam("houseIdx") Integer houseIdx) throws Exception {
        log.info(String.valueOf(houseIdx));
        HouseDto house = houseService.getByIdx(houseIdx);
        model.addAttribute("kakaomapkey",kakaomapkey);
        model.addAttribute("house", house);
        return dir + "houseDetail";

    }


}
