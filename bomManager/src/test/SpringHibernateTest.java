package test;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.manager.dao.BomDAO;
import com.manager.dao.UserDAO;
import com.manager.dao.impl.BomDAOImpl;
import com.manager.entity.Bom;
import com.manager.entity.BomId;
import com.manager.service.BomService;
import com.manager.service.UserService;
import com.manager.service.impl.BomServiceImpl;


public class SpringHibernateTest {

	private ApplicationContext ctx;
	private UserService service  = null;
	private BomService bomService  = null;
	private BomDAO bomDAO  = null;
	{
		ctx = new ClassPathXmlApplicationContext("applicationContext*.xml");
/*		userDao = ctx.getBean(UserDao.class);*/
		bomDAO = (BomDAO) ctx.getBean("bomDAO");
		bomService = (BomService) ctx.getBean("bomService");
	}
	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() throws SQLException {
		DataSource ds = ctx.getBean(DataSource.class);
		System.out.println(ds.getConnection());
	}
	@Test
	public void test2() throws SQLException {
		HashMap sqlParams = new HashMap();
		StringBuffer hql = new StringBuffer(" select new com.manager.entity.Bom(e.id,"
				+ " e.topName, e.partName, e.fName, e.secq, e.useQty, e.editor, e.datetime, "
				+ "s.partSpec, s.tuNumber, s.partStandard, s.partModel) "
				+ "From Bom e ,Material s where e.id.partNumber =  s.id.partnumber ");
		List<Bom> list = bomDAO.executeHQL(hql.toString(), sqlParams);
		System.out.println(list);
	} 
	
	@Test
	public void test3() throws SQLException {
		HashMap formParams = new HashMap<String,Object>(); 
		Bom bom =new Bom();
		BomId id = new BomId();
//		id.setPartNumber("HT2016.01");
		id.setTopPartnumber("HT2016.01");
		bom.setId(id);
		System.out.println(bomService.getList(formParams, bom));
	} 
	@Test
	public void test4(){
		BomId fatherId = new BomId();
		fatherId.setTopPartnumber("HT2016.01");
		fatherId.setPartNumber("HT2016.01");
		fatherId.setF_Partnumber("HT2016.01");
		System.out.println(bomService.getBom(fatherId));
	}
	@Test
	public void testGetNormalMaterial(){
		BomId fatherId = new BomId();
		fatherId.setTopPartnumber("HT2016.01");
		Bom bom = new Bom();
		bom.setId(fatherId);
		System.out.println(bomService.getNormalMaterial(bom));
	}
	
	@Test
	public void test5(){
		BomId id = new BomId();
		id.setF_Partnumber("HT2016.01");
		id.setTopPartnumber("HT2016.01");
		id.setPartNumber("HT2016.01.01");
		Bom bom = new Bom();
		bom.setId(id);
		bom.setEditor("lyl");
		bom.setPartName("推杆");
		bom.setUseQty(140.04);
		HashMap formParams = new HashMap<String,Object>();
		formParams.put("alterPartNumber", "HT2016.01.05B");
		bomService.editBom(bom, formParams);
	}
	
}
