package com.ebook.polaris.util;

import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;

import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ESDataImport {
	private static int cnt = 0;
	
	public static void main(String[] args) throws UnknownHostException {
	        /* 
	         * 创建客户端，所有的操作都由客户端开始，这个就好像是JDBC的Connection对象 
	         * 用完记得要关闭 
	         */
	     	File root = new File("C://ebook//bookInfo//revisedjsonInfo");
	       importData(root);
	       
    }
	
	
	public static void importData(File srcfile) throws UnknownHostException{
		/*
		 * 之前导入遇到一些问题
		 * 开始导入速度非常快
		 * 一旦导入了一两百个文件，速度变得非常非常慢
		 * 可能是一个client导入过多卡住了
		 * 所以我们现在一次导入10个文件，就重启一下client连接
		 */
		int importOneTime = 10;
		File[] files = srcfile.listFiles();
		
		for(int startIndex = 0; startIndex < files.length; startIndex += importOneTime) {
			Settings settings = Settings.settingsBuilder().put("cluster.name","ebook").put("client.transport.sniff", true).build();
	        Client client = TransportClient.builder().settings(settings).build().addTransportAddress(new   InetSocketTransportAddress(InetAddress.getByName("localhost"),   9300));
	        BulkRequestBuilder bulkRequest = client.prepareBulk();
	        
			int index = 0;
			while(index < importOneTime && (startIndex + index) < files.length) {
				File file = files[startIndex + index];
				
				//读取文件生成json数组
		        String JsonContext = Util.ReadFile(file);
		        System.out.println(file+":read");
		        JSONArray jsonArray = JSONArray.fromObject(JsonContext);
		        
		        //循环遍历文件体统的
		        for (int i = 0; i < jsonArray.size(); i++) {  
		        	String db = "polaris"; // 相当于数据库名  
		        	String type = "ebook"; // 相当于表名  
		        	JSONObject jsonObject = jsonArray.getJSONObject(i);
			        @SuppressWarnings("unchecked")
					IndexRequest request = client  
			                .prepareIndex(db, type, jsonObject.get("md5").toString()).setSource(jsonObject)  
			                .request();  
			       
			        bulkRequest.add(request);  
		        }
		        BulkResponse bulkResponse = bulkRequest.execute().actionGet();  
		        if (bulkResponse.hasFailures()) {  
		            System.out.println("批量导入索引错误");
		        } 
		        System.out.println(file+":ok");
		        index++;
			}
			client.close();
		}
	}
}
