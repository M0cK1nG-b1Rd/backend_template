package com.gms.system.controller;

import com.gms.common.annotation.Log;
import com.gms.common.controller.BaseController;
import com.gms.common.domain.GmsResponse;
import com.gms.common.domain.Meta;
import com.gms.common.exception.GmsException;
import com.gms.common.exception.code.Code;
import com.gms.common.utils.GmsUtil;
import com.gms.system.domain.Menu;
import com.gms.system.manager.UserManager;
import com.gms.system.service.MenuService;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

import static com.gms.common.exception.code.Code.C200;

@Slf4j
@Validated
@RestController
@RequestMapping("/menu")
public class MenuController extends BaseController {

    private String message;

    @Autowired
    private UserManager userManager;
    @Autowired
    private MenuService menuService;

    @GetMapping()
    public GmsResponse getUserRouters() throws GmsException {
        try {
            String username = GmsUtil.getCurrentUser().getUsername();
            return new GmsResponse().addCodeMessage(new Meta(
                    Code.C200.getCode(),
                    Code.C200.getDesc(),
                    "查询菜单成功"),this.userManager.getUserRouters(username));
        } catch (Exception e) {
            message = "新增菜单/按钮失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

//    @GetMapping
    public Map<String, Object> menuList(Menu menu) {
        return this.menuService.findMenus(menu);
    }

    @Log("新增菜单/按钮")
    @PostMapping
    public GmsResponse addMenu(@RequestBody @Valid Menu menu) throws GmsException {
        try {
            this.menuService.createMenu(menu);
            return new GmsResponse().addCodeMessage(new Meta(C200.getCode(), C200.getDesc(), "新增菜单/按钮成功"));
        } catch (Exception e) {
            message = "新增菜单/按钮失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }

//    @Log("删除菜单/按钮")
//    @DeleteMapping("/{menuIds}")
//    @RequiresPermissions("menu:delete")
//    public GmsResponse deleteMenus(@NotBlank(message = "{required}") @PathVariable String menuIds) throws GmsException {
//        try {
//            String[] ids = menuIds.split(StringPool.COMMA);
//            this.menuService.deleteMenus(ids);
//            return new GmsResponse().code("200").message("删除菜单/按钮成功").status("success");
//        } catch (Exception e) {
//            message = "删除菜单/按钮失败";
//            log.error(message, e);
//            throw new GmsException(message);
//        }
//    }

//    @Log("修改菜单/按钮")
//    @PutMapping
//    @RequiresPermissions("menu:update")
//    public GmsResponse updateMenu(@RequestBody @Valid Menu menu) throws GmsException {
//        try {
//            this.menuService.updateMenu(menu);
//            return new GmsResponse().code("200").message("修改菜单/按钮成功").status("success");
//        } catch (Exception e) {
//            message = "修改菜单/按钮失败";
//            log.error(message, e);
//            throw new GmsException(message);
//        }
//    }

    @PostMapping("excel")
    public void export(@RequestBody Menu menu, HttpServletResponse response) throws GmsException {
        try {
            List<Menu> menus = this.menuService.findMenuList(menu);
            ExcelKit.$Export(Menu.class, response).downXlsx(menus, false);
        } catch (Exception e) {
            message = "导出Excel失败";
            log.error(message, e);
            throw new GmsException(message);
        }
    }
}
