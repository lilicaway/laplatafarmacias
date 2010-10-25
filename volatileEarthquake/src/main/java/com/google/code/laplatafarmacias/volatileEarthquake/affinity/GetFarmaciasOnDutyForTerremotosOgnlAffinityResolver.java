package com.google.code.laplatafarmacias.volatileEarthquake.affinity;

import com.google.code.unlp.tesis.volatiler.affinity.AbstractOgnlAffinityResolver;

public class GetFarmaciasOnDutyForTerremotosOgnlAffinityResolver extends AbstractOgnlAffinityResolver {

    @Override
    public String getOgnlExpressionForBeforeFilterChain() {
	return "request.getParameter('terremotos') == 'true'";
    }

    @Override
    public String getOgnlExpressionForAfterFilterChain() {
	return "true";
    }

}
