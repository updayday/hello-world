package com.gome.storage.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;

import com.gome.o2m.Response;
import com.gome.o2m.storage.dto.SkuSaleOrgStorageStatus;
import com.gome.o2m.storage.service.WarehouseStorageTransferService;


@Service("pushStorageService")
public class PushStorageService {

	@Autowired
	private WarehouseStorageTransferService warehouseStorageTransferService;
	
	private static final Logger log = LoggerFactory.getLogger(PushStorageService.class);
	
	
	  private Jedis jedis; 
	       
	
	  public void pushStorage(){
		  jedis = new Jedis("10.128.31.102", 6380);
	      jedis.auth("wd300_redis2016");  
		String storeCode="A0LX";
		String saleOrgCode="5001";
		List<String> storages=new ArrayList<String>();
		storages.add("BX9O01");
		storages.add("BX7H01");
		storages.add("BX7H3C");
		try {
			Response<List<SkuSaleOrgStorageStatus>> response=warehouseStorageTransferService.getSkuSaleOrgStorageStatusSnapshotFromDBForGMZX(storeCode, storages, saleOrgCode);
			List<SkuSaleOrgStorageStatus> lists=response.getResult();
			List<String> sameskus=new ArrayList<String>();
			List<String> diffskus=new ArrayList<String>();
			log.info("商品数量："+lists.size());
			for(SkuSaleOrgStorageStatus skuSaleOrgStorageStatus:lists){
				String key="1111"+skuSaleOrgStorageStatus.getSaleOrgCode()+skuSaleOrgStorageStatus.getSkuId();
				int num=skuSaleOrgStorageStatus.getNumSaleable();
//				int cacheNum=Integer.valueOf(jedis.get(key));
				if(jedis.get(key)==null){
					jedis.set(key, String.valueOf(num));
					diffskus.add(key);
					log.info("商品："+key+",之前的数量是：0"+",现在的数量是："+num);
				}else{
					int cacheNum=Integer.valueOf(jedis.get(key));
					if(num==cacheNum){
						sameskus.add(key);
					}else{
						jedis.set(key, String.valueOf(num));
						diffskus.add(key);
						log.info("商品："+key+",之前的数量是："+cacheNum+",现在的数量是："+num);
					}
				}
			}
			log.info("数量不变的商品数量："+sameskus.size());
			log.info("数量变更的商品数量："+diffskus.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
