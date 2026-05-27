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
  , @ma_hd varchar(128), @ma_bp varchar(128), @ma_dvcs varchar(8000), @maxLength int, @loai_du_lieu varchar(128)

select @ma_vt = data from #t where id = 1
select @mau_bc = data from #t where id = 2
select @tu_ngay = data from #t where id = 3
select @den_ngay = data from #t where id = 4
select @ma_kh = data from #t where id = 5
select @ma_kho = data from #t where id = 6
select @ma_vv = data from #t where id = 7
select @ma_nx = data from #t where id = 8
select @tk_vt = data from #t where id = 9
select @ma_gd = data from #t where id = 10
select @ma_ct = data from #t where id = 11
select @tinh_ps = data from #t where id = 12
select @so_ct1 = data from #t where id = 13
select @so_ct2 = data from #t where id = 14
select @ma_hd = data from #t where id = 15
select @ma_bp = data from #t where id = 16
select @ma_dvcs = data from #t where id = 17
select @maxLength = data from #t where id = 18
select @loai_du_lieu = data from #t where id = 19

drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="Chi tiết hàng nhập kho" e="Goods Received Detailed "></title>
	<subTitle v="Vật tư: %c - %s. Từ ngày %d1 đến ngày %d2..." e="Item: %c - %s. Date from %d1 to %d2..."></subTitle>
	<fields>
		<field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
			<header v="Ngày hạch toán" e="VC. Date"></header>
		</field>
		<field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
			<header v="Mã ct" e="VC. Code"></header>
		</field>
		<field name="so_ct" width="90" align="right">
			<header v="Số chứng từ" e="Voucher No."></header>
		</field>

    <field name="ma_kh" width="100" aliasName="a">
			<header v="Mã khách" e="Customer"></header>
		</field>
		<field name="ten_kh%l" width="300" aliasName="b">
			<header v="Tên khách hàng" e="Customer Name"></header>
		</field>
		<field name="dien_giai" width="300">
			<header v="Diễn giải" e="Description"></header>
		</field>

		<field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
			<header v="Số lượng" e="Quantity"></header>
		</field>
		<field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
			<header v="Giá nt" e="FC Unit Price"></header>
		</field>
		<field name="tien_nt_n" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat">
			<header v="Tiền nt" e="FC Amount"></header>
		</field>
		<field name="ma_nt" width="60" aliasName="c">
			<header v="Mã nt" e="FC Code"></header>
		</field>
		<field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat">
			<header v="Tỷ giá" e="Exchange Rate"></header>
		</field>
		<field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
			<header v="Giá" e="Unit Price"></header>
		</field>
		<field name="tien_nhap" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
			<header v="Tiền" e="Amount"></header>
		</field>

		<field name="ma_kho" width="100">
			<header v="Mã kho" e="Site"></header>
		</field>
		<field name="ma_vv" width="100">
			<header v="Dự án" e="Project"></header>
		</field>
		<field name="tk_du" width="100" aliasName="a">
			<header v="Tài khoản" e="Account"></header>
		</field>
		<field name="ten_nx%l" width="300" aliasName="c" hidden="true">
			<header v="Tên nhập xuất" e="Reason Name"></header>
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

			<field name="sl_nhap"/>
			<field name="gia_nt"/>
			<field name="tien_nt_n"/>
			<field name="ma_nt"/>
			<field name="ty_gia"/>
			<field name="gia"/>
			<field name="tien_nhap"/>

			<field name="ma_kho"/>
			<field name="ma_vv"/>
			<field name="tk_du"/>
			<field name="ten_nx%l"/>

			<field name="stt_rec"/>
			<field name="stt_rec0"/>
		</view>
	</views>

	<commands>
		<command event ="Showing">
			<text>
				&QueryString;
				<![CDATA[<encrypted>w162C8J/g2S9RQTMwqTIg0vVqcABgbyCsd+c8zzRry29+mC09trutiekUqDNPzqBwgDj2DQmcJ68aU7UkvX60svrvVkaRuv/OPWxIeOP32Aecx9CjZYKCtLCuvC1DBZdqFZtQxAml0lG6bgKkTtMb0H7pVxxKXp/G1urL1cgzKt2isC+KdLpLOdH9BjDwNq521BjRRdy7mCnLxt76XN25vC9LoNUQCU9+9BxDgVmfBt6s+uLTrAdzlBKJMY2fybiYiBNDvYHqXFp+ZinA4uZGYfjV5jW/XTNc68KEQ2xkV0DPK7Vt2sXFgGtmDFPB4C11wpIPGP+mx7tjaPOxyQW6A==</encrypted>]]>
			</text>
		</command>

		&XMLWhenReportLoading;
		&XMLWhenReportClosing;
	</commands>

	<queries>
		<query event="Finding">
			<text>
				&QueryString;
				<![CDATA[<encrypted>aHcpWEg0vI12NTuUVTZM9R4HtqW/Hx8tT4dJugzF5b94zlSSP7wW176gmGNURST2VJS40HRCLgatuLO55dIPb+GWsEmf/ngSEeEH7+mbSZqrMnbczTOH6Q+0uL1z8KszjrHKoa8fVxKyUL45pKVEimrdZCciBAOagqSOr9175bIEHNGd2tvcbkRapgNOryD5IPqCs4dsLK6cagJwRfFecfAV6ff1an35Z8RahQIvGUboCNadrGYETs668obeY4GsBAOXKOG5UDGzBrt5u7RfF4D8PfAJqQ48AgIuvWu04+EOCu9f/R98cOtpkG2zsAoFeLaOcd7PF2sU9aEQtMNcvpdyF3MSaY+QurleRQTH4jFDK0sqw/S+r7bWDmHQZ1CK4ChrNdaBDSNKWpssbfU0OhAbJE4wwjh+eRP0U2B6veNNi79O6fASEST/g75+AM9/T+imm3F5K5k9adbJB0EeRH5erYsjLzYtsB3Oj8pxQnNXn7v7TwMww+l0nrkikiBrVuDb4b61x2F5UAVgOmRQUSlBJYog2tDnrliEMlXXyjNDLh34tqG6rC40VxWyK2rYFXmr/qbi6xUNiFgcGLQLOstnYQo/+UiXYDbZj0UIN4cCkJvNqMH0upRi+meJGmwkEoNkogFuhG4QkPYpv0X1ME3nYoVqwK3LXLGLIAD6sAY3rnUqImNJgiFagevKqBBGwFXTd1pNvwDoO4X/+Kltvg==</encrypted>]]>
			</text>
		</query>
	</queries>

	<script>
		<text>
			&JavascriptReportInit;
			<![CDATA[<encrypted>hLLCFCvaRpvP525Ph7qSg0dXph7f7zs4Hi/QWlcDmR+s+VWhiTjl7vLfSKiZlD8sMxyi7B/3VwVPx7fm2p8RZJoDpoDh1etmzige8IaMspX7kzevnndAVwj7B7xx5SuG8L0kMKsjGqhMnkjUGAq9xfaQKqbsCrfEqduBGuOQYbBF2T1z0/5/WcCxNeZ/zGaAGEOl95uFA6AZ4k6yn4nROUb90DDNXhScQmhh8gnAJQ/v7zIwGyaVtoV0OVwNKiRhJkH1YpBIr/fH7sba5/MAfPOH6M0YMdefHE8ht1ZurULCNUFJHK0g6diLlAzN/VAtzYGf82AWK/dZMqwWXhhb/Zqz1vKgdlE6AcorAZ6YsNFK1cUJacFdEsC+DwpjgENV</encrypted>]]>
		</text>
	</script>

	&XMLStandardQueryToolbar;
</grid>
