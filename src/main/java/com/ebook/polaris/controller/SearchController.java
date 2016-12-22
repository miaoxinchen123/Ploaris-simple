package com.ebook.polaris.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.jboss.netty.util.internal.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebook.polaris.dto.EBookDto;
import com.ebook.polaris.model.User;
import com.ebook.polaris.util.ElasticsearchUtil;
import com.ebook.polaris.util.Page;

import javassist.expr.NewArray;


@Controller  
public class SearchController {
	public	static final int PAGE_SIZE = 20;
	public	static final String INDEX_NAME = "polaris";
	public	static final String  TYPE_NAME = "ebook";
	/** 总记录数 使用静态变量的方式缓存 **/
	private Long total;
	/** 搜索条件**/
	public	String searchOption;
	/** 搜索字段**/
	public	String searchInput;
	public	Page page;
	/** 查询结果集对象 **/
	public	List<Map<String, Object>> pageList;
	public	int k =1;
		
		
	private SearchResponse response;

	@RequestMapping(value="/indexSearch", method = {RequestMethod.POST })
	public String search(HttpServletRequest request, Model model) {  
        searchOption = request.getParameter("searchOption");  
        searchInput = request.getParameter("searchInput");  
        String pageNow = request.getParameter("pageNow");
        int pageNowInt;
        if("".equals(pageNow)|| pageNow ==null){
        	pageNowInt =1;
        }else{
        	pageNowInt =  Integer.parseInt(pageNow);
        }
        
		response = ElasticsearchUtil.searcher(INDEX_NAME, TYPE_NAME,
				pageNowInt, PAGE_SIZE, searchOption,searchInput,searchOption);
		/** 总记录数 **/
		total = response.getHits().totalHits();
		SearchHits searchHits = response.getHits();
		SearchHit[] hits = searchHits.getHits();
	    pageList = new ArrayList<Map<String, Object>>();
	   
		for (int i = 0; i < hits.length; i++) {
			Map<String, Object>  map = new HashMap<String, Object>();
			SearchHit hit = hits[i];
			String content = ElasticsearchUtil.getHighlightFields(hit,searchOption);
			map.put("md5", hit.getId());
			if(searchOption.equals("title")){
				map.put("title",content);
				map.put("srcTitle",hit.getSource().get("title"));
			}else{
				map.put("title", hit.getSource().get("title"));
			}
			if(searchOption.equals("authors")){
				map.put("authors",content);
			}else{
				map.put("authors", hit.getSource().get("authors"));
			}
			map.put("year", hit.getSource().get("year"));
			BigDecimal price1 = new BigDecimal(0);
			if(hit.getSource().get("pages")!=null && hit.getSource().get("pages")!=""){
				double price = k * (50 + 0.05 * (min(800, Integer.parseInt(hit.getSource().get("pages").toString())) - 300) + 0.0000006 * (min(60000000,  Integer.parseInt(hit.getSource().get("size").toString())) - 10000000));
				BigDecimal b = new BigDecimal(price);  
			    price1 = b.setScale(2,BigDecimal.ROUND_HALF_UP);  
			}else{
				double price = k * (50  + 0.0000006 * (min(60000000,  Integer.parseInt(hit.getSource().get("size").toString())) - 10000000));
				BigDecimal b = new BigDecimal(price);  
			    price1 = b.setScale(2,BigDecimal.ROUND_HALF_UP);  
			}
			
			map.put("price", price1.multiply(new BigDecimal(1.8)).setScale(2,BigDecimal.ROUND_HALF_UP));
			map.put("realPrice", price1);
			map.put("coverUrl", hit.getSource().get("coverUrl"));
			map.put("size", hit.getSource().get("size"));
			map.put("extension", hit.getSource().get("extension"));
			pageList.add(map);
		}
		if(total.intValue()>100){
			if (pageNow != null && !pageNow.equals("")) {
	    		page = new Page(100, Integer.parseInt(pageNow));
	    	} else {
	    		page = new Page(100, 1);
	    	}
		}else{
			if (pageNow != null && !pageNow.equals("")) {
	    		page = new Page(total.intValue(), Integer.parseInt(pageNow));
	    	} else {
	    		page = new Page(total.intValue(), 1);
	    	}
		}
		
		model.addAttribute("products", pageList);
    	model.addAttribute("page", page);
    	model.addAttribute("searchOption", searchOption);
    	model.addAttribute("searchInput", searchInput);
		return "/views/searchResult";  
	}
	
