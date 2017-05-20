package com.ebook.polaris.dto;

import java.math.BigDecimal;

/**
 * 
 * 电子书传输DTO 
 */
public class EBookDto {
	private String md5; 
	private String coverUrl;
	private String title;
	private String authors;
	private String series;
	private String publisher;
	private String year;
	private String edition;
	private String language;
	private String pages;
	private String isbn;
	private String timeAdded;
	private String timeModified;
	private BigDecimal size;
	private String extension;
	private BigDecimal price;
	private BigDecimal realPrice;
	private boolean readable;
	private boolean available;
	private boolean exist;
	
	public EBookDto(){
		
	}
	public EBookDto(String md5, String coverUrl, String title, String authors, String series, String publisher,
			String year, String edition, String language, String pages, String isbn, String timeAdded,
			String timeModified, BigDecimal size, String extension) {
		super();
		this.md5 = md5;
		this.coverUrl = coverUrl;
		this.title = title;
		this.authors = authors;
		this.series = series;
		this.publisher = publisher;
		this.year = year;
		this.edition = edition;
		this.language = language;
		this.pages = pages;
		this.isbn = isbn;
		this.timeAdded = timeAdded;
		this.timeModified = timeModified;
		this.size = size;
		this.extension = extension;
	}
	
	public String getMd5() {
		return md5;
	}
	public void setMd5(String md5) {
		this.md5 = md5;
	}
	public String getCoverUrl() {
		return coverUrl;
	}
	public void setCoverUrl(String coverUrl) {
		this.coverUrl = coverUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthors() {
		return authors;
	}
	public void setAuthors(String authors) {
		this.authors = authors;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getEdition() {
		return edition;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getPages() {
		return pages;
	}
	public void setPages(String pages) {
		this.pages = pages;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTimeAdded() {
		return timeAdded;
	}
	public void setTimeAdded(String timeAdded) {
		this.timeAdded = timeAdded;
	}
	public String getTimeModified() {
		return timeModified;
	}
	public void setTimeModified(String timeModified) {
		this.timeModified = timeModified;
	}
	public BigDecimal getSize() {
		return size;
	}
	public void setSize(BigDecimal size) {
		this.size = size;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price1) {
		this.price = price1;
	}
	public BigDecimal getRealPrice() {
		return realPrice;
	}
	public void setRealPrice(BigDecimal price1) {
		this.realPrice = price1;
	}
	public boolean isReadable() {
		return readable;
	}
	public void setReadable(boolean readable) {
		this.readable = readable;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public boolean isExist() {
		return exist;
	}
	public void setExist(boolean exist) {
		this.exist = exist;
	}
}
