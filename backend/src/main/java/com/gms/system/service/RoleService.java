package com.gms.system.service;

import com.gms.common.domain.QueryRequest;
import com.gms.system.domain.Role;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface RoleService extends IService<Role> {

    IPage<Role> findRoles(Role role, QueryRequest request);

    List<Role> findUserRole(String username);

    Role findByName(String roleName);

}
