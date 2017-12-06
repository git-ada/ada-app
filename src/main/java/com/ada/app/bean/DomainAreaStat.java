package com.ada.app.bean;

import java.util.Date;

/**
 * 域名统计结果
 */
public class DomainAreaStat {

	    /** 站点ID */
		private Integer siteId;                    
	    /** 渠道ID */
		private Integer domainId;                    
	    /** IP */
		private Integer ip;                    
	    /** PV */
		private Integer pv;                    
	    /** 独立客户端 */
		private Integer uv;                    
	    /** 老用户数量 */
		private Integer olduserip;                    
	    /** 登录用户数 */
		private Integer loginip;                    
	    /** 老IP */
		private Integer oldip;                    
	    /** 目标页访问 */
		private Integer targetpageip;                    
	    /** 1-2次点击 */
		private Integer clickip1;                    
	    /** 3-5次点击 */
		private Integer clickip2;                    
	    /** 6-10次点击 */
		private Integer clickip3;                    
	    /** 10+次点击 */
		private Integer clickip4;                    
	    /** 停留时长0-5秒 */
		private Integer staytimeip1;                    
	    /** 停留时长6-10 */
		private Integer staytimeip2;                    
	    /** 停留时长11-15秒 */
		private Integer staytimeip3;                    
	    /** 停留时长16-30秒 */
		private Integer staytimeip4;                    
	    /** 1-2次滚动 */
		private Integer scrollip1;                    
	    /** 3-5次滚动 */
		private Integer scrollip2;                    
	    /** 6-10次滚动 */
		private Integer scrollip3;                    
	    /** 10+次滚动 */
		private Integer scrollip4;                    
	    /** 1-2次移动 */
		private Integer moveip1;                    
	    /** 3-5次移动 */
		private Integer moveip2;                    
	    /** 6-10次移动 */
		private Integer moveip3;                    
	    /** 10+次移动 */
		private Integer moveip4;                    
	    /** 日期 */
		private Date date;
		
		public DomainAreaStat() {
			super();
		}
		public DomainAreaStat(Integer siteId, Integer domainId, Integer ip,
				Integer pv, Integer uv, Integer olduserip, Integer loginip,
				Integer oldip, Integer targetpageip, Integer clickip1,
				Integer clickip2, Integer clickip3, Integer clickip4,
				Integer staytimeip1, Integer staytimeip2, Integer staytimeip3,
				Integer staytimeip4, Integer scrollip1, Integer scrollip2,
				Integer scrollip3, Integer scrollip4, Integer moveip1,
				Integer moveip2, Integer moveip3, Integer moveip4) {
			super();
			this.siteId = siteId;
			this.domainId = domainId;
			this.ip = ip;
			this.pv = pv;
			this.uv = uv;
			this.olduserip = olduserip;
			this.loginip = loginip;
			this.oldip = oldip;
			this.targetpageip = targetpageip;
			this.clickip1 = clickip1;
			this.clickip2 = clickip2;
			this.clickip3 = clickip3;
			this.clickip4 = clickip4;
			this.staytimeip1 = staytimeip1;
			this.staytimeip2 = staytimeip2;
			this.staytimeip3 = staytimeip3;
			this.staytimeip4 = staytimeip4;
			this.scrollip1 = scrollip1;
			this.scrollip2 = scrollip2;
			this.scrollip3 = scrollip3;
			this.scrollip4 = scrollip4;
			this.moveip1 = moveip1;
			this.moveip2 = moveip2;
			this.moveip3 = moveip3;
			this.moveip4 = moveip4;
		}
		public Integer getSiteId() {
			return siteId;
		}
		public void setSiteId(Integer siteId) {
			this.siteId = siteId;
		}
		public Integer getDomainId() {
			return domainId;
		}
		public void setDomainId(Integer domainId) {
			this.domainId = domainId;
		}
		public Integer getIp() {
			return ip;
		}
		public void setIp(Integer ip) {
			this.ip = ip;
		}
		public Integer getPv() {
			return pv;
		}
		public void setPv(Integer pv) {
			this.pv = pv;
		}
		public Integer getUv() {
			return uv;
		}
		public void setUv(Integer uv) {
			this.uv = uv;
		}
		public Integer getOlduserip() {
			return olduserip;
		}
		public void setOlduserip(Integer olduserip) {
			this.olduserip = olduserip;
		}
		public Integer getLoginip() {
			return loginip;
		}
		public void setLoginip(Integer loginip) {
			this.loginip = loginip;
		}
		public Integer getOldip() {
			return oldip;
		}
		public void setOldip(Integer oldip) {
			this.oldip = oldip;
		}
		public Integer getTargetpageip() {
			return targetpageip;
		}
		public void setTargetpageip(Integer targetpageip) {
			this.targetpageip = targetpageip;
		}
		public Integer getClickip1() {
			return clickip1;
		}
		public void setClickip1(Integer clickip1) {
			this.clickip1 = clickip1;
		}
		public Integer getClickip2() {
			return clickip2;
		}
		public void setClickip2(Integer clickip2) {
			this.clickip2 = clickip2;
		}
		public Integer getClickip3() {
			return clickip3;
		}
		public void setClickip3(Integer clickip3) {
			this.clickip3 = clickip3;
		}
		public Integer getClickip4() {
			return clickip4;
		}
		public void setClickip4(Integer clickip4) {
			this.clickip4 = clickip4;
		}
		public Integer getStaytimeip1() {
			return staytimeip1;
		}
		public void setStaytimeip1(Integer staytimeip1) {
			this.staytimeip1 = staytimeip1;
		}
		public Integer getStaytimeip2() {
			return staytimeip2;
		}
		public void setStaytimeip2(Integer staytimeip2) {
			this.staytimeip2 = staytimeip2;
		}
		public Integer getStaytimeip3() {
			return staytimeip3;
		}
		public void setStaytimeip3(Integer staytimeip3) {
			this.staytimeip3 = staytimeip3;
		}
		public Integer getStaytimeip4() {
			return staytimeip4;
		}
		public void setStaytimeip4(Integer staytimeip4) {
			this.staytimeip4 = staytimeip4;
		}
		public Integer getScrollip1() {
			return scrollip1;
		}
		public void setScrollip1(Integer scrollip1) {
			this.scrollip1 = scrollip1;
		}
		public Integer getScrollip2() {
			return scrollip2;
		}
		public void setScrollip2(Integer scrollip2) {
			this.scrollip2 = scrollip2;
		}
		public Integer getScrollip3() {
			return scrollip3;
		}
		public void setScrollip3(Integer scrollip3) {
			this.scrollip3 = scrollip3;
		}
		public Integer getScrollip4() {
			return scrollip4;
		}
		public void setScrollip4(Integer scrollip4) {
			this.scrollip4 = scrollip4;
		}
		public Integer getMoveip1() {
			return moveip1;
		}
		public void setMoveip1(Integer moveip1) {
			this.moveip1 = moveip1;
		}
		public Integer getMoveip2() {
			return moveip2;
		}
		public void setMoveip2(Integer moveip2) {
			this.moveip2 = moveip2;
		}
		public Integer getMoveip3() {
			return moveip3;
		}
		public void setMoveip3(Integer moveip3) {
			this.moveip3 = moveip3;
		}
		public Integer getMoveip4() {
			return moveip4;
		}
		public void setMoveip4(Integer moveip4) {
			this.moveip4 = moveip4;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}   
		
		
	
	
}