	@RequestMapping(value="/bookDetail")
	public String  bookDetail(HttpServletRequest request,  Model model) {
		Map<String,Object> bookDetail =ElasticsearchUtil.get(INDEX_NAME, TYPE_NAME, request.getParameter("MD5"));
		EBookDto ebookDto = new EBookDto();
		ebookDto.setAuthors(bookDetail.get("authors").toString());
		
		ebookDto.setCoverUrl(bookDetail.get("coverUrl").toString());
		
		if(null!=bookDetail.get("edition")){
			ebookDto.setEdition(bookDetail.get("edition").toString());
		}else{
			ebookDto.setEdition("edition");
		}
		
		if(null!=bookDetail.get("extension")){
			ebookDto.setExtension(bookDetail.get("extension").toString());
		}else{
			ebookDto.setExtension("unKnown");
		}
		
		if(null!=bookDetail.get("isbn")){
			ebookDto.setIsbn(bookDetail.get("isbn").toString());
		}else{
			ebookDto.setIsbn("unKnown");
		}
		
		if(null!=bookDetail.get("language")){
			ebookDto.setLanguage(bookDetail.get("language").toString());
		}else{
			ebookDto.setLanguage("unKnown");
		}
		ebookDto.setMd5(bookDetail.get("md5").toString());
		if(null!=bookDetail.get("page") && false==bookDetail.get("page").toString().equals("-1")){
			ebookDto.setPages(bookDetail.get("page").toString());
		}else{
			ebookDto.setPages("unKnown");
		}
		if(null!=bookDetail.get("publisher")){
			ebookDto.setPublisher(bookDetail.get("publisher").toString());
		}else{
			ebookDto.setPublisher("unKnown");
		}
		if(null!=bookDetail.get("series")){
			ebookDto.setSeries(bookDetail.get("series").toString());
		}else{
			ebookDto.setSeries("unKnown");
		}
		ebookDto.setTitle(bookDetail.get("title").toString());
		if(null!=bookDetail.get("year")){
			ebookDto.setYear(bookDetail.get("year").toString());
		}else{
			ebookDto.setYear("unKnown");
		}
		ebookDto.setAuthors(bookDetail.get("authors").toString());
		
		BigDecimal size = new BigDecimal(bookDetail.get("size").toString());
		ebookDto.setSize(size.divide(new BigDecimal(1024*1024)).setScale(2,BigDecimal.ROUND_HALF_UP));
		
		
		BigDecimal price1 = new BigDecimal(0);
		if(bookDetail.get("pages")!=null && bookDetail.get("pages")!=""){
			double price = k * (50 + 0.05 * (min(800, Integer.parseInt(bookDetail.get("pages").toString())) - 300) + 0.0000006 * (min(60000000,  Integer.parseInt(bookDetail.get("size").toString())) - 10000000));
			BigDecimal b = new BigDecimal(price);  
		    price1 = b.setScale(2,BigDecimal.ROUND_HALF_UP);  
		}else{
			double price = k * (50 + 0.0000006 * (min(60000000,  Integer.parseInt(bookDetail.get("size").toString())) - 10000000));
			BigDecimal b = new BigDecimal(price);  
		    price1 = b.setScale(2,BigDecimal.ROUND_HALF_UP);  
		}
		
		
		ebookDto.setPrice(price1.multiply(new BigDecimal(1.8)).setScale(2,BigDecimal.ROUND_HALF_UP));
		ebookDto.setRealPrice(price1);
		model.addAttribute("book", ebookDto);
		return "/views/detail";  
	}
	
	/**
	 * 判断两个数字大小 
	 */
	static int  min(int a,int b){
		if(a>b){
			return b;
		}
		return a;
	}
}
