var ChartsAmcharts = function() {
	
	var	t = function() {
			var e = AmCharts.makeChart("dashboard_amchart_1", {
//				type: "serial",
//				theme: "light",
//				fontFamily: "Microsoft YaHei",
//				color: "#6c7b88",
				type: "serial",
				fontSize: 12,
				fontFamily: "Microsoft YaHei",
				dataDateFormat: "YYYY-MM-DD",
				dataProvider: e,
				addClassNames: !0,
				startDuration: 1,
				color: "#6c7b88",
				marginLeft: 0,
				legend: {
						bulletType: "round",
						equalWidths: !1,
						valueWidth: 120,
						useGraphSettings: !0,
						color: "#6c7b88"
					},
				dataProvider: json,
				valueAxes: [{
					id: "a1",
					title: "营业额(元)",
					gridAlpha: 0,
					axisAlpha: 0,
				}, {
					id: "a2",
					title: "订单数(单)",
					position: "right",
					gridAlpha: 0,
					axisAlpha: 0,
				}],
				graphs: [{
						id: "g1",
						valueField: "distance",
						title: "访问量",
						type: "column",
						fillAlphas: .7,
						valueAxis: "a1",
						balloonText: "[[value]] 元",
						legendValueText: "[[value]] 元",
						legendPeriodValueText: "总计: [[value.sum]] 元",
						lineColor: "#08a3cc",
						alphaField: "alpha",
						colorField: "color",
						lineAlpha: 0,
					 },
					 
					 	{
                        id: "g2",
                        valueField: "duration",
                        classNameField: "bulletClass",
                        title: "IP数",
                        type: "line",
                        valueAxis: "a2",
                        lineColor: "#e26a6a",
                        lineThickness: 2,
                        legendValueText: "[[value]] 单",
                        legendPeriodValueText: "总计: [[value.sum]] 单",
                        bullet: "round",
                        bulletBorderColor: "red",
                        bulletBorderAlpha: 1,
                        bulletBorderThickness: 2,
                        bulletColor: "#fff",
                        labelPosition: "right",
                        balloonText: "订单数 :[[value]]",
                        showBalloon: !0,
                        animationPlayed: !0
                    }],
				chartCursor: {
						zoomable: !1,
						categoryBalloonDateFormat: "YYYY.MM.DD",
						cursorAlpha: 0,
						categoryBalloonColor: "#e26a6a",
						categoryBalloonAlpha: .8,
						valueBalloonsEnabled: !1
				},
				dataDateFormat: "YYYY-MM-DD",
				categoryField: "date",
				categoryAxis: {

						parseDates: !0,
						minPeriod: "DD",
						autoGridCount: !1,
						gridCount: 50,
						gridAlpha: .1,
						gridColor: "#FFFFFF",
						axisColor: "#555555",
						dateFormats: [{
							period: "DD",
							format: "MM.DD"
						}, {
							period: "WW",
							format: "MMM DD"
						}, {
							period: "MM",
							format: "MMM"
						}, {
							period: "YYYY",
							format: "YYYY"
						}]
					},
				exportConfig: {
					menuBottom: "20px",
					menuRight: "22px",
					menuItems: [{
						icon: App.getGlobalPluginsPath() + "amcharts/amcharts/images/export.png",
						format: "png"
					}]
				}
			});
			$("#dashboard_amchart_1").closest(".portlet").find(".fullscreen").click(function() {
				e.invalidateSize()
			})
		},

//		历史奖励总额饼图数据
		i = function() {
			var e = AmCharts.makeChart("chart_history_money", {
				type: "pie",
				theme: "dark",
				fontFamily: "Microsoft YaHei",
				colorField: "color",
				labelColorField: "color",
				legend: {
				    "markerType": "circle",
				    "position": "bottom",
				    "autoMargins": false
				},
				dataProvider: [{
					country: "抽奖奖励",
					litres: 50025,
					color: "#67b7dc"
				}, {
					country: "正常奖励",
					litres: 685242,
					color: "#84b761"
				}],
				valueField: "litres",
				titleField: "country"
			});
			$("#chart_history_money").closest(".portlet").find(".fullscreen").click(function() {
				e.invalidateSize()
			})
		},
		//		今日新增饼图数据
		j = function() {
			var e = AmCharts.makeChart("chart_add_user", {
				type: "pie",
				theme: "light",
				fontFamily: "Microsoft YaHei",
				colorField: "color",
				labelColorField: "color",
				legend: {
				    "markerType": "circle",
				    "position": "bottom",
				    "autoMargins": false
				},
				dataProvider: [{
					country: "代理商",
					litres: 201,
					color: "#CC4748"
				}, {
					country: "普通用户",
					litres: 324,
					color: "#FDD400"
				}, {
					country: "商家",
					litres: 57,
					color: "#3992CF"
				}],
				valueField: "litres",
				titleField: "country"
			});
			$("#chart_add_user").closest(".portlet").find(".fullscreen").click(function() {
				e.invalidateSize()
			})
		},
		//		普通用户总数饼图数据
		h = function() {
			var e = AmCharts.makeChart("chart_user_all", {
				type: "pie",
				theme: "light",
				fontFamily: "Microsoft YaHei",
				colorField: "color",
				labelColorField: "color",
				legend: {
				    "markerType": "circle",
				    "position": "bottom",
				    "autoMargins": false
				},
				dataProvider: [{
					country: "抽奖奖励",
					litres: 50025,
					color: "rgb(255, 15, 0)"
				}, {
					country: "正常奖励",
					litres: 685242,
					color: "rgb(255, 102, 0)"
				}],
				valueField: "litres",
				titleField: "country"
			});
			$("#chart_user_all").closest(".portlet").find(".fullscreen").click(function() {
				e.invalidateSize()
			})
		},
		d = function() {
			var e = AmCharts.makeChart("chart_add_user", {
				type: "pie",
				theme: "light",
				fontFamily: "Open Sans",
				color: "#888",
				dataProvider: [{
					country: "Lithuania",
					value: 260
				}, {
					country: "Ireland",
					value: 201
				}, {
					country: "Germany",
					value: 65
				}, {
					country: "Australia",
					value: 39
				}, {
					country: "UK",
					value: 19
				}, {
					country: "Latvia",
					value: 10
				}],
				valueField: "value",
				titleField: "country",
				outlineAlpha: .4,
				depth3D: 15,
				balloonText: "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
				angle: 30,
				exportConfig: {
					menuItems: [{
						icon: "/lib/3/images/export.png",
						format: "png"
					}]
				}
			});
			jQuery(".chart_7_chart_input").off().on("input change", function() {
				var t = jQuery(this).data("property"),
					a = e,
					l = Number(this.value);
				e.startDuration = 0, "innerRadius" == t && (l += "%"), a[t] = l, e.validateNow()
			}), $("#chart_add_user").closest(".portlet").find(".fullscreen").click(function() {
				e.invalidateSize()
			})
		},
		u = function() {
			var e = AmCharts.makeChart("chart_9", {
				type: "radar",
				theme: "light",
				fontFamily: "Open Sans",
				color: "#888",
				dataProvider: [{
					country: "Czech Republic",
					litres: 156.9
				}, {
					country: "Ireland",
					litres: 131.1
				}, {
					country: "Germany",
					litres: 115.8
				}, {
					country: "Australia",
					litres: 109.9
				}, {
					country: "Austria",
					litres: 108.3
				}, {
					country: "UK",
					litres: 99
				}],
				valueAxes: [{
					axisTitleOffset: 20,
					minimum: 0,
					axisAlpha: .15
				}],
				startDuration: 2,
				graphs: [{
					balloonText: "[[value]] litres of beer per year",
					bullet: "round",
					valueField: "litres"
				}],
				categoryField: "country",
				exportConfig: {
					menuTop: "10px",
					menuRight: "10px",
					menuItems: [{
						icon: "/lib/3/images/export.png",
						format: "png"
					}]
				}
			});
			$("#chart_9").closest(".portlet").find(".fullscreen").click(function() {
				e.invalidateSize()
			})
		},
		r = function() {
			var e = {};
			e.AD = {
				latitude: 42.5,
				longitude: 1.5
			}, e.AE = {
				latitude: 24,
				longitude: 54
			}, e.AF = {
				latitude: 33,
				longitude: 65
			}, e.AG = {
				latitude: 17.05,
				longitude: -61.8
			}, e.AI = {
				latitude: 18.25,
				longitude: -63.1667
			}, e.AL = {
				latitude: 41,
				longitude: 20
			}, e.AM = {
				latitude: 40,
				longitude: 45
			}, e.AN = {
				latitude: 12.25,
				longitude: -68.75
			}, e.AO = {
				latitude: -12.5,
				longitude: 18.5
			}, e.AP = {
				latitude: 35,
				longitude: 105
			}, e.AQ = {
				latitude: -90,
				longitude: 0
			}, e.AR = {
				latitude: -34,
				longitude: -64
			}, e.AS = {
				latitude: -14.3333,
				longitude: -170
			}, e.AT = {
				latitude: 47.3333,
				longitude: 13.3333
			}, e.AU = {
				latitude: -27,
				longitude: 133
			}, e.AW = {
				latitude: 12.5,
				longitude: -69.9667
			}, e.AZ = {
				latitude: 40.5,
				longitude: 47.5
			}, e.BA = {
				latitude: 44,
				longitude: 18
			}, e.BB = {
				latitude: 13.1667,
				longitude: -59.5333
			}, e.BD = {
				latitude: 24,
				longitude: 90
			}, e.BE = {
				latitude: 50.8333,
				longitude: 4
			}, e.BF = {
				latitude: 13,
				longitude: -2
			}, e.BG = {
				latitude: 43,
				longitude: 25
			}, e.BH = {
				latitude: 26,
				longitude: 50.55
			}, e.BI = {
				latitude: -3.5,
				longitude: 30
			}, e.BJ = {
				latitude: 9.5,
				longitude: 2.25
			}, e.BM = {
				latitude: 32.3333,
				longitude: -64.75
			}, e.BN = {
				latitude: 4.5,
				longitude: 114.6667
			}, e.BO = {
				latitude: -17,
				longitude: -65
			}, e.BR = {
				latitude: -10,
				longitude: -55
			}, e.BS = {
				latitude: 24.25,
				longitude: -76
			}, e.BT = {
				latitude: 27.5,
				longitude: 90.5
			}, e.BV = {
				latitude: -54.4333,
				longitude: 3.4
			}, e.BW = {
				latitude: -22,
				longitude: 24
			}, e.BY = {
				latitude: 53,
				longitude: 28
			}, e.BZ = {
				latitude: 17.25,
				longitude: -88.75
			}, e.CA = {
				latitude: 54,
				longitude: -100
			}, e.CC = {
				latitude: -12.5,
				longitude: 96.8333
			}, e.CD = {
				latitude: 0,
				longitude: 25
			}, e.CF = {
				latitude: 7,
				longitude: 21
			}, e.CG = {
				latitude: -1,
				longitude: 15
			}, e.CH = {
				latitude: 47,
				longitude: 8
			}, e.CI = {
				latitude: 8,
				longitude: -5
			}, e.CK = {
				latitude: -21.2333,
				longitude: -159.7667
			}, e.CL = {
				latitude: -30,
				longitude: -71
			}, e.CM = {
				latitude: 6,
				longitude: 12
			}, e.CN = {
				latitude: 35,
				longitude: 105
			}, e.CO = {
				latitude: 4,
				longitude: -72
			}, e.CR = {
				latitude: 10,
				longitude: -84
			}, e.CU = {
				latitude: 21.5,
				longitude: -80
			}, e.CV = {
				latitude: 16,
				longitude: -24
			}, e.CX = {
				latitude: -10.5,
				longitude: 105.6667
			}, e.CY = {
				latitude: 35,
				longitude: 33
			}, e.CZ = {
				latitude: 49.75,
				longitude: 15.5
			}, e.DE = {
				latitude: 51,
				longitude: 9
			}, e.DJ = {
				latitude: 11.5,
				longitude: 43
			}, e.DK = {
				latitude: 56,
				longitude: 10
			}, e.DM = {
				latitude: 15.4167,
				longitude: -61.3333
			}, e.DO = {
				latitude: 19,
				longitude: -70.6667
			}, e.DZ = {
				latitude: 28,
				longitude: 3
			}, e.EC = {
				latitude: -2,
				longitude: -77.5
			}, e.EE = {
				latitude: 59,
				longitude: 26
			}, e.EG = {
				latitude: 27,
				longitude: 30
			}, e.EH = {
				latitude: 24.5,
				longitude: -13
			}, e.ER = {
				latitude: 15,
				longitude: 39
			}, e.ES = {
				latitude: 40,
				longitude: -4
			}, e.ET = {
				latitude: 8,
				longitude: 38
			}, e.EU = {
				latitude: 47,
				longitude: 8
			}, e.FI = {
				latitude: 62,
				longitude: 26
			}, e.FJ = {
				latitude: -18,
				longitude: 175
			}, e.FK = {
				latitude: -51.75,
				longitude: -59
			}, e.FM = {
				latitude: 6.9167,
				longitude: 158.25
			}, e.FO = {
				latitude: 62,
				longitude: -7
			}, e.FR = {
				latitude: 46,
				longitude: 2
			}, e.GA = {
				latitude: -1,
				longitude: 11.75
			}, e.GB = {
				latitude: 54,
				longitude: -2
			}, e.GD = {
				latitude: 12.1167,
				longitude: -61.6667
			}, e.GE = {
				latitude: 42,
				longitude: 43.5
			}, e.GF = {
				latitude: 4,
				longitude: -53
			}, e.GH = {
				latitude: 8,
				longitude: -2
			}, e.GI = {
				latitude: 36.1833,
				longitude: -5.3667
			}, e.GL = {
				latitude: 72,
				longitude: -40
			}, e.GM = {
				latitude: 13.4667,
				longitude: -16.5667
			}, e.GN = {
				latitude: 11,
				longitude: -10
			}, e.GP = {
				latitude: 16.25,
				longitude: -61.5833
			}, e.GQ = {
				latitude: 2,
				longitude: 10
			}, e.GR = {
				latitude: 39,
				longitude: 22
			}, e.GS = {
				latitude: -54.5,
				longitude: -37
			}, e.GT = {
				latitude: 15.5,
				longitude: -90.25
			}, e.GU = {
				latitude: 13.4667,
				longitude: 144.7833
			}, e.GW = {
				latitude: 12,
				longitude: -15
			}, e.GY = {
				latitude: 5,
				longitude: -59
			}, e.HK = {
				latitude: 22.25,
				longitude: 114.1667
			}, e.HM = {
				latitude: -53.1,
				longitude: 72.5167
			}, e.HN = {
				latitude: 15,
				longitude: -86.5
			}, e.HR = {
				latitude: 45.1667,
				longitude: 15.5
			}, e.HT = {
				latitude: 19,
				longitude: -72.4167
			}, e.HU = {
				latitude: 47,
				longitude: 20
			}, e.ID = {
				latitude: -5,
				longitude: 120
			}, e.IE = {
				latitude: 53,
				longitude: -8
			}, e.IL = {
				latitude: 31.5,
				longitude: 34.75
			}, e.IN = {
				latitude: 20,
				longitude: 77
			}, e.IO = {
				latitude: -6,
				longitude: 71.5
			}, e.IQ = {
				latitude: 33,
				longitude: 44
			}, e.IR = {
				latitude: 32,
				longitude: 53
			}, e.IS = {
				latitude: 65,
				longitude: -18
			}, e.IT = {
				latitude: 42.8333,
				longitude: 12.8333
			}, e.JM = {
				latitude: 18.25,
				longitude: -77.5
			}, e.JO = {
				latitude: 31,
				longitude: 36
			}, e.JP = {
				latitude: 36,
				longitude: 138
			}, e.KE = {
				latitude: 1,
				longitude: 38
			}, e.KG = {
				latitude: 41,
				longitude: 75
			}, e.KH = {
				latitude: 13,
				longitude: 105
			}, e.KI = {
				latitude: 1.4167,
				longitude: 173
			}, e.KM = {
				latitude: -12.1667,
				longitude: 44.25
			}, e.KN = {
				latitude: 17.3333,
				longitude: -62.75
			}, e.KP = {
				latitude: 40,
				longitude: 127
			}, e.KR = {
				latitude: 37,
				longitude: 127.5
			}, e.KW = {
				latitude: 29.3375,
				longitude: 47.6581
			}, e.KY = {
				latitude: 19.5,
				longitude: -80.5
			}, e.KZ = {
				latitude: 48,
				longitude: 68
			}, e.LA = {
				latitude: 18,
				longitude: 105
			}, e.LB = {
				latitude: 33.8333,
				longitude: 35.8333
			}, e.LC = {
				latitude: 13.8833,
				longitude: -61.1333
			}, e.LI = {
				latitude: 47.1667,
				longitude: 9.5333
			}, e.LK = {
				latitude: 7,
				longitude: 81
			}, e.LR = {
				latitude: 6.5,
				longitude: -9.5
			}, e.LS = {
				latitude: -29.5,
				longitude: 28.5
			}, e.LT = {
				latitude: 55,
				longitude: 24
			}, e.LU = {
				latitude: 49.75,
				longitude: 6
			}, e.LV = {
				latitude: 57,
				longitude: 25
			}, e.LY = {
				latitude: 25,
				longitude: 17
			}, e.MA = {
				latitude: 32,
				longitude: -5
			}, e.MC = {
				latitude: 43.7333,
				longitude: 7.4
			}, e.MD = {
				latitude: 47,
				longitude: 29
			}, e.ME = {
				latitude: 42.5,
				longitude: 19.4
			}, e.MG = {
				latitude: -20,
				longitude: 47
			}, e.MH = {
				latitude: 9,
				longitude: 168
			}, e.MK = {
				latitude: 41.8333,
				longitude: 22
			}, e.ML = {
				latitude: 17,
				longitude: -4
			}, e.MM = {
				latitude: 22,
				longitude: 98
			}, e.MN = {
				latitude: 46,
				longitude: 105
			}, e.MO = {
				latitude: 22.1667,
				longitude: 113.55
			}, e.MP = {
				latitude: 15.2,
				longitude: 145.75
			}, e.MQ = {
				latitude: 14.6667,
				longitude: -61
			}, e.MR = {
				latitude: 20,
				longitude: -12
			}, e.MS = {
				latitude: 16.75,
				longitude: -62.2
			}, e.MT = {
				latitude: 35.8333,
				longitude: 14.5833
			}, e.MU = {
				latitude: -20.2833,
				longitude: 57.55
			}, e.MV = {
				latitude: 3.25,
				longitude: 73
			}, e.MW = {
				latitude: -13.5,
				longitude: 34
			}, e.MX = {
				latitude: 23,
				longitude: -102
			}, e.MY = {
				latitude: 2.5,
				longitude: 112.5
			}, e.MZ = {
				latitude: -18.25,
				longitude: 35
			}, e.NA = {
				latitude: -22,
				longitude: 17
			}, e.NC = {
				latitude: -21.5,
				longitude: 165.5
			}, e.NE = {
				latitude: 16,
				longitude: 8
			}, e.NF = {
				latitude: -29.0333,
				longitude: 167.95
			}, e.NG = {
				latitude: 10,
				longitude: 8
			}, e.NI = {
				latitude: 13,
				longitude: -85
			}, e.NL = {
				latitude: 52.5,
				longitude: 5.75
			}, e.NO = {
				latitude: 62,
				longitude: 10
			}, e.NP = {
				latitude: 28,
				longitude: 84
			}, e.NR = {
				latitude: -.5333,
				longitude: 166.9167
			}, e.NU = {
				latitude: -19.0333,
				longitude: -169.8667
			}, e.NZ = {
				latitude: -41,
				longitude: 174
			}, e.OM = {
				latitude: 21,
				longitude: 57
			}, e.PA = {
				latitude: 9,
				longitude: -80
			}, e.PE = {
				latitude: -10,
				longitude: -76
			}, e.PF = {
				latitude: -15,
				longitude: -140
			}, e.PG = {
				latitude: -6,
				longitude: 147
			}, e.PH = {
				latitude: 13,
				longitude: 122
			}, e.PK = {
				latitude: 30,
				longitude: 70
			}, e.PL = {
				latitude: 52,
				longitude: 20
			}, e.PM = {
				latitude: 46.8333,
				longitude: -56.3333
			}, e.PR = {
				latitude: 18.25,
				longitude: -66.5
			}, e.PS = {
				latitude: 32,
				longitude: 35.25
			}, e.PT = {
				latitude: 39.5,
				longitude: -8
			}, e.PW = {
				latitude: 7.5,
				longitude: 134.5
			}, e.PY = {
				latitude: -23,
				longitude: -58
			}, e.QA = {
				latitude: 25.5,
				longitude: 51.25
			}, e.RE = {
				latitude: -21.1,
				longitude: 55.6
			}, e.RO = {
				latitude: 46,
				longitude: 25
			}, e.RS = {
				latitude: 44,
				longitude: 21
			}, e.RU = {
				latitude: 60,
				longitude: 100
			}, e.RW = {
				latitude: -2,
				longitude: 30
			}, e.SA = {
				latitude: 25,
				longitude: 45
			}, e.SB = {
				latitude: -8,
				longitude: 159
			}, e.SC = {
				latitude: -4.5833,
				longitude: 55.6667
			}, e.SD = {
				latitude: 15,
				longitude: 30
			}, e.SE = {
				latitude: 62,
				longitude: 15
			}, e.SG = {
				latitude: 1.3667,
				longitude: 103.8
			}, e.SH = {
				latitude: -15.9333,
				longitude: -5.7
			}, e.SI = {
				latitude: 46,
				longitude: 15
			}, e.SJ = {
				latitude: 78,
				longitude: 20
			}, e.SK = {
				latitude: 48.6667,
				longitude: 19.5
			}, e.SL = {
				latitude: 8.5,
				longitude: -11.5
			}, e.SM = {
				latitude: 43.7667,
				longitude: 12.4167
			}, e.SN = {
				latitude: 14,
				longitude: -14
			}, e.SO = {
				latitude: 10,
				longitude: 49
			}, e.SR = {
				latitude: 4,
				longitude: -56
			}, e.ST = {
				latitude: 1,
				longitude: 7
			}, e.SV = {
				latitude: 13.8333,
				longitude: -88.9167
			}, e.SY = {
				latitude: 35,
				longitude: 38
			}, e.SZ = {
				latitude: -26.5,
				longitude: 31.5
			}, e.TC = {
				latitude: 21.75,
				longitude: -71.5833
			}, e.TD = {
				latitude: 15,
				longitude: 19
			}, e.TF = {
				latitude: -43,
				longitude: 67
			}, e.TG = {
				latitude: 8,
				longitude: 1.1667
			}, e.TH = {
				latitude: 15,
				longitude: 100
			}, e.TJ = {
				latitude: 39,
				longitude: 71
			}, e.TK = {
				latitude: -9,
				longitude: -172
			}, e.TM = {
				latitude: 40,
				longitude: 60
			}, e.TN = {
				latitude: 34,
				longitude: 9
			}, e.TO = {
				latitude: -20,
				longitude: -175
			}, e.TR = {
				latitude: 39,
				longitude: 35
			}, e.TT = {
				latitude: 11,
				longitude: -61
			}, e.TV = {
				latitude: -8,
				longitude: 178
			}, e.TW = {
				latitude: 23.5,
				longitude: 121
			}, e.TZ = {
				latitude: -6,
				longitude: 35
			}, e.UA = {
				latitude: 49,
				longitude: 32
			}, e.UG = {
				latitude: 1,
				longitude: 32
			}, e.UM = {
				latitude: 19.2833,
				longitude: 166.6
			}, e.US = {
				latitude: 38,
				longitude: -97
			}, e.UY = {
				latitude: -33,
				longitude: -56
			}, e.UZ = {
				latitude: 41,
				longitude: 64
			}, e.VA = {
				latitude: 41.9,
				longitude: 12.45
			}, e.VC = {
				latitude: 13.25,
				longitude: -61.2
			}, e.VE = {
				latitude: 8,
				longitude: -66
			}, e.VG = {
				latitude: 18.5,
				longitude: -64.5
			}, e.VI = {
				latitude: 18.3333,
				longitude: -64.8333
			}, e.VN = {
				latitude: 16,
				longitude: 106
			}, e.VU = {
				latitude: -16,
				longitude: 167
			}, e.WF = {
				latitude: -13.3,
				longitude: -176.2
			}, e.WS = {
				latitude: -13.5833,
				longitude: -172.3333
			}, e.YE = {
				latitude: 15,
				longitude: 48
			}, e.YT = {
				latitude: -12.8333,
				longitude: 45.1667
			}, e.ZA = {
				latitude: -29,
				longitude: 24
			}, e.ZM = {
				latitude: -15,
				longitude: 30
			}, e.ZW = {
				latitude: -20,
				longitude: 30
			};
			for(var t, a = [{
					code: "AF",
					name: "Afghanistan",
					value: 32358260,
					color: "#eea638"
				}, {
					code: "AL",
					name: "Albania",
					value: 3215988,
					color: "#d8854f"
				}, {
					code: "DZ",
					name: "Algeria",
					value: 35980193,
					color: "#de4c4f"
				}, {
					code: "AO",
					name: "Angola",
					value: 19618432,
					color: "#de4c4f"
				}, {
					code: "AR",
					name: "Argentina",
					value: 40764561,
					color: "#86a965"
				}, {
					code: "AM",
					name: "Armenia",
					value: 3100236,
					color: "#d8854f"
				}, {
					code: "AU",
					name: "Australia",
					value: 22605732,
					color: "#8aabb0"
				}, {
					code: "AT",
					name: "Austria",
					value: 8413429,
					color: "#d8854f"
				}, {
					code: "AZ",
					name: "Azerbaijan",
					value: 9306023,
					color: "#d8854f"
				}, {
					code: "BH",
					name: "Bahrain",
					value: 1323535,
					color: "#eea638"
				}, {
					code: "BD",
					name: "Bangladesh",
					value: 150493658,
					color: "#eea638"
				}, {
					code: "BY",
					name: "Belarus",
					value: 9559441,
					color: "#d8854f"
				}, {
					code: "BE",
					name: "Belgium",
					value: 10754056,
					color: "#d8854f"
				}, {
					code: "BJ",
					name: "Benin",
					value: 9099922,
					color: "#de4c4f"
				}, {
					code: "BT",
					name: "Bhutan",
					value: 738267,
					color: "#eea638"
				}, {
					code: "BO",
					name: "Bolivia",
					value: 10088108,
					color: "#86a965"
				}, {
					code: "BA",
					name: "Bosnia and Herzegovina",
					value: 3752228,
					color: "#d8854f"
				}, {
					code: "BW",
					name: "Botswana",
					value: 2030738,
					color: "#de4c4f"
				}, {
					code: "BR",
					name: "Brazil",
					value: 196655014,
					color: "#86a965"
				}, {
					code: "BN",
					name: "Brunei",
					value: 405938,
					color: "#eea638"
				}, {
					code: "BG",
					name: "Bulgaria",
					value: 7446135,
					color: "#d8854f"
				}, {
					code: "BF",
					name: "Burkina Faso",
					value: 16967845,
					color: "#de4c4f"
				}, {
					code: "BI",
					name: "Burundi",
					value: 8575172,
					color: "#de4c4f"
				}, {
					code: "KH",
					name: "Cambodia",
					value: 14305183,
					color: "#eea638"
				}, {
					code: "CM",
					name: "Cameroon",
					value: 20030362,
					color: "#de4c4f"
				}, {
					code: "CA",
					name: "Canada",
					value: 34349561,
					color: "#a7a737"
				}, {
					code: "CV",
					name: "Cape Verde",
					value: 500585,
					color: "#de4c4f"
				}, {
					code: "CF",
					name: "Central African Rep.",
					value: 4486837,
					color: "#de4c4f"
				}, {
					code: "TD",
					name: "Chad",
					value: 11525496,
					color: "#de4c4f"
				}, {
					code: "CL",
					name: "Chile",
					value: 17269525,
					color: "#86a965"
				}, {
					code: "CN",
					name: "China",
					value: 1347565324,
					color: "#eea638"
				}, {
					code: "CO",
					name: "Colombia",
					value: 46927125,
					color: "#86a965"
				}, {
					code: "KM",
					name: "Comoros",
					value: 753943,
					color: "#de4c4f"
				}, {
					code: "CD",
					name: "Congo, Dem. Rep.",
					value: 67757577,
					color: "#de4c4f"
				}, {
					code: "CG",
					name: "Congo, Rep.",
					value: 4139748,
					color: "#de4c4f"
				}, {
					code: "CR",
					name: "Costa Rica",
					value: 4726575,
					color: "#a7a737"
				}, {
					code: "CI",
					name: "Cote d'Ivoire",
					value: 20152894,
					color: "#de4c4f"
				}, {
					code: "HR",
					name: "Croatia",
					value: 4395560,
					color: "#d8854f"
				}, {
					code: "CU",
					name: "Cuba",
					value: 11253665,
					color: "#a7a737"
				}, {
					code: "CY",
					name: "Cyprus",
					value: 1116564,
					color: "#d8854f"
				}, {
					code: "CZ",
					name: "Czech Rep.",
					value: 10534293,
					color: "#d8854f"
				}, {
					code: "DK",
					name: "Denmark",
					value: 5572594,
					color: "#d8854f"
				}, {
					code: "DJ",
					name: "Djibouti",
					value: 905564,
					color: "#de4c4f"
				}, {
					code: "DO",
					name: "Dominican Rep.",
					value: 10056181,
					color: "#a7a737"
				}, {
					code: "EC",
					name: "Ecuador",
					value: 14666055,
					color: "#86a965"
				}, {
					code: "EG",
					name: "Egypt",
					value: 82536770,
					color: "#de4c4f"
				}, {
					code: "SV",
					name: "El Salvador",
					value: 6227491,
					color: "#a7a737"
				}, {
					code: "GQ",
					name: "Equatorial Guinea",
					value: 720213,
					color: "#de4c4f"
				}, {
					code: "ER",
					name: "Eritrea",
					value: 5415280,
					color: "#de4c4f"
				}, {
					code: "EE",
					name: "Estonia",
					value: 1340537,
					color: "#d8854f"
				}, {
					code: "ET",
					name: "Ethiopia",
					value: 84734262,
					color: "#de4c4f"
				}, {
					code: "FJ",
					name: "Fiji",
					value: 868406,
					color: "#8aabb0"
				}, {
					code: "FI",
					name: "Finland",
					value: 5384770,
					color: "#d8854f"
				}, {
					code: "FR",
					name: "France",
					value: 63125894,
					color: "#d8854f"
				}, {
					code: "GA",
					name: "Gabon",
					value: 1534262,
					color: "#de4c4f"
				}, {
					code: "GM",
					name: "Gambia",
					value: 1776103,
					color: "#de4c4f"
				}, {
					code: "GE",
					name: "Georgia",
					value: 4329026,
					color: "#d8854f"
				}, {
					code: "DE",
					name: "Germany",
					value: 82162512,
					color: "#d8854f"
				}, {
					code: "GH",
					name: "Ghana",
					value: 24965816,
					color: "#de4c4f"
				}, {
					code: "GR",
					name: "Greece",
					value: 11390031,
					color: "#d8854f"
				}, {
					code: "GT",
					name: "Guatemala",
					value: 14757316,
					color: "#a7a737"
				}, {
					code: "GN",
					name: "Guinea",
					value: 10221808,
					color: "#de4c4f"
				}, {
					code: "GW",
					name: "Guinea-Bissau",
					value: 1547061,
					color: "#de4c4f"
				}, {
					code: "GY",
					name: "Guyana",
					value: 756040,
					color: "#86a965"
				}, {
					code: "HT",
					name: "Haiti",
					value: 10123787,
					color: "#a7a737"
				}, {
					code: "HN",
					name: "Honduras",
					value: 7754687,
					color: "#a7a737"
				}, {
					code: "HK",
					name: "Hong Kong, China",
					value: 7122187,
					color: "#eea638"
				}, {
					code: "HU",
					name: "Hungary",
					value: 9966116,
					color: "#d8854f"
				}, {
					code: "IS",
					name: "Iceland",
					value: 324366,
					color: "#d8854f"
				}, {
					code: "IN",
					name: "India",
					value: 1241491960,
					color: "#eea638"
				}, {
					code: "ID",
					name: "Indonesia",
					value: 242325638,
					color: "#eea638"
				}, {
					code: "IR",
					name: "Iran",
					value: 74798599,
					color: "#eea638"
				}, {
					code: "IQ",
					name: "Iraq",
					value: 32664942,
					color: "#eea638"
				}, {
					code: "IE",
					name: "Ireland",
					value: 4525802,
					color: "#d8854f"
				}, {
					code: "IL",
					name: "Israel",
					value: 7562194,
					color: "#eea638"
				}, {
					code: "IT",
					name: "Italy",
					value: 60788694,
					color: "#d8854f"
				}, {
					code: "JM",
					name: "Jamaica",
					value: 2751273,
					color: "#a7a737"
				}, {
					code: "JP",
					name: "Japan",
					value: 126497241,
					color: "#eea638"
				}, {
					code: "JO",
					name: "Jordan",
					value: 6330169,
					color: "#eea638"
				}, {
					code: "KZ",
					name: "Kazakhstan",
					value: 16206750,
					color: "#eea638"
				}, {
					code: "KE",
					name: "Kenya",
					value: 41609728,
					color: "#de4c4f"
				}, {
					code: "KP",
					name: "Korea, Dem. Rep.",
					value: 24451285,
					color: "#eea638"
				}, {
					code: "KR",
					name: "Korea, Rep.",
					value: 48391343,
					color: "#eea638"
				}, {
					code: "KW",
					name: "Kuwait",
					value: 2818042,
					color: "#eea638"
				}, {
					code: "KG",
					name: "Kyrgyzstan",
					value: 5392580,
					color: "#eea638"
				}, {
					code: "LA",
					name: "Laos",
					value: 6288037,
					color: "#eea638"
				}, {
					code: "LV",
					name: "Latvia",
					value: 2243142,
					color: "#d8854f"
				}, {
					code: "LB",
					name: "Lebanon",
					value: 4259405,
					color: "#eea638"
				}, {
					code: "LS",
					name: "Lesotho",
					value: 2193843,
					color: "#de4c4f"
				}, {
					code: "LR",
					name: "Liberia",
					value: 4128572,
					color: "#de4c4f"
				}, {
					code: "LY",
					name: "Libya",
					value: 6422772,
					color: "#de4c4f"
				}, {
					code: "LT",
					name: "Lithuania",
					value: 3307481,
					color: "#d8854f"
				}, {
					code: "LU",
					name: "Luxembourg",
					value: 515941,
					color: "#d8854f"
				}, {
					code: "MK",
					name: "Macedonia, FYR",
					value: 2063893,
					color: "#d8854f"
				}, {
					code: "MG",
					name: "Madagascar",
					value: 21315135,
					color: "#de4c4f"
				}, {
					code: "MW",
					name: "Malawi",
					value: 15380888,
					color: "#de4c4f"
				}, {
					code: "MY",
					name: "Malaysia",
					value: 28859154,
					color: "#eea638"
				}, {
					code: "ML",
					name: "Mali",
					value: 15839538,
					color: "#de4c4f"
				}, {
					code: "MR",
					name: "Mauritania",
					value: 3541540,
					color: "#de4c4f"
				}, {
					code: "MU",
					name: "Mauritius",
					value: 1306593,
					color: "#de4c4f"
				}, {
					code: "MX",
					name: "Mexico",
					value: 114793341,
					color: "#a7a737"
				}, {
					code: "MD",
					name: "Moldova",
					value: 3544864,
					color: "#d8854f"
				}, {
					code: "MN",
					name: "Mongolia",
					value: 2800114,
					color: "#eea638"
				}, {
					code: "ME",
					name: "Montenegro",
					value: 632261,
					color: "#d8854f"
				}, {
					code: "MA",
					name: "Morocco",
					value: 32272974,
					color: "#de4c4f"
				}, {
					code: "MZ",
					name: "Mozambique",
					value: 23929708,
					color: "#de4c4f"
				}, {
					code: "MM",
					name: "Myanmar",
					value: 48336763,
					color: "#eea638"
				}, {
					code: "NA",
					name: "Namibia",
					value: 2324004,
					color: "#de4c4f"
				}, {
					code: "NP",
					name: "Nepal",
					value: 30485798,
					color: "#eea638"
				}, {
					code: "NL",
					name: "Netherlands",
					value: 16664746,
					color: "#d8854f"
				}, {
					code: "NZ",
					name: "New Zealand",
					value: 4414509,
					color: "#8aabb0"
				}, {
					code: "NI",
					name: "Nicaragua",
					value: 5869859,
					color: "#a7a737"
				}, {
					code: "NE",
					name: "Niger",
					value: 16068994,
					color: "#de4c4f"
				}, {
					code: "NG",
					name: "Nigeria",
					value: 162470737,
					color: "#de4c4f"
				}, {
					code: "NO",
					name: "Norway",
					value: 4924848,
					color: "#d8854f"
				}, {
					code: "OM",
					name: "Oman",
					value: 2846145,
					color: "#eea638"
				}, {
					code: "PK",
					name: "Pakistan",
					value: 176745364,
					color: "#eea638"
				}, {
					code: "PA",
					name: "Panama",
					value: 3571185,
					color: "#a7a737"
				}, {
					code: "PG",
					name: "Papua New Guinea",
					value: 7013829,
					color: "#8aabb0"
				}, {
					code: "PY",
					name: "Paraguay",
					value: 6568290,
					color: "#86a965"
				}, {
					code: "PE",
					name: "Peru",
					value: 29399817,
					color: "#86a965"
				}, {
					code: "PH",
					name: "Philippines",
					value: 94852030,
					color: "#eea638"
				}, {
					code: "PL",
					name: "Poland",
					value: 38298949,
					color: "#d8854f"
				}, {
					code: "PT",
					name: "Portugal",
					value: 10689663,
					color: "#d8854f"
				}, {
					code: "PR",
					name: "Puerto Rico",
					value: 3745526,
					color: "#a7a737"
				}, {
					code: "QA",
					name: "Qatar",
					value: 1870041,
					color: "#eea638"
				}, {
					code: "RO",
					name: "Romania",
					value: 21436495,
					color: "#d8854f"
				}, {
					code: "RU",
					name: "Russia",
					value: 142835555,
					color: "#d8854f"
				}, {
					code: "RW",
					name: "Rwanda",
					value: 10942950,
					color: "#de4c4f"
				}, {
					code: "SA",
					name: "Saudi Arabia",
					value: 28082541,
					color: "#eea638"
				}, {
					code: "SN",
					name: "Senegal",
					value: 12767556,
					color: "#de4c4f"
				}, {
					code: "RS",
					name: "Serbia",
					value: 9853969,
					color: "#d8854f"
				}, {
					code: "SL",
					name: "Sierra Leone",
					value: 5997486,
					color: "#de4c4f"
				}, {
					code: "SG",
					name: "Singapore",
					value: 5187933,
					color: "#eea638"
				}, {
					code: "SK",
					name: "Slovak Republic",
					value: 5471502,
					color: "#d8854f"
				}, {
					code: "SI",
					name: "Slovenia",
					value: 2035012,
					color: "#d8854f"
				}, {
					code: "SB",
					name: "Solomon Islands",
					value: 552267,
					color: "#8aabb0"
				}, {
					code: "SO",
					name: "Somalia",
					value: 9556873,
					color: "#de4c4f"
				}, {
					code: "ZA",
					name: "South Africa",
					value: 50459978,
					color: "#de4c4f"
				}, {
					code: "ES",
					name: "Spain",
					value: 46454895,
					color: "#d8854f"
				}, {
					code: "LK",
					name: "Sri Lanka",
					value: 21045394,
					color: "#eea638"
				}, {
					code: "SD",
					name: "Sudan",
					value: 34735288,
					color: "#de4c4f"
				}, {
					code: "SR",
					name: "Suriname",
					value: 529419,
					color: "#86a965"
				}, {
					code: "SZ",
					name: "Swaziland",
					value: 1203330,
					color: "#de4c4f"
				}, {
					code: "SE",
					name: "Sweden",
					value: 9440747,
					color: "#d8854f"
				}, {
					code: "CH",
					name: "Switzerland",
					value: 7701690,
					color: "#d8854f"
				}, {
					code: "SY",
					name: "Syria",
					value: 20766037,
					color: "#eea638"
				}, {
					code: "TW",
					name: "Taiwan",
					value: 23072e3,
					color: "#eea638"
				}, {
					code: "TJ",
					name: "Tajikistan",
					value: 6976958,
					color: "#eea638"
				}, {
					code: "TZ",
					name: "Tanzania",
					value: 46218486,
					color: "#de4c4f"
				}, {
					code: "TH",
					name: "Thailand",
					value: 69518555,
					color: "#eea638"
				}, {
					code: "TG",
					name: "Togo",
					value: 6154813,
					color: "#de4c4f"
				}, {
					code: "TT",
					name: "Trinidad and Tobago",
					value: 1346350,
					color: "#a7a737"
				}, {
					code: "TN",
					name: "Tunisia",
					value: 10594057,
					color: "#de4c4f"
				}, {
					code: "TR",
					name: "Turkey",
					value: 73639596,
					color: "#d8854f"
				}, {
					code: "TM",
					name: "Turkmenistan",
					value: 5105301,
					color: "#eea638"
				}, {
					code: "UG",
					name: "Uganda",
					value: 34509205,
					color: "#de4c4f"
				}, {
					code: "UA",
					name: "Ukraine",
					value: 45190180,
					color: "#d8854f"
				}, {
					code: "AE",
					name: "United Arab Emirates",
					value: 7890924,
					color: "#eea638"
				}, {
					code: "GB",
					name: "United Kingdom",
					value: 62417431,
					color: "#d8854f"
				}, {
					code: "US",
					name: "United States",
					value: 313085380,
					color: "#a7a737"
				}, {
					code: "UY",
					name: "Uruguay",
					value: 3380008,
					color: "#86a965"
				}, {
					code: "UZ",
					name: "Uzbekistan",
					value: 27760267,
					color: "#eea638"
				}, {
					code: "VE",
					name: "Venezuela",
					value: 29436891,
					color: "#86a965"
				}, {
					code: "PS",
					name: "West Bank and Gaza",
					value: 4152369,
					color: "#eea638"
				}, {
					code: "VN",
					name: "Vietnam",
					value: 88791996,
					color: "#eea638"
				}, {
					code: "YE",
					name: "Yemen, Rep.",
					value: 24799880,
					color: "#eea638"
				}, {
					code: "ZM",
					name: "Zambia",
					value: 13474959,
					color: "#de4c4f"
				}, {
					code: "ZW",
					name: "Zimbabwe",
					value: 12754378,
					color: "#de4c4f"
				}], l = 3, o = 70, i = 1 / 0, d = -(1 / 0), n = 0; n < a.length; n++) {
				var u = a[n].value;
				i > u && (i = u), u > d && (d = u)
			}
			AmCharts.ready(function() {
				AmCharts.theme = AmCharts.themes.dark, t = new AmCharts.AmMap, t.pathToImages = App.getGlobalPluginsPath() + "amcharts/ammap/images/", t.fontFamily = "Open Sans", t.fontSize = "13", t.color = "#888", t.addTitle("Population of the World in 2011", 14), t.addTitle("source: Gapminder", 11), t.areasSettings = {
					unlistedAreasColor: "#000000",
					unlistedAreasAlpha: .1
				}, t.imagesSettings.balloonText = "<span style='font-size:14px;'><b>[[title]]</b>: [[value]]</span>";
				for(var n = {
						mapVar: AmCharts.maps.worldLow,
						images: []
					}, u = 0; u < a.length; u++) {
					var r = a[u],
						c = r.value,
						s = (c - i) / (d - i) * (o - l) + l;
					l > s && (s = l);
					var g = r.code;
					n.images.push({
						type: "circle",
						width: s,
						height: s,
						color: r.color,
						longitude: e[g].longitude,
						latitude: e[g].latitude,
						title: r.name,
						value: c
					})
				}
				t.dataProvider = n, t.write("chart_10")
			}), $("#chart_10").closest(".portlet").find(".fullscreen").click(function() {
				t.invalidateSize()
			})
		}
	return {
		init: function() {
			 i() , h() ,j()
		}
	}
}();

