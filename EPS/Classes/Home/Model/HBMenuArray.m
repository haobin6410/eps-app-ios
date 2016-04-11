//
//  HBMenuArray.m
//  EPS
//
//  Created by 郝斌 on 15/8/20.
//  Copyright © 2015年 hainx. All rights reserved.
//

#import "HBMenuArray.h"
#import "HBMenu.h"

@implementation HBMenuArray

+ (NSArray *)menuArray
{
    NSMutableArray *mArray = [NSMutableArray array];
    
    HBMenu *menu = nil;

    menu = [HBMenu menuWithCode:@"icon_ApplyAudit" title:@"计划审批" pic:@"\U0000e2a5"];
    [mArray addObject:menu];
    
    menu = [HBMenu menuWithCode:@"icon_ApplySend" title:@"待分派计划" pic:@"\U0000e2a2"];
    [mArray addObject:menu];

    menu = [HBMenu menuWithCode:@"icon_ApplyHandle" title:@"待处理计划" pic:@"\U0000e2a3"];
    [mArray addObject:menu];

    menu = [HBMenu menuWithCode:@"icon_ApplyPrice" title:@"待定价计划" pic:@"\U0000e2a4"];
    [mArray addObject:menu];
    
    menu = [HBMenu menuWithCode:@"icon_Check" title:@"单据审批" pic:@"\U0000e0a2"];
    [mArray addObject:menu];
    
    menu = [HBMenu menuWithCode:@"icon_ProjectBid" title:@"招标项目" pic:@"\U0000e4a2"];
    [mArray addObject:menu];

    menu = [HBMenu menuWithCode:@"icon_ProjectQuery" title:@"询价项目" pic:@"\U0000e4a3"];
    [mArray addObject:menu];

//    menu = [HBMenu menuWithCode:@"icon_ProjectCompete" title:@"竞价项目" pic:@"\U0000e4a4"];
//    [mArray addObject:menu];

    
    menu = [HBMenu menuWithCode:@"icon_SupplierReg" title:@"供应商准入" pic:@"\U0000e1a2"];
    [mArray addObject:menu];

    menu = [HBMenu menuWithCode:@"icon_SupplierInfo" title:@"供应商信息变更" pic:@"\U0000e1a3"];
    [mArray addObject:menu];
    
    
//    menu = [HBMenu menuWithCode:@"icon_Briefcase" title:@"日常办公" pic:@"\U0000e0a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Check" title:@"工作流审核" pic:@"\U0000e0a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Dashboard" title:@"项目进度跟踪" pic:@"\U0000e0a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Sales" title:@"销售商机" pic:@"\U0000e0a4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Supplier" title:@"供应商、正常供应商" pic:@"\U0000e1a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SupplierReg" title:@"供应商注册处理" pic:@"\U0000e1a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SupplierInfo" title:@"供应商信息处理" pic:@"\U0000e1a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SupplierRelation" title:@"供应关系处理" pic:@"\U0000e1a4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SupplierFrozen" title:@"已冻结供应商" pic:@"\U0000e1a5"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SupplierFile" title:@"资质文件管理" pic:@"\U0000e1a6"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SupplierDel" title:@"已淘汰供应商" pic:@"\U0000e1a7"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SupplierSAP" title:@"SAP供应商同步" pic:@"\U0000e1a8"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Supplier_Info_Update" title:@"供应商信息变更处理" pic:@"\U0000e1a9"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Supplier_Level" title:@"供应关系评级调整" pic:@"\U0000e1aa"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Supplier_Relation_Update" title:@"新增供应关系、供应关系状态调整" pic:@"\U0000e1ab"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Supplier_Status" title:@"供应商状态调整" pic:@"\U0000e1ac"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ApplyAdd" title:@"采购申请、新增采购申请" pic:@"\U0000e2a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ApplySend" title:@"待分派采购申请" pic:@"\U0000e2a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ApplyHandle" title:@"待处理采购申请" pic:@"\U0000e2a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ApplyPrice" title:@"待定价采购申请" pic:@"\U0000e2a4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ApplyBuy" title:@"待订购采购申请" pic:@"\U0000e2a5"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_NewMaterialHandle" title:@"待新料干预" pic:@"\U0000e3a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_NewMaterial" title:@"新料信息库、新料干预" pic:@"\U0000e3a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_NewMaterialAdd" title:@"新料申报" pic:@"\U0000e3a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_NewMaterialFold" title:@"待归档新料" pic:@"\U0000e3a4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_NewMaterialP3" title:@"待归档P3新料" pic:@"\U0000e3a5"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Project" title:@"定价方式、项目" pic:@"\U0000e4a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectBid" title:@"招标" pic:@"\U0000e4a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectQuery" title:@"询价" pic:@"\U0000e4a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectCompete" title:@"竞价" pic:@"\U0000e4a4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectPublish" title:@"待立项发布" pic:@"\U0000e4a5"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectTender" title:@"待投标管理" pic:@"\U0000e4a6"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectOpenning" title:@"待开标" pic:@"\U0000e4a7"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectExam" title:@"待资格审查" pic:@"\U0000e4a8"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectCompare" title:@"待评标" pic:@"\U0000e4a9"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectDiscuss" title:@"待磋商" pic:@"\U0000e4aa"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectGive" title:@"待授标" pic:@"\U0000e4ab"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectFininsh" title:@"待结项" pic:@"\U0000e4ac"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectProposal" title:@"采购方案" pic:@"\U0000e4ad"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ProjectPlan" title:@"采购计划" pic:@"\U0000e4ae"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Contract" title:@"执行中合同" pic:@"\U0000e5a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ContractChanging" title:@"变更中合同" pic:@"\U0000e5a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ContractActive" title:@"履约中合同" pic:@"\U0000e5a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ContractCabinet" title:@"合同信息一览" pic:@"\U0000e5a4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_ContractManagement" title:@"合同管理" pic:@"\U0000e5a5"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Order" title:@"订单" pic:@"\U0000e5b1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_OrderAdd" title:@"添加订单" pic:@"\U0000e5b2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_OrderActive" title:@"执行中订单" pic:@"\U0000e5b3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Delivery" title:@"送货单" pic:@"\U0000e5c1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_DeliveryAdd" title:@"添加送货单" pic:@"\U0000e5c2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_DeliveryActive" title:@"待接收送货单" pic:@"\U0000e5c3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Payment" title:@"付款申请单" pic:@"\U0000e5d1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_PaymentAdd" title:@"添加付款申请" pic:@"\U0000e5d2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_PaymentActive" title:@"执行中付款申请单" pic:@"\U0000e5d3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Invocie" title:@"发票、发票校验" pic:@"\U0000e5e1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_InvoiceAdd" title:@"添加发票" pic:@"\U0000e5e2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_InvoiceActive" title:@"待发票校验" pic:@"\U0000e5e3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_InvoiceMessage" title:@"发票通知" pic:@"\U0000e5e4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Catalog" title:@"目录采购、购物车" pic:@"\U0000e6a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_CatalogMantain" title:@"采购目录维护" pic:@"\U0000e6a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_CatalogBuy" title:@"选购物资" pic:@"\U0000e6a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_CatalogPrice" title:@"价格目录一览" pic:@"\U0000e6a4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_MaterialWarehouse" title:@"物料库" pic:@"\U0000e7a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_MaterialGroup" title:@"物料组" pic:@"\U0000e7a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_MaterialCategory" title:@"物料类型" pic:@"\U0000e7a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Setup" title:@"业务设置" pic:@"\U0000e8a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupFile" title:@"资质文件维护" pic:@"\U0000e8a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupArea" title:@"区域设置" pic:@"\U0000e8a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupDictionary" title:@"数据字典管理" pic:@"\U0000e8a4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupNumber" title:@"单据编号模板" pic:@"\U0000e8a5"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupConfig" title:@"配置项管理" pic:@"\U0000e8a6"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupAppoint" title:@"申请受理人设置" pic:@"\U0000e8a7"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupRelation" title:@"供应关系设置" pic:@"\U0000e8a8"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupFactory" title:@"SAP工厂" pic:@"\U0000e8a9"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupCostCenter" title:@"成本中心" pic:@"\U0000e8aa"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupTemplate" title:@"公告模板" pic:@"\U0000e8ab"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupMail" title:@"短信邮件模板" pic:@"\U0000e8ac"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupSection" title:@"栏目维护" pic:@"\U0000e8ad"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupNews" title:@"新闻维护" pic:@"\U0000e8ae"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupTalk" title:@"留言与投诉" pic:@"\U0000e8af"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupWorkFlow" title:@"工作流模板设置" pic:@"\U0000e8b1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupTask" title:@"定时任务配置" pic:@"\U0000e8b2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupUnit" title:@"计量单位管理" pic:@"\U0000e8b3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupGroup" title:@"采购组" pic:@"\U0000e8b4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SetupCategory" title:@"采购类别" pic:@"\U0000e8b5"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_Setting" title:@"系统设置" pic:@"\U0000e9a1"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingModule" title:@"模块管理" pic:@"\U0000e9a2"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingFunction" title:@"功能管理" pic:@"\U0000e9a3"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingPages" title:@"页面管理" pic:@"\U0000e9a4"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingMenu" title:@"菜单管理" pic:@"\U0000e9a5"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingAuthorize" title:@"权限管理" pic:@"\U0000e9a6"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingOrgnization" title:@"组织结构管理" pic:@"\U0000e9a7"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingCharactor" title:@"角色管理" pic:@"\U0000e9a8"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingUser" title:@"员工管理" pic:@"\U0000e9a9"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingPassword" title:@"修改密码" pic:@"\U0000e9aa"];
//    [mArray addObject:menu];
    
//    menu = [HBMenu menuWithCode:@"icon_SettingLocation" title:@"日常办公" pic:@"\U0000e9ab"];
//    [mArray addObject:menu];
//    
//    menu = [HBMenu menuWithCode:@"icon_SettingArea" title:@"日常办公" pic:@"\U0000e9ac"];
//    [mArray addObject:menu];
    
    
    return mArray;
}

@end
