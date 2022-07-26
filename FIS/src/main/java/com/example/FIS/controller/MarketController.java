package com.example.FIS.controller;

import com.example.FIS.model.dto.BoardDto;
import com.example.FIS.model.dto.MarketDto;
import com.example.FIS.service.LoginService;
import com.example.FIS.service.MarketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/market")
public class MarketController {
    MarketService marketService;
    @Autowired
    public MarketController(MarketService marketService) {
        this.marketService = marketService;
    }
    @GetMapping("") // 마켓 메인페이지 호출
    public String moveMarketPage(){
        return "market/main";
    }
    @GetMapping("/product/list") // 상품목록 조회
    public String moveProductListPage(Model model){
        List<MarketDto> marketDto = marketService.getProductList();
        model.addAttribute("list", marketDto);
        return "market/product/list";
    }
    @GetMapping("/product/{p_id}") // 개별 상품정보 상세조회
    public String moveProductInfoPage(@PathVariable String p_id, Model model){
        MarketDto marketDto = marketService.getProductInfo(p_id);
        model.addAttribute("productInfo", marketDto);
        return "market/product/productInfo";
    }
    @GetMapping("/product/add") // 상품등록 페이지이동
    public String moveProductAddPage(){
        return "market/product/add";
    }
    @PostMapping("/product/add") // 상품 등록
    public String addProduct(MarketDto marketDto){
        marketService.addProduct(marketDto);
        return "redirect:/market/product/list";
    }
    @PostMapping("/product/{p_id}/delete") // 상품 삭제
    public String deleteProduct(@PathVariable String p_id){
        marketService.deleteProduct(p_id);
        return "redirect:/market/product/list";
    }

}
