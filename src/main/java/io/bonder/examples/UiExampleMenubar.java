package io.bonder.examples;

import javax.servlet.annotation.WebServlet;

import com.vaadin.annotations.Theme;
import com.vaadin.annotations.VaadinServletConfiguration;
import com.vaadin.server.VaadinRequest;
import com.vaadin.server.VaadinServlet;
import com.vaadin.ui.TabSheet;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;

import com.vaadin.ui.MenuBar;
import com.vaadin.ui.MenuBar.MenuItem;
import com.vaadin.ui.HorizontalSplitPanel;
import com.vaadin.ui.UI;
//import com.vaadin.ui.themes.ValoTheme;

@Theme("valo")
@SuppressWarnings("serial")
public class UiExampleMenubar extends UI {

    @Override
    protected void init(VaadinRequest request) {
        final MenuBar barmenu = new MenuBar();
        MenuItem drinks = barmenu.addItem("Beverages", null, null);

        // Submenu item with a sub-submenu
        MenuItem hots = drinks.addItem("Hot", null, null);
        barmenu.setWidth(100.0f, Unit.PERCENTAGE);
        VerticalLayout content = new VerticalLayout();
        setContent(content);
        
        HorizontalLayout titleBar = new HorizontalLayout();
        titleBar.setWidth("100%");
        content.addComponent(titleBar);
        
        Label title = new Label("The Ultimate Cat Finder");
        titleBar.addComponent(barmenu);
        titleBar.setExpandRatio(barmenu, 1.0f); // Expand
        
        Label titleComment = new Label("for Vaadin");
        titleComment.setSizeUndefined(); // Take minimum space
        titleBar.addComponent(titleComment);
        //final TabSheet tabSheet = new TabSheet();
        //tabSheet.addTab(new BasicExample());
        //VaadinUIComponent ui1 = new VaadinUIComponent("http://localhost:8081");
        //ui1.setSizeFull();
        //ui1.attach();
        //HorizontalSplitPanel split = new HorizontalSplitPanel(ui1,ui1);
        //HorizontalSplitPanel split = new HorizontalSplitPanel(barmenu,ui1);
        //split.setSizeFull();
        //tabSheet.addStyleName(ValoTheme.TABSHEET_PADDED_TABBAR);
        
        //setContent(barmenu);
    }

    @WebServlet(value = "/*", asyncSupported = true)
    @VaadinServletConfiguration(productionMode = false, ui = UiExampleMenubar.class)
    public static class Servlet extends VaadinServlet {}

}
