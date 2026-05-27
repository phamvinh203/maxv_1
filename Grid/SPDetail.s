<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
	<!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
	<!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
	<!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
	<!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
	<!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
	<!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
	<!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetCreditTaxRate.xml">
]>

<grid table="d25$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB4" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="" e=""></title>
	<subTitle v="" e=""></subTitle>
	<partition table="c25$000000" prime="d25$" inquiry="i25$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

	<fields>
		<field name="ma_vt" allowNulls="false" width="100" aliasName="a">
			<header v="Mã hàng" e="Item Code"></header>
			<items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
			<handle source="dmvt.ma_vt" foreward="true"/>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
		</field>
		<field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b">
			<header v="Tên mặt hàng" e="Item Description"></header>
		</field>
		<field name="dvt" allowNulls="false" width="50" aliasName="a">
			<header v="Đvt" e="UOM"></header>
			<items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
			<handle key="[nhieu_dvt]"/>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO5Vu7zotkPNh5UDN2V7J3FvVhxkFLSxLNK45HvA2sFImSqzms1JcVt8xLVy+uouIk=</encrypted>]]></clientScript>
		</field>
		<field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
			<header v="" e=""></header>
			<items style="Numeric"/>
		</field>

		<field name="ma_kho" allowNulls="false" width="80" clientDefault="Default" aliasName="a">
			<header v="Mã kho" e="Site"></header>
			<items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="ma_dvcs = @@unit" information="ma_kho$dmkho.ten_kho%l"/>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOsOqCtEJw8sjaJ5AuNCmVB8Q41yuCdKH1zOr5VMa0apGYKxfxKZc1r+KNu1g7NZfk=</encrypted>]]></clientScript>
		</field>
		<field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
			<header v="Mã vị trí" e="Location"></header>
			<items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
		</field>
		<field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="ma_lo" width="80">
			<header v="Mã lô" e="Lot"></header>
			<items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
			<handle key="[lo_yn]"/>
		</field>
		<field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>

		<field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
			<header v="Số lượng" e="Quantity"></header>
			<items style="Numeric"/>
		</field>
		<field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
			<header v="Giá nt" e="FC Price"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
			<header v="Tiền hàng nt" e="FC Amount"></header>
			<items style="Numeric"/>
		</field>

		<field name="tk_du" width="80" allowNulls="false" aliasName="a">
			<header v="Tk đối ứng" e="Ref. Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPPwuI5PmrO3AS3m06d57rRm+PfmIKlQhirQHBDRXQlhYDEwxSoRD0Lc4yLAA+vlYyk=</encrypted>]]></clientScript>
		</field>
		<field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>

		<field name="tk_dt" width="10" external="true" hidden="true" aliasName="case when m.loai_ct = '2' then rtrim(a.tk_du) else rtrim(b.tk_dt) end">
			<header v="" e=""></header>
		</field>
		<field name="tk_gghb" width="0" external="true" hidden="true" aliasName="case when m.loai_ct = '1' then rtrim(a.tk_du) else rtrim(b.tk_gghb) end">
			<header v="" e=""></header>
		</field>

		<field name="kieu_dt" type="Int32" width="0" external="true" hidden="true" aliasName="case when m.loai_ct = '2' then '1' else c.loai_tk end">
			<header v="" e=""></header>
		</field>
		<field name="kieu_gg" type="Int32" width="0" external="true" hidden="true" aliasName="case when m.loai_ct = '1' then '1' else d.loai_tk end">
			<header v="" e=""></header>
		</field>

		<field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
			<header v="Giá" e="Price"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
			<header v="Tiền hàng" e="Amount"></header>
			<items style="Numeric"/>
		</field>

		<field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
			<header v="Hóa đơn" e="Invoice"></header>
		</field>
		<field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
			<header v="Dòng" e="Line Number"></header>
			<items style="Numeric"></items>
		</field>

	<field name="ma_thue" width="80" allowNulls="false" aliasName="a">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMWANSp+4fESrNXmh3ZBDdfE6jWXZYbV6Fq2+jWE5kEBrfkyz8sxi2bweJpJM7gA2A=</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" readOnly="true" type="Decimal" inactivate ="true" dataFormatString="#0.00" width="80" aliasName="a">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
	
    <field name="tk_thue" width="80" allowNulls="false" aliasName="a">
      <header v="Tk thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMKX/jXyRzZdRui4xXGR0atDgtr7LdP2IayqEI8Ci5JjDyi+oIJ5TLIyprM6tYFdg0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
	
		<field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
			<header v="" e=""></header>
			<handle key="[nhieu_dvt = 1]" field="ma_vt"/>
		</field>

		<field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
			<header v="" e=""></header>
		</field>
		<field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
			<header v="" e=""></header>
		</field>
		<field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
			<header v="" e=""></header>
		</field>
		<field name="tk_vt" readOnly="true" hidden="true" aliasName="a">
			<header v="" e=""></header>
		</field>
		&XMLUserDefinedFields;
		<field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true" aliasName="a">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
			<header v="" e=""></header>
		</field>
    <field name="so_hd_goc" external="true" defaultValue="''" width="0" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="so_seri_goc" external="true" defaultValue="''" width="100" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hd_goc" type="DateTime" dataFormatString="@datetimeFormat" external="true" width="0" hidden="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
	</fields>

	<views>
		<view id="Grid">
			<field name="ma_vt"/>
			<field name="ten_vt%l"/>
			<field name="dvt"/>
			<field name="ten_dvt%l"/>
			<field name="he_so"/>

			<field name="ma_kho"/>
			<field name="ten_kho%l"/>
			<field name="ma_vi_tri"/>
			<field name="ten_vi_tri%l"/>
			<field name="ma_lo"/>
			<field name="ten_lo%l"/>
			<field name="so_luong"/>
			<field name="gia_nt2"/>
			<field name="tien_nt2"/>

	  
			<field name="ma_thue"/>
			<field name="thue_suat"/>
			<field name="ten_thue%l"/>
			<field name="thue_nt"/>
			
			<field name="gia2"/>
			<field name="tien2"/>
			<field name="thue"/>
	  
			<field name="hd_so"/>
			<field name="hd_ln"/>
			<field name="tk_du"/>
			<field name="ten_tk_du%l"/>
			<field name="tk_thue"/>
			<field name="ten_tk_thue%l"/>

			<field name="tk_dt"/>
			<field name="kieu_dt"/>
			<field name="tk_gghb"/>
			<field name="kieu_gg"/>
			&XMLUserDefinedViews;


			<field name="gia_ton"/>
			<field name="vi_tri_yn"/>
			<field name="lo_yn"/>
			<field name="tk_vt"/>

			<field name="stt_rec_hd"/>
			<field name="stt_rec0hd"/>
			<field name="stt_rec"/>
			<field name="stt_rec0"/>
			<field name="line_nbr"/>
			
			<field name="so_hd_goc"/>
			<field name="so_seri_goc"/>
			<field name="ngay_hd_goc"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>zYaQbZe8gxof52+8qpiwibDaHv8PhiXJ5OgmbBWainGzgbEKMwH2maUp3D3zGYLPbqNSuzu7/qEod4XLDiHGMcovtQxAgS5NKiaXZvEXlxKvTdUbYQIIPhIMrL+llOEJS8nXZNk1ujA0oRtIvUena14kWmOwAgqzUvX0o5c06XwoueepQhez2tgl2O5OIBDJ9FsCnxrsn2qvBi8PZcRKqFL0yHKQlz202S25OB2R2ISm0KrsRrEet5C3ArmzyDE50SZktx6Jp01wfXMmdBswECTjVT+UC4ANDhoLdfq4ocbeWLFTBHSvpwsNBPWXEca2ztsobsn2bpxtgpL00XGd/OHJm5ccaO/WDvNhdDQNblONEnQ6H0J5sEfFmzBvgeGsocSkVHAx65badnrE7hJABR+fKK4z0+Lqrjp8gKQDy1kT8j/bTp4Ad2rIinADNGl09Jq4KhacwO4F6pLrzY8qoc8b4+7AHVGFk2Yc+HpISTEzTVHEOMEmRkrezrP+MqgGnPyw95ZvXjmehejVQTiv33+/Uk0DWLY2Y0QAQrcWIMUdYxBvZRRXwwAMyvZk4UanecCNjUPg6smHdOcxwrN10F9rnUzwuCW8PT8mVT4ze0YNGnoIcpwrYdU9rnS11q8salSUj+UgpyFqjq8iw6SMZ0nsJWWa1jExLvj9l7Sj/SrF90roYxrd/7fUClHNSfiyNk3hkjoNmvqRdc36hfOgOIP+13+jfcv6IhOTTFQK+DaCV0RKJRSaMxdigBGFO6zs+3FUL7L2f3K4/TEO6tSB4Hw0A1IKlGQNCp9SANP4lBTHEyGszrjsVVSOYILt6ymBqTXyG5D4qFMRFVrP3xS7+C5MHHsHzXwSX77Sr9zkxTdEzH3NWU6Gp912FWp/ydoKHj4CVM3rjdZKmMaqZB0DVFxa0CKRJWBHN0eMAUsr9bawSLWpLTlxU/w3sU9BrKbZYysf6Y0iDZq3lpaji95dmQQc2JONQNbFczxzg4Gd/wwGKWCxccokbsky5VfBDOKV8McfTqLzDZyaX5HsEc96PiLz9ZOKYDGv6jN/NcQ3ddwqk+8vGv0fBoqDG3onaBereYkcgD7iE8UnJ1qHDKu694kisrTiLruxqXyyf2gnwzaDDvwvoaqrnCYiL9GozONXC2P3AHdIXG9s8dm+s3WZYpsdnzv7GTEmf7j6AoL1xNPLgP32n1cvCtYc6zTmEy/olpYNaxF251DVpuCMKwEBbvxoCACKPTqmimRGz/anjew=</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>i9SXKuegAux2PuqKjAaK6XUDtJy9s8z42BWgX08W+yVdCym26Bu8MPQxec8q8IQ6Guv7GSypByyYT1KtviOvYfNEYd4LPtjK5ogVzoa4ZvlV8BhClvn64gOGIXX7/8BtZyX7Enz3WyJ+G/F5FeZHiknHiF++XH8jLNWk7aoPK/ai4F3RZQLsmo6/zF2X3qK3WTBU8R2LdbJ+SVrnQFvFPQF7rb8HEHi/TXQCdqg+KUuIBrG7CdBjOeSHWRYnt+pknSGY08sCtXpPvPBbGDGyfBPAS1KYELymdUywmWl1cYMRH3faCg8gr/w4DDDVO7T6M4jBbFJT437/wYvbUZHjpeqsaHw6TXQHmS7x26JP68xgRYw2JYR1ICA2UiLPUHRFPIRIlwbqkx00d27IBSeMv1N4IZvnJW7pLV/E61NpipcB2zYjqXJEQqb7DaqCZEb03N60x/YBcCuFuk9hpSTH8rgeDTz+DbF+MaqHJzOuaVIk3Vz7P/nbbyqqO5f8UDzRRYGisJBX2eaOF9S8XFi4irVkY4+NVgwodhsv2q2ZAlHbny+ti2PYS6tCjwDFYYbuFusNmNEPOLHMZqDmuP1GcfDoDPHimbv3zd0/FP4E/D7FZwdZQrtFz3CNk4RU47P95xeUinUK72yER30RanQbnVdOAZwmJuE5HZNdDGon0qcWTnVw9cN/dJrto9DKzcQKdSCdF9SCyL4OdNQd81gIAH3TQVB27avlblgLhKgnu5kmq2IfuoyTe26d1y8a1lZvg2d5xw98SYzFYPvd/WnKnt8wVJuL8KvX5R1WsLV/unRR9j9m5qUn42HnY3IX9nfoWbxKXCLYJNlDkEGJtBBUsccaIyfcQRBw/f2teq05ijoQTcWqXteOwDkyxTcr8yMeqBdWyqhexHR6/dHviXaKwpqUybuaRMuvGfKq8gwaPI/K0OrZO8T70SbIb3d9y/cvvMdxdpjrWcA2KoaCO6yUwYmTnhMyJIKxgaDlIsE66l7MEy3rvUh+7JjgIfJbzD5ibPqqVEGJaCjqd/TuZAAkDwIT5R7WV2ji55s7mM1eSYOuDB+uJf6sv6E/lOsxXsGuMOJpzujSVbx4MsDwfN8FCRwNjK7zw4MdJzI12jNLw/ZIVc0OsMHvcYacB7wZHsDk8AHIZS7NRPh1sOJsXGdqLXs0SsCynTJBnkbKszcxO5EKn5ZX1yimXoTCbCvy3lmTIKhXp9cEuoXX1Sl3R2cyABVDmEyZ2BqCDRNz970VJTY4xgy/VVD9yTJc1ePuvJw8ij/zNhzlAM8g9ur0r4wlmRZuPS6W7+BL6ZRmTOvf0gEyA/137KabZ75gREQ+uayX9dz5xPZh98eLpdsjxjp/1gIsYnx16PvEIqonaqq7psA=</encrypted>]]>
			&ScriptInsertRetrieveItems;
			&ScriptEmptyExternalField;
		</text>
	</script>

	<response>
		&XMLGetUOMConversion;
		&XMLGetTaxRate;
		<action id="Item">
			<text>
				<![CDATA[<encrypted>LqRpYNBw1SBZyuysilr3KyT9Je9bPatRGb33dmzeKnMbh9ZdeM7X69x0DFCqv+dw+14vD0GTZxF2Q6msFOYW4xy9qxT7AlYg/4+VINzdF4d/GT4gFJTFvqcZZbGy39oUPmyqqaRgb+I3d2xgj0XTBUu5YJ2t6p9KjHgLw+dWE+/6WbXu90iWIFWuxis6XjKlKi+bor/RrcFk8GkjiXiFBYJqFlU/k/1eDh2dusfotFtkI1MbZg42Tw4ttUCQbGMrmYKkS6DSOvx5kJwcMFKotQ==</encrypted>]]>
			</text>
		</action>

		<action id="Site">
			<text>
				<![CDATA[<encrypted>dc08hik76x5Apk6GwKudrishBL+SjRFlc+QPc+D1bG7fiviwQTbL/9oKz90Qx6DsKSD0epArIrgOkBiy8QLNXpTr7m1D4nK1nlWT8052xndTvdV9KAztZo3CGzNJi9XyI8KEJJBRh/aYh0peT1UmNluMphUgNA6t+o5SgvQtuqdyXltPk/eAOV2jhhEtDd/X06J1mQTeMD2c0arSJjcthrl+mxg97bI325Jl7/u4/0NzahtyQJXHNA6dxkaKj+iAEYV2ncL4ZLK4tVIVC6ovBg==</encrypted>]]>
			</text>
		</action>

		<action id="RefAccount">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7QvdzOyCEfoUqp5nD6UAr7dpNOnAR8OGFVIRfNvFxIpEuHkwxKg60TJgA+MtChCHtn397Tj9EAImO1x5dseCHz1ycs1vq0sInnGsDzC+bYuZ</encrypted>]]>
			</text>
		</action>
	</response>

	<queries>
		<query event="Loading">
			<text>
				<![CDATA[<encrypted>qFc/dNAWjMQ5RxWUmSQqPMjpnTIjF5C8f8RZbrdMPCGtINoUvcMjdGEXiVJqdKfvN8Gyz5AJEOD7PyJQ3/AL5/bX0dfzrwdJd9wwTRTtbMycvZPwv+Wculx9Nq8V62L02wRYJJmQi8/vC+yaPcbp5VfoCQg5KlIyF0h1RvwaV5DpoUMBFzPg4pvB0kaNXhyZCCFHSrP506I7aB4/R1Dc54UtwR+AzPmpOhBH2XQQ+hjgxexxE+m2Urnq5XHOWjpw</encrypted>]]>
			</text>
		</query>
	</queries>

	<toolbar>
		<button command="Insert">
			<title v="Toolbar.Insert" e="Toolbar.Insert"></title>
		</button>
		<button command="Clone">
			<title v="Toolbar.Clone" e="Toolbar.Clone"></title>
		</button>
		<button command="Remove">
			<title v="Toolbar.Remove" e="Toolbar.Remove"></title>
		</button>
		<button command="Retrieve">
			<title v="Lấy số liệu từ hóa đơn" e="Extract Data from Invoice"></title>
		</button>
		<button command="Separate">
			<title v="-" e="-"/>
		</button>
		<button command="Freeze">
			<title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
		</button>
	</toolbar>
</grid>