var	t = function(json) {

	var e = AmCharts.makeChart("dashboard_amchart_1", {
//		type: "serial",
//		theme: "light",
//		fontFamily: "Microsoft YaHei",
//		color: "#6c7b88",
		type: "serial",
		fontSize: 12,
		fontFamily: "Microsoft YaHei",
		dataDateFormat: "YYYY-MM-DD",
		dataProvider: e,
		addClassNames: !0,
		startDuration: 1,
		color: "#6c7b88",
		marginLeft: 0,
		legend: {
				bulletType: "round",
				equalWidths: !1,
				valueWidth: 120,
				useGraphSettings: !0,
				color: "#6c7b88"
			},
		dataProvider: json,
		valueAxes: [{
			id: "a1",
			title: "访问量(页)",
			gridAlpha: 0,
			axisAlpha: 0,
		}, {
			id: "a2",
			title: "独立IP数(个)",
			position: "right",
			gridAlpha: 0,
			axisAlpha: 0,
		}],
		graphs: [{
				id: "g1",
				valueField: "distance",
				title: "访问量(页)",
				type: "column",
				fillAlphas: .7,
				valueAxis: "a1",
				balloonText: "访问量：[[value]] ",
				legendValueText: "[[value]] ",
				legendPeriodValueText: "总计: [[value.sum]] ",
				lineColor: "#08a3cc",
				alphaField: "alpha",
				colorField: "color",
				lineAlpha: 0,
			 },
			 
			 	{
                id: "g2",
                valueField: "duration",
                classNameField: "bulletClass",
                title: "独立IP数(个)",
                type: "line",
                valueAxis: "a2",
                lineColor: "#e26a6a",
                lineThickness: 2,
                legendValueText: "[[value]] ",
                legendPeriodValueText: "总计: [[value.sum]] ",
                bullet: "round",
                bulletBorderColor: "red",
                bulletBorderAlpha: 1,
                bulletBorderThickness: 2,
                bulletColor: "#fff",
                labelPosition: "right",
                balloonText: "独立IP数 :[[value]]",
                showBalloon: !0,
                animationPlayed: !0
            }],
		chartCursor: {
				zoomable: !1,
				categoryBalloonDateFormat: "YYYY.MM.DD",
				cursorAlpha: 0,
				categoryBalloonColor: "#e26a6a",
				categoryBalloonAlpha: .8,
				valueBalloonsEnabled: !1
		},
		dataDateFormat: "YYYY-MM-DD",
		categoryField: "date",
		categoryAxis: {

				parseDates: !0,
				minPeriod: "DD",
				autoGridCount: !1,
				gridCount: 50,
				gridAlpha: .1,
				gridColor: "#FFFFFF",
				axisColor: "#555555",
				dateFormats: [{
					period: "DD",
					format: "MM.DD"
				}, {
					period: "WW",
					format: "MMM DD"
				}, {
					period: "MM",
					format: "MMM"
				}, {
					period: "YYYY",
					format: "YYYY"
				}]
			},
		exportConfig: {
			menuBottom: "20px",
			menuRight: "22px",
			menuItems: [{
				icon: App.getGlobalPluginsPath() + "amcharts/amcharts/images/export.png",
				format: "png"
			}]
		}
	});
	$("#dashboard_amchart_1").closest(".portlet").find(".fullscreen").click(function() {
		e.invalidateSize()
	});
}


