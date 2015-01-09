package com.tinydeal.affiliate; 

import com.tinydeal.affiliate.Affiliate;

import java.io.IOException;
import org.drools.KnowledgeBase;
import org.drools.KnowledgeBaseFactory;
import org.drools.builder.KnowledgeBuilder;
import org.drools.builder.KnowledgeBuilderFactory;
import org.drools.builder.ResourceType;
import org.drools.compiler.DroolsParserException;
import org.drools.io.ResourceFactory;
import org.drools.runtime.StatefulKnowledgeSession;
import org.junit.Test;

public class AffiliateRuleTest {

    @Test
    public void aff_test() throws IOException, DroolsParserException {
        StatefulKnowledgeSession session = initSession("/com/tinydeal/rule/affiliate/affiliate.drl");

        System.out.println("Start");

		Affiliate aff1 = new Affiliate();
		aff1.setAffiliateLevel(5);
        session.insert(aff1);


        session.fireAllRules();
        System.out.println("End");
    }

	private StatefulKnowledgeSession initSession (String filename){
		KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder();

		kbuilder.add( ResourceFactory.newClassPathResource( filename, getClass() ), ResourceType.DRL );
		if ( kbuilder.hasErrors() ) {
			System.err.println( kbuilder.getErrors().toString() );
		}

		KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();

		kbase.addKnowledgePackages( kbuilder.getKnowledgePackages() );
		StatefulKnowledgeSession ksession = kbase.newStatefulKnowledgeSession();

		return ksession;
	}
}
