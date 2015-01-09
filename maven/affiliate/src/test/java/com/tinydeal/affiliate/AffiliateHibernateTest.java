package com.tinydeal.affiliate;

import java.util.List;

import org.hibernate.Session;

import com.tinydeal.affiliate.Affiliate;
import com.tinydeal.utils.SessionUtil;
import org.junit.Test;
import java.io.IOException;


public class AffiliateHibernateTest {

	@Test
	public void h_test()  {

		Session session = SessionUtil.getSession();
		org.hibernate.Transaction tx =  session.beginTransaction();

		String hql="from Affiliate affiliate";
		List list= session.createQuery(hql).list();
		for(int i=0;i<list.size();i++)
		{
			Affiliate obj=(Affiliate)list.get(i);  
			System.out.println(obj.getCode());
		}

	}

}
