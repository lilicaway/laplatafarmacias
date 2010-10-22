package com.google.code.laplatafarmacias.volatileProject.affinity;

import java.util.Calendar;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.google.code.unlp.tesis.volatiler.affinity.AbstractDateAfinityResolver;

public class EvenMinutesAffinityResolver extends AbstractDateAfinityResolver {

    @Override
    public boolean isActiveNow(ServletRequest request, ServletResponse response) {
	Calendar today = Calendar.getInstance();
	return today.get(Calendar.MINUTE) % 2 == 0;
    }

}
