package com.google.code.laplatafarmacias.volatileProject.filter.regex;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import com.google.code.unlp.tesis.volatiler.filter.regex.AbstractRegexMultipleReplacementFilter;
import com.google.code.unlp.tesis.volatiler.filter.regex.Replacer;

public class DetectVaccinesFarmacyOnDuty extends
        AbstractRegexMultipleReplacementFilter {

    private static final Replacer[] replaceArray = {
            new Replacer("var description = \"\";",
                    "var description = ''; var hasVaccines = '' ;"),
            new Replacer(
                    "\\} else if \\(elements.item\\(j\\).nodeName == \"description\"\\) \\{",
                    "} else if (elements.item(j).nodeName == 'hasVaccines') {\n"
                            + "  hasVaccines = elements.item(j).textContent == null ? elements.item(j).text : elements.item(j).textContent; \n"
                            + " title = 'Vacunas disponibles:' + title\n"
                            + "} else if (elements.item(j).nodeName == 'description') {"),
            new Replacer(" var item = createMarker\\(point,title,html\\);",
                    "var item = createMarker\\(point,title,html,hasVaccines\\);"),
            new Replacer("function createMarker\\(point,name,html\\) \\{",
                    "function createMarker(point,name,html,hasVaccines) {"),
            new Replacer(
                    "var marker = new GMarker\\(point\\);",
                    " var greenIcon = new GIcon(G_DEFAULT_ICON);\n "
                            + "greenIcon.image = 'http://www.wasatchcountyhd.org/Portals/0/images/Syringe_and_Vial.png';\n"
                            + "greenIcon.size = new GSize(38, 38); \n"
                            + "var markerOptions = { icon:greenIcon };\n "
                            + "if (hasVaccines) {\n"
                            + "  var marker = new GMarker(point, markerOptions);\n"
                            + "} else { \n"
                            + "  var marker = new GMarker(point);\n" + "}\n") };
    static final List<Replacer> replacers = Collections.unmodifiableList(Arrays
            .asList(replaceArray));

    @Override
    public List<Replacer> getReplacers() {
        return replacers;
    }

}
