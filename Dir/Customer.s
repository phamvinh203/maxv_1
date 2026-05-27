<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
	<!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">

	<!ENTITY CheckEInvoice "
if @hddt_yn = '1' begin
	if @tochuc_yn = '1' and isnull(@ma_so_thue, '') = '' begin
		select 'ma_so_thue' as field, @$hddt_mst as message
    	return
	end
	if isnull(@e_mail, '') = '' begin
		select 'e_mail' as field, @$hddt_email as message
    	return
	end
end
	">
	<!ENTITY CheckTaxCodeBegin "
		select @$typeConflict = rtrim(val) from options where name = 'm_kt_mst_trung' and val &lt;&gt; '0'
		if @ma_so_thue &lt;&gt; '' and @$typeConflict is not null and exists(select 1 from @@table where ma_so_thue = @ma_so_thue
	">
	
	 <!ENTITY CheckTaxCodeEnd ") begin
  if @$typeConflict = '2' begin
    select 'ma_so_thue' as field, replace(@$taxCodeConflict, '&#37;s', replace(replace(replace(rtrim(@ma_so_thue), '&amp;', '&amp;' + 'amp;'), '&lt;', '&amp;' + 'lt;'), '&gt;', '&amp;' + 'gt;')) as message
    return
  end else select @$scriptConflict = 'objectBehavior$TaxCode(this);'
end">
		
	<!ENTITY CheckTaxCodeWarning "if @$scriptConflict &lt;&gt; '' begin
  select '' as field, '' as message, @$scriptConflict as script
  return
end">
]>

