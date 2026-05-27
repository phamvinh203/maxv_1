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
declare @ma_ku varchar(128), @tu_ngay smalldatetime, @den_ngay smalldatetime, @ma_dvcs varchar(8000), @tk varchar(128), @ma_bc varchar(32)
select @ma_ku = data from #t where id = 1
select @tu_ngay = data from #t where id = 2
select @den_ngay = data from #t where id = 3
select @ma_dvcs = data from #t where id = 4
select @tk = data from #t where id = 5
select @ma_bc = data from #t where id = 6
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="Chi tiết phát sinh theo khế ước" e="Detail of Loan Contract"></title>
	<subTitle v="Khế ước: %c - %s, từ ngày %d1 đến ngày %d2..." e="Loan Contract: %c - %s, Date from %d1 to %d2..."></subTitle>
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
		<field name="ma_kh" width="100" aliasName ="a">
			<header v="Mã khách" e="Customer ID"></header>
		</field>
		<field name="ten_kh%l" width="300" aliasName ="b">
			<header v="Tên khách hàng" e="Customer Name"></header>
		</field>
		<field name="dien_giai" width="300">
			<header v="Diễn giải" e="Description"></header>
		</field>
		<field name="tk" width="100" aliasName ="a">
			<header v="Tài khoản" e="Account"></header>
		</field>
		<field name="tk_du" width="100">
			<header v="Tk đối ứng" e="Ref. Account"></header>
		</field>
		<field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
			<header v="Phát sinh nợ nt" e="FC Dr. Amount"></header>
		</field>
		<field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
			<header v="Phát sinh có nt" e="FC Cr. Amount"></header>
		</field>
		<field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
			<header v="Phát sinh nợ" e="Dr. Amount"></header>
		</field>
		<field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
			<header v="Phát sinh có" e="Cr. Amount"></header>
		</field>

		<field name="stt_rec" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="line_nbr" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="nh_dk" width="0" hidden="true">
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
			<field name="tk"/>
			<field name="tk_du"/>
			<field name="ps_no_nt"/>
			<field name="ps_co_nt"/>
			<field name="ps_no"/>
			<field name="ps_co"/>

			<field name="stt_rec"/>
			<field name="line_nbr"/>
			<field name="nh_dk"/>
		</view>
	</views>

	<commands>
		<command event ="Showing">
			<text>
				&QueryString;
				<![CDATA[<encrypted>w162C8J/g2S9RQTMwqTIg+yiLOfldD7djaU8DiFMm8KsdJR/CQ7NmLc6SNGAr3ksM51UHLdkgswpDWt7WfAssjyROrTHcLBieo9bVHJkcH8TK495d9gjx7cWdxHp4NMHDrkqCt9dKhn+q8BRxYeuTEkdFzV3EWmSJBwhYfkL/cgqqJn1Bqyvsd6hnj/B24KK3ua7+6VRfZ7rpph3+GZ3BMY0FssWp9p+xKzETYrY8BIpfa3/GO7Ii7q5YljIlQT/w668pmsemc49udJHWjQ1dJ4p6TXFhvatk16cfek1An/7AtfJu/y03FJQdUNppwc+kCtxi/YKBne5XUzaBu6MQg==</encrypted>]]>
			</text>
		</command>

		&XMLWhenReportLoading;
		&XMLWhenReportClosing;
	</commands>
	
	<queries>
		<query event="Finding">
			<text>

				&QueryString;

				<![CDATA[<encrypted>QgWBKedxBcnp33dgbOzDaLEABjf0le6+I07HW4NiBL9uZEbVUvHsEqimyBneraFDRNtLELnWUBZ0qcmMJ90IaOJtYk/jCpGTXXryFRz/QWj0niibz7NOJ117DOjKS0nsPxFlWgPSw4M2AXR50X8uPL6I2BfHZTugfJoiAHh9EkqJQvzfFfzQdghz/b0YXI7EmhJLUuFGSNiLztbpPm31ICurFQ1H3JRL4gaPDDDHlRLOVTygbLD005UqJkHXh9u5Ngp2gNSI5RkcwIyXozp4d6MXQ0jYnqc9AQNIEHwMyjPKGBHecLvB1SKa47atxC643KA6Oq0TtysHWfi/2CcmdLuQEMN28nGvKn/vk41DrBjmjyNfCccgMdHVN5CZlm4zHbuTN2ODyl8gjtloCwYT6BXbnmtT6QIvb5bAWUGSnrs=</encrypted>]]>
			</text>
		</query>
	</queries>

	<script>
		<text>

			&JavascriptReportInit;
			<![CDATA[<encrypted>TDR3aefioLXGbhRms0a/LJc1tEP7jIroiUfnO+wSX3o5YY9wVVfd9YL0nhRdYkYtTL0RFVm6fhgU+SwANyW2LxeOA/9lnr9TY6+xpmDydPnMXYhPcQEL4iK2KqTB3++K5GIEOrk8SaxO/4s87l6sLZbrCquR+4rUS3fZ00f5Ypx8GRCcJl7d0zmwr7VbUWuT+eVgTrjRaM57AZkfg6hOj2GYClUtYSiPSlc6ulSqPXOY1+NUuS6JPGk1VsjlyRO8bICYl3AumkQZrfR6zakGy+h8zbbgO4HHccZNt7eg5t3T8S3RMloqBgM3w2aemFDynic6dxB+wxOad+GSyIncAA==</encrypted>]]>
		</text>
	</script>

	&XMLStandardQueryToolbar;
</grid>