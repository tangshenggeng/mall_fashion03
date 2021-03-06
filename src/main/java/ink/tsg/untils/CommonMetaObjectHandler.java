package ink.tsg.untils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.reflection.MetaObject;

import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
/**
 * 自定义填充公共字段 
 * */
public class CommonMetaObjectHandler extends MetaObjectHandler {
	
	/**
	 * 插入时
	 * */
	@Override
	public void insertFill(MetaObject metaObject) {
		// custState 自动填充为 1（未删除状态）
		Object custState = getFieldValByName("custState", metaObject);
		if (custState == null) {
            setFieldValByName("custState", 1, metaObject);
        }
		Object waresDel = getFieldValByName("waresDel", metaObject);
		if (waresDel == null) {
			setFieldValByName("waresDel", 1, metaObject);
		}
		Object carState = getFieldValByName("carState", metaObject);
		if (carState == null) {
			setFieldValByName("carState", 1, metaObject);
		}
		Object contactState = getFieldValByName("contactState", metaObject);
		if (contactState == null) {
			setFieldValByName("contactState", 1, metaObject);
		}
		// creatTime自动填充为当前时间
		Object creatTime = getFieldValByName("creatTime", metaObject);
		if (creatTime == null) {
			Date date = new Date();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
            setFieldValByName("creatTime", dateFormat.format(date), metaObject);
        }
		Object createTime = getFieldValByName("createTime", metaObject);
		if (createTime == null) {
			Date date = new Date();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
			setFieldValByName("createTime", dateFormat.format(date), metaObject);
		}
		Object payTime = getFieldValByName("payTime", metaObject);
		if (payTime == null) {
			Date date = new Date();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
			setFieldValByName("payTime", dateFormat.format(date), metaObject);
		}
	}
	/**
	 * 更新时
	 * */
	@Override
	public void updateFill(MetaObject metaObject) {
		// creatTime自动填充为当前时间
		Object updataTime = getFieldValByName("updataTime", metaObject);
		if (updataTime == null) {
			Date date = new Date();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
            setFieldValByName("updataTime", dateFormat.format(date), metaObject);
        }	
		// shipTime自动填充为当前时间
		Object shipTime = getFieldValByName("shipTime", metaObject);
		if (shipTime == null) {
			Date date = new Date();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
			setFieldValByName("shipTime", dateFormat.format(date), metaObject);
		}	
	}

}