<dir table="dmkh" code="ma_kh" order="ma_kh" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Khách hàng" e="Customer"></title>
	<fields>
		<field name="ma_so_thue" dataFormatString="@upperCaseFormat">
			<header v="Mã số thuế" e="Tax Code"></header>
			<items style="Mask"/>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48IpbmZr0R6WCSZE1kAb76kdj4nO0xLlP29hGKuAaZTEYATuxBy0kCued75YKQRKFA==</encrypted>]]></clientScript>
		</field>
		
		<field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
			<header v="Mã khách hàng" e="Customer ID"></header>
			<items style="Mask"/>
		</field>
		<field name="ten_kh" allowNulls="false">
			<header v="Tên khách hàng" e="Customer Name"></header>
		</field>
		<field name="ten_kh2">
			<header v="Tên khác" e="Other Name"></header>
		</field>
		<field name="dia_chi">
			<header v="Địa chỉ" e="Address"></header>
		</field>


		<field name="doi_tac">
			<header v="Đối tác" e="Partner"></header>
		</field>
		<field name="ma_nvbh">
			<header v="NV bán hàng" e="Sales Employee"></header>
			<items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
		</field>
		<field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="tk" clientDefault="Default">
			<header v="Tài khoản" e="Default Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
		</field>
		<field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="ma_tt" >
			<header v="Hạn thanh toán" e="Default Term"></header>
			<items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
		</field>
		<field name="ten_tt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="t_tien_cn" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
			<header v="Tiền nợ tối đa" e="Credit Limit"></header>
			<items style="Numeric"/>
		</field>

		<field name="kh_yn" type="Boolean" clientDefault="Default" defaultValue="true">
			<header v="Khách hàng" e="Customer"></header>
		</field>
		<field name="cc_yn" type="Boolean" clientDefault="Default" defaultValue="true">
			<header v="Nhà cung cấp" e="Supplier"></header>
		</field>
		<field name="nv_yn" type="Boolean" align="" clientDefault="Default" defaultValue="true">
			<header v="Nhân viên" e="Employee"></header>
		</field>
		<field name="nh_kh1" clientDefault="Default">
			<header v="Phân nhóm 1, 2, 3" e="Group 1, 2, 3"></header>
			<items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhkh.ten_nh%l"/>
		</field>
		<field name="ten_nh_kh1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="nh_kh2" clientDefault="Default">
			<header v="" e=""></header>
			<items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhkh.ten_nh%l"/>
		</field>
		<field name="ten_nh_kh2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="nh_kh3" clientDefault="Default">
			<header v="" e=""></header>
			<items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhkh.ten_nh%l"/>
		</field>
		<field name="ten_nh_kh3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="dien_thoai">
			<header v="Điện thoại" e="Phone Number"></header>
		</field>
		<field name="fax">
			<header v="Fax" e="Fax"></header>
		</field>
		<field name="e_mail">
			<header v="Email" e="Email"></header>
		</field>
		<field name="home_page">
			<header v="Website" e="Website"></header>
		</field>
		<field name="tk_nh" dataFormatString="@upperCaseFormat">
			<header v="Tài khoản ngân hàng" e="Bank Account"></header>
			<items style="Mask"/>
		</field>
		<field name="ngan_hang">
			<header v="Tên ngân hàng" e="Bank Name"></header>
		</field>
		<field name="tinh_thanh">
			<header v="Chi nhánh ngân hàng" e="Province/City"></header>
		</field>
		<field name="ghi_chu" rows="2">
			<header v="Ghi chú" e="Note"></header>
			<footer v="" e=""></footer>
		</field>
		<field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
			<header v="Trạng thái" e="Status"></header>
			<footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
			<items style="Mask"/>
		</field>

		<field name="tochuc_yn" dataFormatString="0, 1" clientDefault="1" align="right">
			<header v="Tổ chức / Cá nhân" e="Company / Personal"></header>
			<footer v="1 - Tổ chức, 0 - Cá nhân" e="1 - Company, 0 - Personal"></footer>
			<items style="Mask"/>
		</field>
	</fields>

	<views>
		<view id="Dir">
			<item value="120, 30, 60, 25, 70, 60, 35, 45, 65, 75, 25, 50"/>
			
			<item value="1100: [ma_so_thue].Label, [ma_so_thue]"/>
			<item value="1100: [ma_kh].Label, [ma_kh]"/>
			<item value="110000000000: [ten_kh].Label, [ten_kh]"/>
			<item value="110000000000: [ten_kh2].Label, [ten_kh2]"/>
			<item value="110000000000: [dia_chi].Label, [dia_chi]"/>
			<item value="110000: [doi_tac].Label, [doi_tac]"/>
			<item value="1100-1010000: [dien_thoai].Label, [dien_thoai], [fax].Label, [fax]"/>
			<item value="1100-1010000: [e_mail].Label, [e_mail], [home_page].Label,[home_page]"/>
			<item value="1100-1010000: [tk_nh].Label, [tk_nh], [ngan_hang].Label, [ngan_hang]"/>
			<item value="1100: [tinh_thanh].Label, [tinh_thanh]"/>
			<item value="1100-1011000: [t_tien_cn].Label, [t_tien_cn], [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
			<item value="110010000000: [tk].Label, [tk], [ten_tk%l] "/>
			
			<item value="11001000000: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
			<item value="110011001101: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l], [nh_kh2], [ten_nh_kh2%l], [nh_kh3], [ten_nh_kh3%l]"/>
			
			<item value="11100000000: [tochuc_yn].Label, [tochuc_yn], [tochuc_yn].Description"/>
			<item value="11100000000: [status].Label, [status], [status].Description"/>
			
			<item value="10000000000: [ghi_chu].Description"/>
			<item value="110000000000: [ghi_chu].Label, [ghi_chu]"/>
			<item value="-101-101-11: [kh_yn].Label, [kh_yn], [cc_yn].Label, [cc_yn], [nv_yn].Label, [nv_yn]"/>
		</view>
	</views>

	<commands>
	<command event="Loading">
		<text>
		<![CDATA[<encrypted>FV1Vfw071UAWba8gs76wdkvdSsaacV/XI7Ci9ZQe6vSc3p3bTcDih5Ic6490haaYCSMSPzfRc9oWoh/WflOboT0igosq8/WqBSIqEdkiLSBYl0oM6SOGg200/a/FwgxN</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
		<text>
			<![CDATA[<encrypted>FV1Vfw071UAWba8gs76wdu/z8ESqOGtQrFupl21ZFMLDQqtUl8LF/sHHWsKG5evMIY/A3QfIf0rk10fkZNVzAiPtrKiqvMZWEL16LfexjgLDfN7GhXBZSlvPcRz1/fu2</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SZZyp3eG0lrCirSQA46Yt93iMdn3ROjHAUqPja4QzeA8wVFSbnK1wirPNfKGWONMNeIyNPXLwaGC3g35+bbUCo=</encrypted>]]>
			</text>
		</command>

		<command event="Declare">
			<text>
				<![CDATA[<encrypted>mMw8WKEI9j76dJK8g2dDmESHHRkX8LmBsf2sailmv7JIbG7pXYxZ6QREMEhD1h/pNo+mLaSBUAXFm/qDq914A5eZJ1vVm/mzCKiZEHgrGOlrs+/Q+n7EPRpGAGZ7C8qVjOdZXciS9SdYuMOtTRx1EQCojqao3C23DV8RLztJyBNoLD8F+8hSyOIBEzk6spl+ziRnkO+odsOlMoBLT5X4RGdL91MarqRKjBs7R5UGbRwOOABudJXb9hkpVCSNQO73v8diI9Ca40Yzo9TXiTYZffG5UECFb7Pkfn1ULgFws9eUVXgHTo36W4GSwU95vfC/LVYUHenE9Inb29JTyWuYze/KbRzMpXxQmQkwyIoHhQtNGUnMj7XU0qCV9DZBP14V+umnR8BOMp+dX79S5V2ajsoXF79v/9dQAt5TxG+0Vf7GyYHmsuB6/uB+kNkck6ATw7p/JAMBcdgBKIAKgRMPUBY7NypSwZwkQVcsF9jRyC65+4kZFuO/34kJUU/32WV1AX7HpMesvmLkglqye45G7JovqfOQD+/qq4nJaTTGS+9Iqee15Ce6/I5MYOfrs4A+DCeQtP2n0H5XgxKJmRAWJ4cg6MLbTVREtbKHIedtdWl6whrr2s7FC5AkbvRC6y7DMnJ1JU50kkUOKqXn1gwpR/gOdcIiu8TdBjlC6t1O4F+JBa7PtjOpB6Auv6Is8p7XvGDJRmT7LNwyGTJu+TwM7GQwUnADY3f8rFuZzBK5n2AT4u/FhzX+NgcSQlyLDx4r2qBKaGMTiAK3xyB6tN7uiBOIBKPVSvHmsSM++g0rvVj735K4pMBKXldiJc0SFEc14RDguBliWMWBdPfA9owpQg==</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				<![CDATA[<encrypted>ri+364tP+6LHPexV+72EVVCs4tdYA51GCos1N3/rIcgTrXGd3rg3/L/2x93IGmh4DaqtCQEHzFINWjfZK8xtuDN1hW0oZc3fUJGBOOTqMeBLW8bY9A9l1CA8SQUkstL0Iw1QdpCuzqGJEy98Jks7Hg1P6KF/ywMKiLMft0jzKGt/MU5/0QoXSU+BDUM7AfQUamRB1fftc3n8psioWzHreg==</encrypted>]]>
&CheckTaxCodeBegin;
&CheckTaxCodeEnd;
<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7apPWStMxy488D1htMwWe78PUyCM7UmIDtynnP0GRGZLFY5Djvj27VH8OV2CRtfHyX5e87ewvKe4I3+pGM2Afc8=</encrypted>]]>
 
      </text>
    </command>

    <command event ="Inserted">
      <text>
        &CheckTaxCodeWarning;
      </text>
    </command>

		<command event="Updating">
			<text>
				<![CDATA[<encrypted>0VB6GjeRpMcyL1bJ3UsK2CgK2RzK2vpci49NnGpy281K7z4LO6G/h7/fIu5Yoc8PC3bVSgstLl4Bok1tEn8OZ7aLXWycSwbGgVNgIylNgKJRazknVo+WNK30ivF6AFjTRjbGCFO5u6JNuSROrD0SxNqmDgf5lCRS4AP4AcZLuVce1v1VHrBwKL5cyI4zPI/8PksJDsvKv4w4489txqlr/Ycihi8nfHDY5DlWcUz4eRus6FrPPH6/MCCaU0m8SSJBKmw35ri1hkHrOxeJYdtPlj8L+Bb82S3S1YjNDGVu9DygY/oyhL1dv8ZLwTSG9tRVF79/zpwqH/eJvWeQWwVDXqhyyG7vW7AzYehpLLPR+3+xrp12XT8GxzbPCRXVT/VcY5CwlXZWRM3UH2QUnM5OEg==</encrypted>]]>

&CheckTaxCodeBegin;<![CDATA[<encrypted>8oxPE9FmsQPiWXUjajOMb0blepen3vD0tbHCBJfv/dmoweGfjzCtiMp7b1mJUOcV</encrypted>]]>&CheckTaxCodeEnd;
			</text>
		</command>

		<command event="Updated">
			<text>
				<![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILRt4MS64bRaxxEowicdPXe3QhESIRNljqkoUPWXpRWMl</encrypted>]]>
			
			</text>
		</command>

		<command event="Deleting">
			<text>
				<![CDATA[<encrypted>mJdIHCy8e6p97sjfHgwVTP1UOVwae3T74X/GcL/PkvrS3eD2qTecRb4nVdLeZfMXf85MSdtTgBZlsdHLHBxC3CxXslZ6ysSDDRca2rrwtbkulQBJshY4E8+9wRiXlzIfENgCJcMbdpybuaNKd1rNLNrT73yMJ9Ai1skBwqnzNeadQ1iW2OrkKURq3um47uwez5vAq716Gr9YbVtk47uTCVS6hOJjeOLOihtch2Ej+jk=</encrypted>]]>
			</text>
		</command>

		<command event="Checking">
			<text>
				<![CDATA[<encrypted>zOAskGrSXygOzI+I6Z0NPf1XswU4apAd5IKX56g6JY8SZpASpGpYH5/nEsVV5ZX1HxKE0z5KXHbyGTzaj5MXp7+9gEfch3Ch3m4ncxe7UkqpNGrbR9uS7Fv80CM8omeHlrAiJ12VNBhrCUo89aNOIPWOjTwE9DKzwp3cUJgoBT+llHkMd9c3KIiXszD3HRLp+38CaiC0uEeu1/J6gmToqDodv3hO+WSNGpN77AqynQVvBVgMNbrJdIWGSzckJQvF00tb887IsvnberRrknLgeGXef4pAoz04RS6b+wfZ7c4xCTXTKsGk8gOjvWOlGu/finiNWnzZU87hBmicfStpvJlrdTf4Pcn1ROoXRDMaCYfcTEoXwQXJjdZ37PHZlTHkbEk4pmXdJ+aLirqX5eusOIwrnRptesMJ2bsf9Tg3KKQo/0AnTgHaUH6eDsJQkTFF</encrypted>]]>
			</text>
		</command>

	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>71uwY06Fa1uTWxg/qb+BHSJNh5ZD2cntvuitmhSEFkk/njJSfwLCHvjVOEpIKKHnfBTjSStYjR7aPE/ds5A5jbCxkCiLkd305RGjP/saV/rwcFlAStjqNn+/ONhSCmaQeSyZa9NHIlexMvt93N5u7CUzlbFojnqWpMdeWSokV4jAAm30sQyfj4j+TokJw+7Src+qIm5SmKMwZFhWuVl9k8EltMP8WnUHO7SZ0My1ryR15sLlYSKbsgm43+L2Ls60NKg3BgB39ZuVdD3pWB40xdP8aFk+hXwyJLA46VOA5wChtWT5XTstZyGZbRxUiBA3/4gHgwETFTAh5g1c110Ve8utpCNQogL+feFfP8EpzjhMqRMcO9d/qm6TkyREIwrcYc+853rRgcA/Ox1HUpW5CiNkPTOFTTugb2wlFFdRZG4mq5H88gCOH6L7RSJ4wSdSV3f2IneczwE8JVmXOzJgi7/Wxsa/y99OcbhTVgEbBN02cCIDiNVtthlDetKrFvgOUVMZz7U/CjfIKyJIKTt+LHHdhY0WSTayLGRD3oW4IeeylYfvHCLdYqlYUtasejwbYpIh8Nv1CzzIcXtBqwQ2/M3W8hLsjEh6zcpce9aDt9phVqpA2JnMexPYegmX7p8svdsDW/X4g5/gXkjx2QDS3vVwUlTmJKrKx0JzsLZ7Tm6NAebCQPCjPRXsmstVonPl8IqsrScAGyxrIElB5+Iu8paGbn1hvEqUOLpcKz9rFZ3qhjfF+P0WyE3pJNUmwKXjKK66bHW4QUZpE90DlxGR0yhHj/KxwRYxeGWZE/nLg1TMFvGNqyUAWArWaffaiPfaL3jU7PnibZKCOz2//1xe1V37o6ajrEolgp9/i5sFVp4txxLw+3yI+32O8UcyCSsB0r1OayMDBEjsr/9UpcmZUowj0k59y4WCuK/zrAkJmIzuNaXe5MXk3XR5r7BGTepm0ZjhXJywDRZsd2DMXQiPQR9KaF2mhGN1MXPYfYojCTNkJr6p1OVUDanzlAodoVmhhGjpeUyrfVRZZ85t5hHcVyosQyohbn6WJK5XlB3OB2PCkkx4ZxVL8Do6sAl52w3UJjNhvROFHLxwySQ+HwBLN0+h8a75xmJJeEC6ZkXHEDwjrXNFIJmowW+V5s1oI9idRptV6dOlJuTbRCE3nt8Wi3L+V2mlPn//hxrh9Bm3YRaorOc429xK96Lgpr6gJQ2nHdII2mJK1Jcu0EDS2Ec6B3i5xBw7AUckr04tgvMLaXM9UUykWeOX/jt7U8i4Ed8GhftmyDkAcCYptvv+0IMkJUd1FU6gdj1m1Kl/RokWoSkE00ji9VZ0kqBrSjfuBKwyqa4yVLzVTVgUwc8o+fOuf/h0Vbd8w7L6PltNno9TyVUaAz7a2niKCj2cpOe2oA5Wv1tY+Shtq1qOPyzjaHEyQv0pK/P+Ul+KQl1SZ5paaZw=</encrypted>]]>
			&ScriptSuggestion;
		</text>
	</script>

	<response>
		&XMLSuggestion;
	</response>

	<css>
		<text>
			<![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVR0xbbFIKFxZRLW2uDYGEcgYLeae6IAAtFlAYSUZoxgWFqvOmoqXtjxmlO8/9pBBNgHJqOEbh7WSNheJqhO6hL1Zm+hMPEwtTzQDEb+uxYFqSRX/9BpucHOaSLiyBB6maM4Z08GE0QkvHvOZjURhxYKCGOpHI9L2EM1DL+R0ijPg6WJ9gN0WFAoK1HOQ8BO7YqJGmuh9ZYxgPHLdi2ycJ/M=</encrypted>]]>
		</text>
	</css>
</dir>