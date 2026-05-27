<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY VoucherCode "PK1">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
	<fields>
		<field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
			<header v="Chứng từ từ ngày" e="Date From"></header>
			<footer v="Chứng từ từ/đến ngày" e="Date from/to"></footer>
		</field>
		<field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
			<header v="Chứng từ đến ngày" e="Date to"></header>
		</field>
		<field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
			<header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
			<items style="Mask"></items>
		</field>
		<field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
			<header v="" e=""></header>
			<items style="Mask"></items>
		</field>

		<field name="ma_nt" filterSource="master" operation="10">
			<header v="Mã ngoại tệ" e="Currency"></header>
			<items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
		</field>
		<field name="ten_nt%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>
		<field name="tk" categoryIndex="1" filterSource="detail" operation="10">
			<header v="Tài khoản" e="Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
		</field>
		<field name="ten_tk%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>
		<field name="ma_kh" categoryIndex="1" filterSource="detail" operation="20">
			<header v="Mã khách" e="Customer"></header>
			<items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
		</field>
		<field name="ten_kh%l" readOnly="true" external="true">
			<header v="Tên khách" e="Customer Description"></header>
		</field>

		<field name="ma_dvcs" categoryIndex="-1">
			<header v="Đơn vị" e="Unit"></header>
			<items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
		</field>
		<field name="ten_dvcs%l" readOnly="true" external="true">
			<header v="" e=""></header>
		</field>

		<field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
			<header v="Người sử dụng" e="User"></header>
			<footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
			<items style="Mask"/>
		</field>
		<field name="status" dataFormatString="*, 0, 1, 2" clientDefault="*" align="right" inactivate="true" categoryIndex="-1">
			<header v="Trạng thái" e="Status"></header>
			<footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
			<items style="Mask"/>
		</field>

		<field name="keys" hidden="true" readOnly="true">
			<header v="" e=""></header>
		</field>
		<field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Dir" height="63">
			<item value="130, 36, 70, 100, 230"/>
			<item value="11011: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2],[maxLength]"/>
			<item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [keys]"/>
			<item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

			<item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
			<item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

			<item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
			<item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>
			<item value="11100: [status].Label, [status], [status].Description"/>

			<categories>
				<category index="1" columns="130, 36, 70, 100, 230">
					<header v="Chi tiết" e="Detail"/>
				</category>
			</categories>
		</view>
	</views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>9I5nTGXHWaOnDG8aPMK/XqM6/jTPdIZvPvS0fNZXVmRtGJKVDsFWOx5e4lQmaK4b55sB3q85SXeHqddWM+DB9IWnQwppZG9SvUVEtwYkwcrcMJ5kwBRlvkedHpHKY7qWsMj7e0h9BZcTVkuFbiXmAPVeZHj4mub7V0RZ6kGuASYTVXI9xXAMt79A/4ivPAp+</encrypted>]]>&VoucherCode;<![CDATA[<encrypted>yLk2LQV8kn+zCuTnQWaA2+HdLNAT2sMgBIL1WQMVXSN2B2XHbD+oFoHYp/rwoEdP</encrypted>]]>
      </text>
    </command>
		
	&XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>2/TwDEKOb+B0OgIPjm37pFzK2F74YE+JPuonYl1dclqLAvZjeiN3Op9yieXVG73+8zf7jh9oHl1B/y95bbBg1gSeQnauKthIjzwCK5IANshboHVmdc322hcYebcsxIpnMB7u32hV6Nm7mA3I9kMQGyzD0tGoZVkComaH1vu5je2rPKDI6nu81meLxwObOqGx</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>rvDITO0485NX+OWy7ss0Z1RCues6pfZLSKHlZs2oos/CJ8KBpxJlHE1tge5ZfjbO78QUswqytMBZxrvJEbyeV/3w+sYeVViQopDhmNmucevXzztyQlRGuGyCc3aoHKZg6Z1vholVfVBB14P7aBr0MGhhNwTJMx/KQuIlM9GpZl9dC9orCmn6dg9lPQwNe3wT40riiUbkAo7AQJQnMsvFZcXnzP0RiDVTPwa2gW8irtMQ54gYxNF0n1wXk4oodLmPKadzgPsdK2FFyWnbU/C+EWQYKqmWr1OgKOMqfEGwrFW7MfnZ1xCjinundljhtkb92rMM5pmGIzLHQM9i+32IISJRM2wDdCGcbT20kLBUMmf5D7adbu6eWn5I3R5mkjbz3rCB5A8a/ivq/CQcRP7EpfOrRiMffGJhv7Y7gPh9ji6hN5gAsvsisAbW4lhzQ8wjBu+B3nrLp1tf3WjC+2mxMZhDUd+6/ybC2ehvB2mGxdxgRfITeQcfC8bdYf6sfjO5L77TAMiFZm/T5mNfdRZU7c9hVlJ1MQyS2eFpMxz1xpIU7hKRHS8+3v83J4Q/yKMhe/AL2CurOBfBOyrqjoqbFV/8vvJqaCOXzA0PhxAd73OVM25ZSoHEFZytt3RjCfb9Pqp+E0ocNKlcsa3bdIHvaUTP50x8EhplBIe43uIlHSg=</encrypted>]]>
    </text>
  </script>
</dir>
