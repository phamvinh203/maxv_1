<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
	<!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
	<!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
	<!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
	<!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

	<!ENTITY QueryString "
declare @c char(1), @d char(1)
select @c = char(253), @d = char(252)
select * into #t from dbo.MaxvOnline$Function$System$Split(@@queryString, @c)
update #t set data = replace(data, @d, '''')

declare @ma_vt varchar(32), @mau_bc varchar(32), @tu_ngay smalldatetime, @den_ngay smalldatetime, @ma_kh varchar(128), @ma_kho varchar(128), @ma_vv varchar(128)
  , @ma_nx varchar(128), @tk_vt varchar(128), @ma_gd varchar(128), @ma_ct varchar(128), @tinh_ps tinyint, @so_ct1 varchar(128), @so_ct2 varchar(128)
  , @ma_hd varchar(128), @ma_bp varchar(128), @ma_dvcs varchar(8000), @maxLength int, @loai_du_lieu varchar(128),@ma_sp varchar(32)

select @ma_vt = data from #t where id = 1
select @ma_sp = data from #t where id = 2

select @mau_bc = data from #t where id = 3
select @tu_ngay = data from #t where id = 4
select @den_ngay = data from #t where id = 5
select @ma_kh = data from #t where id = 6
select @ma_kho = data from #t where id = 7
select @ma_vv = data from #t where id = 8
select @ma_nx = data from #t where id = 9
select @tk_vt = data from #t where id = 10
select @ma_gd = data from #t where id = 11
select @ma_ct = data from #t where id = 12
select @tinh_ps = data from #t where id = 13
select @so_ct1 = data from #t where id = 14
select @so_ct2 = data from #t where id = 15
select @ma_hd = data from #t where id = 16
select @ma_bp = data from #t where id = 17
select @ma_dvcs = data from #t where id = 18
select @maxLength = data from #t where id = 19
select @loai_du_lieu = data from #t where id = 20

drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="Phát sinh chi tiết" e="Detail of Item"></title>
	<subTitle v="Vật tư: %c - %s. Từ ngày %d1 đến ngày %d2..." e="Item: %c - %s. Date from %d1 to %d2..."></subTitle>
	<fields>
		<field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
			<header v="Ngày hạch toán" e="VC Date"></header>
		</field>
		<field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
			<header v="Mã ct" e="VC Code"></header>
		</field>
		<field name="so_ct" width="90" align="right">
			<header v="Số chứng từ" e="Voucher No."></header>
		</field>

		<field name="ma_kh" width="100" aliasName="a">
			<header v="Mã khách" e="Customer"></header>
		</field>
		<field name="ten_kh%l" width="250" aliasName="b">
			<header v="Tên khách hàng" e="Customer Name"></header>
		</field>
		<field name="dien_giai" width="250">
			<header v="Diễn giải" e="Description"></header>
		</field>

		<field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
			<header v="Số lượng" e="Quantity"></header>
		</field>
		<field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
			<header v="Giá nt" e="FC Unit Price"></header>
		</field>
		<field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
			<header v="Tiền nt" e="FC Amt."></header>
		</field>
		<field name="ma_nt" width="60" aliasName="a">
			<header v="Mã nt" e="FC Code"></header>
		</field>
		<field name="ty_gia" width="100" type="Decimal" dataFormatString="@exchangeRateViewFormat">
			<header v="Tỷ giá" e="Exchange Rate"></header>
		</field>
		<field name="gia" width="100">
			<header v="Giá" e="Unit Price"></header>
		</field>
		<field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
			<header v="Tiền" e="Amount"></header>
		</field>

		<field name="ma_kho" width="100">
			<header v="Kho hàng" e="Site ID"></header>
		</field>
		<field name="tk_du" width="100" aliasName="a">
			<header v="Tài khoản" e="Account"></header>
		</field>

		<field name="ma_vv" width="100">
			<header v="Dự án" e="Project"></header>
		</field>
		<field name="ma_sp" width="100">
			<header v="Sản phẩm" e="Product"></header>
		</field>
		<field name="ma_bp" width="100">
			<header v="Phòng ban" e="Department"></header>
		</field>
		<field name="so_lsx" width="100">
			<header v="LSX" e="MO"></header>
		</field>

		<field name="stt_rec" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec0" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Grid">
		    <field name="ma_ct"/>
			<field name="ngay_ct"/>
			<field name="so_ct"/>
			<field name="ma_kh"/>
			<field name="ten_kh%l"/>
			<field name="dien_giai"/>

			<field name="sl_xuat"/>
			<field name="gia_nt"/>
			<field name="tien_nt_x"/>
			<field name="ma_nt"/>
			<field name="ty_gia"/>
			<field name="gia"/>
			<field name="tien_xuat"/>

			<field name="ma_kho"/>
			<field name="tk_du"/>
			<field name="ma_vv"/>
			<field name="ma_sp"/>
			<field name="ma_bp"/>
			<field name="so_lsx"/>

			<field name="stt_rec"/>
			<field name="stt_rec0"/>
		</view>
	</views>

	<commands>
		<command event ="Showing">
			<text>
				&QueryString;
				<![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9O0GBtQUsE2MuI/GgrPyBI3y4nFsGoRbfP4tVxS73n8MPqhWtIdDcw6+5Pq4fsnoThapRWLFWZBBEnpkjA12rNPYP39BkPNR5QT9iZeXsbDwPyqJWcDKhxhcVJmdd9Z7corjFnp8XmeS8rH3Uf+gFC5KN5FYTSl+pGsUdCT6Tc7ocuEwErdmm4EmvOLHpTqyRTPHU2SmsGDMjjm6+LmHV3B2fp40k3BPk++HDwj98lNuicsfG7xr/JHQXFLhRfn9+hjpqDcmO34GdoCKAY6Xg0HT/W07/rLp4CMvJYUKKSg1</encrypted>]]>
			</text>
		</command>

		&XMLWhenReportLoading;
		&XMLWhenReportClosing;
	</commands>

	<queries>
		<query event="Finding">
			<text>
				&QueryString;
				<![CDATA[<encrypted>aHcpWEg0vI12NTuUVTZM9a/z604jXQdDSf0gUeyi84sm+18uI2lMKW3R4g9cUsuoohTkzZpf5LRrHOTWEPb3KIRn8K177zsi0A3WuYYEjaEzy/PWcWJTFH4XVXUZy/60M/zkpQv0NxX0GKWfMLuYSMTyh4eLWFWGb2AfVgWg9Gj3whnvqzfmqP9aerZniSGb8PYch+OMSAjBBiifAJbWwvl69NyU9mRiZSKzzIDohUoDIg2h5T7po1sBbDSXs/iftTs1gZDrvWRyTi/I//zg7MTXBccklin4TmaT+yhMYlQ6kFfDhHDsUDL8f56oZZO+bsfEqBgvUBfmT4KT8w6st8+sCwoUYpXwTaBjHN7HU5kRaMn58+SUmWKpe61RZ/PAwxzdZw6707xm9ny421doZgz0EdXHglWB566rYqhm04hPWtqS5qpdlqwWV0nq7Sii1f8XLHHy7JGyjyuSdkA+84LyM2Iq1GMbyKHesagjSTW7TNjZs4CG57bP/Yv9i29tRNMYH9T+WWdPnrIywkB9xvM3sb5KG1y8VqP7bc1ozHJaGGY+D+CXd3h24xyUYfTguonapj4IH8vhR7PQKvApTA0mpU60AahpBuYmrYnxPhin1pcvdBwMU6r+iFh7KNKQ7NPgc7pXzVx0EXAMZlRXllkfjWrxKbz4Vk4RowDiZExaHlrbJD+yNF9tpAAr2b4t4W9f93gBhPECxlEgQosEtQ==</encrypted>]]>
			</text>
		</query>
	</queries>

	<script>
		<text>
			&JavascriptReportInit;
			<![CDATA[<encrypted>hLLCFCvaRpvP525Ph7qSg95RPV2OJ3UkLl0aMLGlcw6CCA+l1sSS/r5mxQUvu/rAAdq1NBkxMu5gKLcDYdZOj9riFyUCmuNPmz8mAV8pfcgR/R69APkEtAHeYfXOcQmZBno3NttZY9mh/ChOceUHeikaZkdwE24IQNbTXeQ6SFXBjHUPQv1sTzPzDFjT4vxgRK+yRVia3/c4WZmRgvglOqxrDjgN07Y09WZjTQj+PSt8bN0ZDnC/+P7LHIBeDDf5V5BltzZ/yYiMlrY4mjSxEz7spZjXY/TQKwR6oR2gdTTYUPiq55wChLHdFAhsF5tLCce429WZ6EaSvo8B8yOUTm5I7UXzEg7AiDN2ajNrBY0=</encrypted>]]>
		</text>
	</script>

	&XMLStandardQueryToolbar;
</grid>
