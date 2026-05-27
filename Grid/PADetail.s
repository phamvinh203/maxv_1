<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
	<!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
	<!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
	<!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
	<!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
	<!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
	<!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
]>

<grid table="d83$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HM4" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="" e=""></title>
	<subTitle v="" e=""></subTitle>
	<partition table="m83$000000" prime="d83$000000" inquiry="i83$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
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
		<field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
			<header v="Giá nt" e="FC Price"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
			<header v="Tiền hàng nt" e="FC Amount"></header>
			<items style="Numeric"/>
		</field>

		<field name="tk_vt" width="80" allowNulls="false" aliasName="a">
			<header v="Tk vật tư" e="Inventory Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
			<handle key="[sua_tk_vt]"/>
		</field>
		<field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>

		<field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
			<header v="Giá" e="Price"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
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

		&XMLUserDefinedFields;

		<field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
			<header v="" e=""></header>
		</field>
		<field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
			<header v="" e=""></header>
		</field>
		<field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
			<header v="" e=""></header>
		</field>
		<field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
			<header v="" e=""></header>
			<handle key="[sua_tk_vt = 1]" field="ma_vt"/>
		</field>
		<field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
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
			<field name="gia_nt"/>
			<field name="tien_nt"/>
			<field name="tk_vt"/>
			<field name="ten_tk_vt%l"/>
			<field name="gia"/>
			<field name="tien"/>

			<field name="hd_so"/>
			<field name="hd_ln"/>

			&XMLUserDefinedFields;

			<field name="gia_ton"/>
			<field name="vi_tri_yn"/>
			<field name="lo_yn"/>
			<field name="stt_rec_hd"/>
			<field name="stt_rec0hd"/>
			<field name="stt_rec"/>
			<field name="stt_rec0"/>
			<field name="line_nbr"/>
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
			<![CDATA[<encrypted>zTfHo29x0ZY0qm/PttrFa1F6DwjBmVHa0eBXGsHSeS9C//VsOZY6W///t83Pd2y/TCPm/qWwHmkthsjCHrdJVL0U2tXXJDf9+Fpl43wmqzl6o+CJ/VIEnEgbF+iQzEni1fZbbLmDzDMKwbZ3KZ1qDvpH1sMLLpUs8deYYk2yHeYi6K4s7PJ7UqN2jr1CQL21vxgkxfXeC7xzrlM4AiZwIB/3jxpJO2dgeOXuQAWBLqxts1buQKz3CERWBY90JypI51/S3AIso4xDpMRLcdmE8r42ZkD3bVfJywWRK2oaN/IgFZR7ymmS2/jBx9TP5eu8mWW0Eq8QI29qUV+bVi2aPMq8MsuvLIg6Z4rgVEO2VBAlZC0JLds8qJFG1NpaPTGBG3yUDxgDdcPgbSbYKBUYMQ8u2ba2SOPNEnWe39164yoSJ/DvMexQlpj/1zZz7zeISeSfrlMLZC0chjTLdv0xNHQOfD7z2rTVkUbJ3CjBFSRI0U+RDGn5uBdec7gUES1NLyXEyBIPyCJ+umbze6D2gNyFnJXotEY+QaY4sgJzR5IF7GiMnQgG+S/Pm1AwwJ+abLrl7swSSF78LZ7platVT6Q3YJojbyMEd/22mMmvmA4mRV/A2WM+aDsL/3vIyiCpcXP0lhYcYs6e2h0dzUAQV8ANfdw0Wo5DEjjB9woODz3HzwizigBUAM5NthC0lgRngYLvqCxNkNX/IxezQIvwrOt412V9Ji71lO5RPgc2sqOgHFwEApJeRplbskg2ljp6MwAhXsrYRV469rjS1RwAyPNaP7K6HDm911mbnFv5C1xqKXW8ejMDtHWMNCTlyqtKxjZ4PLZo5v2bTsUG1bpOse8JLnW/DOds1j1wV3BPkvSMQtFivOMNq4NATUbvWAwswzuefuKOcmt4FReZeDJe6KqZfHnzOPbzqBp/nENY20Y=</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>w6++7Ewh43GtS8tEd/HJcN8z7M8JFYiLgdcAdgh7P/iUfmgNClg/uzOPfz97kWS5+HUS5jgADyLlRzK9LI+iQtoSeCKp9/fw034qh8f/RS9gS1sNwYOn2oQXDiq85I0pGXFXXmbOikgL9zyRWq4s4l+lfA9lcGsImFW9YkdzAw2yFc9TmYPvW3ySy98dGcJzYQw0sX9mbRruv+XkA6lgKHoMTRaSl2XbDfX8rKzzh67rCYLq3xJ2DGnlvGPTLUvtcr8uECOtNo5MJ/ULUyX+Uruq7YlSQEdG6DOqveUPum1HYfHYDjRKBl3MplFOUD12FEPx0am9/7FZ+djcO0Aciw02U2isLx39VoIn9Dz/YKRpdDtt31kHxHeUHXeFaLzOraLXPTay1/X9DNA/RDV7HQx8d1EQA6lprJJiyXHZQj9MK4ytP7tyKmhfRUDa/q5cZmEK7jc2PDqnl3aYuYRXiapqtQlWpTxlsYyEBBSEMBYAdiDQdvwMtqax/JQtIqzxnHw9xXYz9pLOha1pnzRLjFirBiqPt25cmnH5cFt4gAe7Zm4MOP48C1MS9BjB1a7CTW+8CZumZ9GRIOqb7cWdC2pqwLHTzXmwu7d5pqlS2iJ2ysmaJLnMIIDmJfNijYwCz4DlhkS23C9FpTRQcza97HYiMM6+WPA/9+KFhSuw5+N8HB2/oTuzI+R+yrbMdQXQJanO5Tvf/ocg13+lzlh600sljX+l1upgtnFAMN4r4/4f8kPTnkIiDy5YpJKWWPNwRHPJjb+tC0oe6/oLXQu3mTXybZyLXss3ri/pmxEA0F2Wgj8jyRBs2uS7SdzmwXIssjh0jAt9x/eoWlgQq7Q8OQL7rYVqXTng8ZwN4xYBKaO4/PntRyEkpD2fGGTj+3sXKK3F3DJcVEzyGzxnprQ59vVdsAKpQd7fo2hKYXK514s=</encrypted>]]>
			&ScriptInsertRetrieveItems;
			&ScriptEmptyExternalField;
		</text>
	</script>

	<response>
		&XMLGetUOMConversion;

		<action id="Item">
			<text>
				<![CDATA[<encrypted>r4gUa9sEPwJGDZZOLL/HmuT4ablGdersBYQyDQm+oECCKGngk4t+L/nUETWFjEBCVOomEwCENJ1oYjRJ0Jieb/RNsOr1iBho+ilYQ9S06r9+VjXl1P6IpTzTIEhO1pzd0T/fy5Gt4NPPTjVCGUCRxHm2pYsYoMzyeVdq9/tFdugREqYr6WWDcCzb5oaP2N7vXNvlDkVmamD+khVdm2iUAuU+FeVBK1Ad9TrKBJNOpFgbv1e+dXa2u0RwgknNBLD+</encrypted>]]>
			</text>
		</action>

		<action id="Site">
			<text>
				<![CDATA[<encrypted>dc08hik76x5Apk6GwKudrishBL+SjRFlc+QPc+D1bG7fiviwQTbL/9oKz90Qx6DsKSD0epArIrgOkBiy8QLNXpTr7m1D4nK1nlWT8052xndTvdV9KAztZo3CGzNJi9XyI8KEJJBRh/aYh0peT1UmNluMphUgNA6t+o5SgvQtuqdyXltPk/eAOV2jhhEtDd/X06J1mQTeMD2c0arSJjcthrl+mxg97bI325Jl7/u4/0NzahtyQJXHNA6dxkaKj+iAEYV2ncL4ZLK4tVIVC6ovBg==</encrypted>]]>
			</text>
		</action>
	</response>

	<queries>
		<query event="Loading">
			<text>
				<![CDATA[<encrypted>PIMwMHcDQTnS1pN0VxlCw1DMTFI30cte4yHGuipTUfzN6EH5hjcv5GMi6hUk0KtvRAZUnOzyMoUSJeOn2NvsN65MJpqez8OgZHvMtXDMsEBAl+81XHxMflCcdzGa/IEHzxF3dLxByfGScUDRhR9jWgdoXVqNngutcewuqmcN388szv9mhW8VBOwg6cy7d5L7</encrypted>]]>
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
