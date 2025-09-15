define("UsrRealty_FormPage", /**SCHEMA_DEPS*/["@creatio-devkit/common"]/**SCHEMA_DEPS*/, function/**SCHEMA_ARGS*/(sdk)/**SCHEMA_ARGS*/ {
	return {
		viewConfigDiff: /**SCHEMA_VIEW_CONFIG_DIFF*/[
			{
				"operation": "merge",
				"name": "PageTitle",
				"values": {
					"caption": "#MacrosTemplateString(#ResourceString(PageTitle_caption)#)#",
					"visible": true,
					"headingLevel": "label"
				}
			},
			{
				"operation": "merge",
				"name": "TagSelect",
				"values": {
					"tagInRecordSourceSchemaName": "TagInRecord"
				}
			},
			{
				"operation": "merge",
				"name": "Tabs",
				"values": {
					"styleType": "default",
					"mode": "tab",
					"bodyBackgroundColor": "primary-contrast-500",
					"selectedTabTitleColor": "auto",
					"tabTitleColor": "auto",
					"underlineSelectedTabColor": "auto",
					"headerBackgroundColor": "auto"
				}
			},
			{
				"operation": "merge",
				"name": "CardToggleTabPanel",
				"values": {
					"styleType": "default",
					"bodyBackgroundColor": "primary-contrast-500",
					"selectedTabTitleColor": "auto",
					"tabTitleColor": "auto",
					"underlineSelectedTabColor": "auto",
					"headerBackgroundColor": "auto"
				}
			},
			{
				"operation": "merge",
				"name": "Feed",
				"values": {
					"dataSourceName": "PDS",
					"entitySchemaName": "UsrRealty"
				}
			},
			{
				"operation": "merge",
				"name": "AttachmentList",
				"values": {
					"columns": [
						{
							"id": "40d9f078-324d-4bbf-a85b-694993ca5fea",
							"code": "AttachmentListDS_Name",
							"caption": "#ResourceString(AttachmentListDS_Name)#",
							"dataValueType": 28,
							"width": 200
						}
					]
				}
			},
			{
				"operation": "insert",
				"name": "ActionsButton",
				"values": {
					"type": "crt.Button",
					"caption": "#ResourceString(ActionsButton_caption)#",
					"color": "default",
					"disabled": false,
					"size": "medium",
					"iconPosition": "left-icon",
					"visible": true,
					"icon": "actions-button-icon",
					"menuItems": [],
					"clickMode": "menu"
				},
				"parentName": "CardToggleContainer",
				"propertyName": "items",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "RunAVGWebServiceMenuItem",
				"values": {
					"type": "crt.MenuItem",
					"caption": "#ResourceString(RunAVGWebServiceMenuItem_caption)#",
					"visible": true,
					"icon": "gear-button-icon",
					"clicked": {
						"request": "usr.RunWebServiceButtonRequest"
					}
				},
				"parentName": "ActionsButton",
				"propertyName": "menuItems",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "RealtyVisitsProcess",
				"values": {
					"type": "crt.MenuItem",
					"caption": "#ResourceString(RealtyVisitsProcess_caption)#",
					"visible": true,
					"clicked": {
						"request": "crt.RunBusinessProcessRequest",
						"params": {
							"processName": "UsrProcess_79c30dfUsrRealty2",
							"processRunType": "ForTheSelectedPage",
							"saveAtProcessStart": true,
							"showNotification": true,
							"recordIdProcessParameterName": "RealtyIdParameter"
						}
					},
					"icon": "process-button-icon"
				},
				"parentName": "ActionsButton",
				"propertyName": "menuItems",
				"index": 1
			},
			{
				"operation": "insert",
				"name": "UsrTitle",
				"values": {
					"layoutConfig": {
						"column": 1,
						"row": 1,
						"colSpan": 1,
						"rowSpan": 1
					},
					"type": "crt.Input",
					"label": "$Resources.Strings.UsrName",
					"control": "$UsrName",
					"labelPosition": "auto",
					"multiline": false
				},
				"parentName": "SideAreaProfileContainer",
				"propertyName": "items",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "Price",
				"values": {
					"layoutConfig": {
						"column": 1,
						"colSpan": 1,
						"row": 2,
						"rowSpan": 1
					},
					"type": "crt.NumberInput",
					"label": "$Resources.Strings.PDS_UsrPrice_9osr7nl",
					"labelPosition": "auto",
					"control": "$PDS_UsrPrice_9osr7nl"
				},
				"parentName": "SideAreaProfileContainer",
				"propertyName": "items",
				"index": 1
			},
			{
				"operation": "insert",
				"name": "Area",
				"values": {
					"layoutConfig": {
						"column": 1,
						"colSpan": 1,
						"row": 3,
						"rowSpan": 1
					},
					"type": "crt.NumberInput",
					"label": "$Resources.Strings.PDS_UsrArea_plzwh86",
					"labelPosition": "auto",
					"control": "$PDS_UsrArea_plzwh86"
				},
				"parentName": "SideAreaProfileContainer",
				"propertyName": "items",
				"index": 2
			},
			{
				"operation": "insert",
				"name": "Commission",
				"values": {
					"layoutConfig": {
						"column": 1,
						"colSpan": 1,
						"row": 4,
						"rowSpan": 1
					},
					"type": "crt.NumberInput",
					"label": "$Resources.Strings.PDS_UsrColumn8_qbrw5yy",
					"labelPosition": "auto",
					"control": "$PDS_UsrColumn8_qbrw5yy",
					"visible": true,
					"readonly": true,
					"placeholder": "",
					"tooltip": ""
				},
				"parentName": "SideAreaProfileContainer",
				"propertyName": "items",
				"index": 3
			},
			{
				"operation": "insert",
				"name": "Type",
				"values": {
					"layoutConfig": {
						"column": 1,
						"colSpan": 1,
						"row": 1,
						"rowSpan": 1
					},
					"type": "crt.ComboBox",
					"label": "$Resources.Strings.PDS_UsrType_m9ii2dk",
					"labelPosition": "above",
					"control": "$PDS_UsrType_m9ii2dk",
					"listActions": [],
					"showValueAsLink": true,
					"controlActions": [],
					"visible": true,
					"readonly": false,
					"placeholder": "",
					"tooltip": "",
					"valueDetails": null
				},
				"parentName": "GeneralInfoTabContainer",
				"propertyName": "items",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "OfferType",
				"values": {
					"layoutConfig": {
						"column": 2,
						"colSpan": 1,
						"row": 1,
						"rowSpan": 1
					},
					"type": "crt.ComboBox",
					"label": "$Resources.Strings.PDS_UsrOfferType_rpm5cp4",
					"labelPosition": "above",
					"control": "$PDS_UsrOfferType_rpm5cp4",
					"listActions": [],
					"showValueAsLink": true,
					"controlActions": [],
					"visible": true,
					"readonly": false,
					"placeholder": "",
					"tooltip": "",
					"valueDetails": null
				},
				"parentName": "GeneralInfoTabContainer",
				"propertyName": "items",
				"index": 1
			},
			{
				"operation": "insert",
				"name": "Comment",
				"values": {
					"type": "crt.Input",
					"label": "$Resources.Strings.PDS_UsrColumn5_qh4miga",
					"labelPosition": "above",
					"control": "$PDS_UsrColumn5_qh4miga",
					"visible": true,
					"readonly": false,
					"placeholder": "",
					"tooltip": "",
					"multiline": false
				},
				"parentName": "GeneralInfoTab",
				"propertyName": "items",
				"index": 1
			},
			{
				"operation": "insert",
				"name": "RealtyVisits",
				"values": {
					"type": "crt.ExpansionPanel",
					"tools": [],
					"items": [],
					"title": "#ResourceString(RealtyVisits_title)#",
					"toggleType": "default",
					"togglePosition": "before",
					"expanded": true,
					"labelColor": "auto",
					"fullWidthHeader": false,
					"titleWidth": 20,
					"padding": {
						"top": "small",
						"bottom": "small",
						"left": "none",
						"right": "none"
					},
					"fitContent": true,
					"isLive": true
				},
				"parentName": "GeneralInfoTab",
				"propertyName": "items",
				"index": 2
			},
			{
				"operation": "insert",
				"name": "GridContainer_wfkiyui",
				"values": {
					"type": "crt.GridContainer",
					"rows": "minmax(max-content, 24px)",
					"columns": [
						"minmax(32px, 1fr)"
					],
					"gap": {
						"columnGap": "large",
						"rowGap": "none"
					},
					"styles": {
						"overflow-x": "hidden"
					},
					"items": [],
					"visible": true,
					"color": "transparent",
					"borderRadius": "none",
					"padding": {
						"top": "none",
						"right": "none",
						"bottom": "none",
						"left": "none"
					},
					"alignItems": "stretch"
				},
				"parentName": "RealtyVisits",
				"propertyName": "tools",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "FlexContainer_o4ralcz",
				"values": {
					"type": "crt.FlexContainer",
					"direction": "row",
					"gap": "none",
					"alignItems": "center",
					"items": [],
					"layoutConfig": {
						"colSpan": 1,
						"column": 1,
						"row": 1,
						"rowSpan": 1
					}
				},
				"parentName": "GridContainer_wfkiyui",
				"propertyName": "items",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "GridDetailAddBtn_kfpmlyb",
				"values": {
					"type": "crt.Button",
					"caption": "#ResourceString(GridDetailAddBtn_kfpmlyb_caption)#",
					"icon": "add-button-icon",
					"iconPosition": "only-icon",
					"color": "default",
					"size": "medium",
					"clicked": {
						"request": "crt.CreateRecordRequest",
						"params": {
							"entityName": "UsrRealtyVisit",
							"defaultValues": [
								{
									"attributeName": "UsrRealtyParent",
									"value": "$Id"
								}
							]
						}
					},
					"visible": true,
					"clickMode": "default"
				},
				"parentName": "FlexContainer_o4ralcz",
				"propertyName": "items",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "GridDetailRefreshBtn_45kp3p8",
				"values": {
					"type": "crt.Button",
					"caption": "#ResourceString(GridDetailRefreshBtn_45kp3p8_caption)#",
					"icon": "reload-icon",
					"iconPosition": "only-icon",
					"color": "default",
					"size": "medium",
					"clicked": {
						"request": "crt.LoadDataRequest",
						"params": {
							"config": {
								"loadType": "reload"
							},
							"dataSourceName": "GridDetail_v5x6pguDS"
						}
					}
				},
				"parentName": "FlexContainer_o4ralcz",
				"propertyName": "items",
				"index": 1
			},
			{
				"operation": "insert",
				"name": "GridDetailSettingsBtn_cg0mp89",
				"values": {
					"type": "crt.Button",
					"caption": "#ResourceString(GridDetailSettingsBtn_cg0mp89_caption)#",
					"icon": "actions-button-icon",
					"iconPosition": "only-icon",
					"color": "default",
					"size": "medium",
					"clickMode": "menu",
					"menuItems": []
				},
				"parentName": "FlexContainer_o4ralcz",
				"propertyName": "items",
				"index": 2
			},
			{
				"operation": "insert",
				"name": "GridDetailExportDataBtn_6wenexu",
				"values": {
					"type": "crt.MenuItem",
					"caption": "#ResourceString(GridDetailExportDataBtn_6wenexu_caption)#",
					"icon": "export-button-icon",
					"color": "default",
					"size": "medium",
					"isLive": true,
					"clicked": {
						"request": "crt.ExportDataGridToExcelRequest",
						"params": {
							"viewName": "RealtyVisitsDetails"
						}
					}
				},
				"parentName": "GridDetailSettingsBtn_cg0mp89",
				"propertyName": "menuItems",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "GridDetailImportDataBtn_2wri48n",
				"values": {
					"type": "crt.MenuItem",
					"caption": "#ResourceString(GridDetailImportDataBtn_2wri48n_caption)#",
					"icon": "import-button-icon",
					"color": "default",
					"size": "medium",
					"clicked": {
						"request": "crt.ImportDataRequest",
						"params": {
							"entitySchemaName": "UsrRealtyVisit"
						}
					}
				},
				"parentName": "GridDetailSettingsBtn_cg0mp89",
				"propertyName": "menuItems",
				"index": 1
			},
			{
				"operation": "insert",
				"name": "GridDetailSearchFilter_mvtxulg",
				"values": {
					"type": "crt.SearchFilter",
					"placeholder": "#ResourceString(GridDetailSearchFilter_mvtxulg_placeholder)#",
					"iconOnly": true,
					"_filterOptions": {
						"expose": [
							{
								"attribute": "GridDetailSearchFilter_mvtxulg_GridDetail_v5x6pgu",
								"converters": [
									{
										"converter": "crt.SearchFilterAttributeConverter",
										"args": [
											"GridDetail_v5x6pgu"
										]
									}
								]
							}
						],
						"from": [
							"GridDetailSearchFilter_mvtxulg_SearchValue",
							"GridDetailSearchFilter_mvtxulg_FilteredColumnsGroups"
						]
					}
				},
				"parentName": "FlexContainer_o4ralcz",
				"propertyName": "items",
				"index": 3
			},
			{
				"operation": "insert",
				"name": "GridContainer_gw9vxnz",
				"values": {
					"type": "crt.GridContainer",
					"rows": "minmax(max-content, 32px)",
					"columns": [
						"minmax(32px, 1fr)",
						"minmax(32px, 1fr)"
					],
					"gap": {
						"columnGap": "large",
						"rowGap": "none"
					},
					"styles": {
						"overflow-x": "hidden"
					},
					"items": [],
					"visible": true,
					"color": "transparent",
					"borderRadius": "none",
					"padding": {
						"top": "none",
						"right": "none",
						"bottom": "none",
						"left": "none"
					},
					"alignItems": "stretch"
				},
				"parentName": "RealtyVisits",
				"propertyName": "items",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "RealtyVisitsDetails",
				"values": {
					"type": "crt.DataGrid",
					"isLive": true,
					"layoutConfig": {
						"colSpan": 2,
						"column": 1,
						"row": 1,
						"rowSpan": 6
					},
					"features": {
						"rows": {
							"selection": {
								"enable": true,
								"multiple": true
							}
						},
						"editable": {
							"enable": false,
							"itemsCreation": false,
							"floatingEditPanel": false
						}
					},
					"items": "$GridDetail_v5x6pgu",
					"activeRow": "$GridDetail_v5x6pgu_ActiveRow",
					"selectionState": "$GridDetail_v5x6pgu_SelectionState",
					"_selectionOptions": {
						"attribute": "GridDetail_v5x6pgu_SelectionState"
					},
					"primaryColumnName": "GridDetail_v5x6pguDS_Id",
					"columns": [
						{
							"id": "dce7a458-6ca1-5ab6-3bd0-481d3c2f829c",
							"code": "GridDetail_v5x6pguDS_UsrComment",
							"caption": "#ResourceString(GridDetail_v5x6pguDS_UsrComment)#",
							"dataValueType": 28
						}
					],
					"placeholder": false,
					"bulkActions": []
				},
				"parentName": "GridContainer_gw9vxnz",
				"propertyName": "items",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "GridDetail_v5x6pgu_AddTagsBulkAction",
				"values": {
					"type": "crt.MenuItem",
					"caption": "Add tag",
					"icon": "tag-icon",
					"clicked": {
						"request": "crt.AddTagsInRecordsRequest",
						"params": {
							"dataSourceName": "GridDetail_v5x6pguDS",
							"filters": "$GridDetail_v5x6pgu | crt.ToCollectionFilters : 'GridDetail_v5x6pgu' : $GridDetail_v5x6pgu_SelectionState | crt.SkipIfSelectionEmpty : $GridDetail_v5x6pgu_SelectionState"
						}
					},
					"items": []
				},
				"parentName": "RealtyVisitsDetails",
				"propertyName": "bulkActions",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "GridDetail_v5x6pgu_RemoveTagsBulkAction",
				"values": {
					"type": "crt.MenuItem",
					"caption": "Remove tag",
					"icon": "delete-button-icon",
					"clicked": {
						"request": "crt.RemoveTagsInRecordsRequest",
						"params": {
							"dataSourceName": "GridDetail_v5x6pguDS",
							"filters": "$GridDetail_v5x6pgu | crt.ToCollectionFilters : 'GridDetail_v5x6pgu' : $GridDetail_v5x6pgu_SelectionState | crt.SkipIfSelectionEmpty : $GridDetail_v5x6pgu_SelectionState"
						}
					}
				},
				"parentName": "GridDetail_v5x6pgu_AddTagsBulkAction",
				"propertyName": "items",
				"index": 0
			},
			{
				"operation": "insert",
				"name": "GridDetail_v5x6pgu_ExportToExcelBulkAction",
				"values": {
					"type": "crt.MenuItem",
					"caption": "Export to Excel",
					"icon": "export-button-icon",
					"clicked": {
						"request": "crt.ExportDataGridToExcelRequest",
						"params": {
							"viewName": "RealtyVisitsDetails",
							"filters": "$GridDetail_v5x6pgu | crt.ToCollectionFilters : 'GridDetail_v5x6pgu' : $GridDetail_v5x6pgu_SelectionState | crt.SkipIfSelectionEmpty : $GridDetail_v5x6pgu_SelectionState"
						}
					}
				},
				"parentName": "RealtyVisitsDetails",
				"propertyName": "bulkActions",
				"index": 1
			},
			{
				"operation": "insert",
				"name": "GridDetail_v5x6pgu_DeleteBulkAction",
				"values": {
					"type": "crt.MenuItem",
					"caption": "Delete",
					"icon": "delete-button-icon",
					"clicked": {
						"request": "crt.DeleteRecordsRequest",
						"params": {
							"dataSourceName": "GridDetail_v5x6pguDS",
							"filters": "$GridDetail_v5x6pgu | crt.ToCollectionFilters : 'GridDetail_v5x6pgu' : $GridDetail_v5x6pgu_SelectionState | crt.SkipIfSelectionEmpty : $GridDetail_v5x6pgu_SelectionState"
						}
					}
				},
				"parentName": "RealtyVisitsDetails",
				"propertyName": "bulkActions",
				"index": 2
			}
		]/**SCHEMA_VIEW_CONFIG_DIFF*/,
		viewModelConfigDiff: /**SCHEMA_VIEW_MODEL_CONFIG_DIFF*/[
			{
				"operation": "merge",
				"path": [
					"attributes"
				],
				"values": {
					"UsrName": {
						"modelConfig": {
							"path": "PDS.UsrTitle"
						}
					},
					"PDS_UsrPrice_9osr7nl": {
						"modelConfig": {
							"path": "PDS.UsrPrice"
						},
						"validators": {
							"MySuperValidator": {
								"type": "usr.DGValidator",
								"params": {
									"minValue": 50,
									"message": "#ResourceString(PriceCannotBeLess)#"
								}
							}
						}
					},
					"PDS_UsrArea_plzwh86": {
						"modelConfig": {
							"path": "PDS.UsrArea"
						},
						"validators": {
							"MySuperValidator": {
								"type": "usr.DGValidator",
								"params": {
									"minValue": 50,
									"message": "#ResourceString(AreaCannotBeLess)#"
								}
							}
						}
					},
					"PDS_UsrColumn5_qh4miga": {
						"modelConfig": {
							"path": "PDS.UsrColumn5"
						},
						"validators": {
							"required": {
								"type": "crt.Required"
							}
						}
					},
					"PDS_UsrType_m9ii2dk": {
						"modelConfig": {
							"path": "PDS.UsrType"
						}
					},
					"PDS_UsrOfferType_rpm5cp4": {
						"modelConfig": {
							"path": "PDS.UsrOfferType"
						}
					},
					"PDS_UsrColumn8_qbrw5yy": {
						"modelConfig": {
							"path": "PDS.UsrCommission"
						}
					},
					"GridDetail_v5x6pgu": {
						"isCollection": true,
						"modelConfig": {
							"path": "GridDetail_v5x6pguDS",
							"filterAttributes": [
								{
									"name": "GridDetailSearchFilter_mvtxulg_GridDetail_v5x6pgu",
									"loadOnChange": true
								}
							]
						},
						"viewModelConfig": {
							"attributes": {
								"GridDetail_v5x6pguDS_UsrComment": {
									"modelConfig": {
										"path": "GridDetail_v5x6pguDS.UsrComment"
									}
								},
								"GridDetail_v5x6pguDS_Id": {
									"modelConfig": {
										"path": "GridDetail_v5x6pguDS.Id"
									}
								}
							}
						}
					}
				}
			},
			{
				"operation": "merge",
				"path": [
					"attributes",
					"Id",
					"modelConfig"
				],
				"values": {
					"path": "PDS.Id"
				}
			}
		]/**SCHEMA_VIEW_MODEL_CONFIG_DIFF*/,
		modelConfigDiff: /**SCHEMA_MODEL_CONFIG_DIFF*/[
			{
				"operation": "merge",
				"path": [],
				"values": {
					"primaryDataSourceName": "PDS",
					"dependencies": {
						"GridDetail_v5x6pguDS": [
							{
								"attributePath": "UsrRealtyParent",
								"relationPath": "PDS.Id"
							}
						]
					}
				}
			},
			{
				"operation": "merge",
				"path": [
					"dataSources"
				],
				"values": {
					"PDS": {
						"type": "crt.EntityDataSource",
						"config": {
							"entitySchemaName": "UsrRealty"
						},
						"scope": "page"
					},
					"GridDetail_v5x6pguDS": {
						"type": "crt.EntityDataSource",
						"scope": "viewElement",
						"config": {
							"entitySchemaName": "UsrRealtyVisit",
							"attributes": {
								"UsrComment": {
									"path": "UsrComment"
								}
							}
						}
					}
				}
			}
		]/**SCHEMA_MODEL_CONFIG_DIFF*/,
		handlers: /**SCHEMA_HANDLERS*/[
			{
				request: "crt.HandleViewModelAttributeChangeRequest",
				/* The custom implementation of the system query handler. */
				handler: async (request, next) => {
      				if (request.attributeName === 'PDS_UsrPrice_9osr7nl'  || 
					    request.attributeName === 'PDS_UsrOfferType_rpm5cp4') {
						let price = await request.$context.PDS_UsrPrice_9osr7nl;
						let offerType = await request.$context.PDS_UsrOfferType_rpm5cp4;
						let commission = 0;
						
						if (offerType && offerType.displayValue) {
					        const offer = offerType.displayValue.toLowerCase();
					        if (offer.includes("rental")) {
					          commission = price * 0.6;
					        } else if (offer.includes("sale")) {
					          commission = price * 0.025;
					        }
							request.$context.PDS_UsrColumn8_qbrw5yy = commission;
						}

						/* Call the next handler if it exists and return its result. */
						return next?.handle(request);
					}
				}
			},
			{
				request: "crt.SaveRecordRequest",
				handler: async (request, next) => {
					const context = request.$context;
					let price = await context.PDS_UsrPrice_9osr7nl;
					const sysSettingsService = new sdk.SysSettingsService();
					const min = await sysSettingsService.getByCode('MinPriceToRequireRealtyComment');
					const minPrice = min?.value ?? 0;
			
					console.log("System setting (MinPriceToRequireRealtyComment):", minPrice);
			
					if (price >= minPrice) {
						context.enableAttributeValidator("PDS_UsrColumn5_qh4miga", "required");
					} else {
						context.disableAttributeValidator("PDS_UsrColumn5_qh4miga", "required");
					}
			
					return next?.handle(request); 
				}
			},
			{
				request: "usr.RunWebServiceButtonRequest",
				handler: async (request, next) => {
					console.log("Calling GetAveragePriceForSaleType...");

					//get ids from lookups
					
					let typeObj = await request.$context.PDS_UsrType_m9ii2dk;
					let typeId = "";
					if(typeObj){
						typeId = typeObj.value;
					}
					console.log("typeId ",typeId);

					let offerTypeObj = await request.$context.PDS_UsrOfferType_rpm5cp4;
					let offertypeId  = "";
					if(offerTypeObj){
						offertypeId  = offerTypeObj.value;
					}
					console.log("Offer ID",offertypeId);
			
					// Create an instance of the HTTP client
					const httpClientService = new sdk.HttpClientService();
					console.log("http client ",httpClientService);
			
					// Construct the endpoint URL
					const baseUrl = Terrasoft.utils.uri.getConfigurationWebServiceBaseUrl();
					const transfareName = "rest";
					const serviceName = "UsrRealtyService";
					const methodName = "GetAveragePricePerAreaForSale";
					const endpoint = Terrasoft.combinePath(baseUrl, transfareName, serviceName, methodName);
					console.log("baseURL: ", baseUrl);
					console.log("endpoint", endpoint);

					//parameters
					var params = {
						realtyTypeId: typeId
						// realtyTypeOffer: offertypeId  
					};

					console.log("parmas: ", params);
			
					// Send the request (no parameters required)
					const response = await httpClientService.post(endpoint, params);
			
					// Extract result from response
					const avgPrice = response.body.GetAveragePricePerAreaForSaleResult;
					console.log("Average Price Per Area (Sale):", avgPrice);
			
					// Show the result to the user in a Creatio info dialog
					Terrasoft.showInformation(`Average Price per Area for Sale records: ${avgPrice}`);
			
					// Call the next handler if needed
					return next?.handle(request);
			
						}
				}


		]/**SCHEMA_HANDLERS*/,
		converters: /**SCHEMA_CONVERTERS*/{}/**SCHEMA_CONVERTERS*/,
		validators: /**SCHEMA_VALIDATORS*/{

			/* The validator type must contain a vendor prefix.

			Format the validator type in PascalCase. */
			"usr.DGValidator": {
				validator: function (config) {
					return function (control) {
						let value = control.value;
						let minValue = config.minValue;
						let valueIsCorrect = value >= minValue;
						var result;
						if (valueIsCorrect) {
							result = null;
						} else {
							result = {
								"usr.DGValidator": { 
									message: config.message
								}
							};
						}
						return result;
					};
				},
				params: [
					{
						name: "minValue"
					},
					{
						name: "message"
					}
				],
				async: false
			}

		}/**SCHEMA_VALIDATORS*/
	};
});