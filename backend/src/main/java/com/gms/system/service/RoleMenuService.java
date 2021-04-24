package com.gms.system.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.gms.system.domain.RoleMenu;

import java.util.List;

public interface RoleMenuService extends IService<RoleMenu> {
    List<RoleMenu> getRoleMenusByRoleId(String roleId);
}
