<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLBKPHI1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_phi">
      <header v="Mã phí" e="Fee"/>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_phi%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="tk">
      <header v="Danh sách tài khoản" e="Account List"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="1, 2, *" clientDefault="*" align="right">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có, * - Tất cả" e="1 - Debit, 2 - Credit, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_du">
      <header v="Danh sách tk đối ứng" e="Ref. Account List"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete"  controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vv">
      <header v="Dự án" e="Job"/>
      <items style="AutoComplete"  controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_bp">
      <header v="Phòng ban" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_hd">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_ct">
      <header v="Mã chứng từ" e="Voucher Code"/>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_nt">
      <header v="Ngoại tệ" e="Foreign Currency"/>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="dien_giai_c">
      <header	v="Diễn giải chứa" e="Description"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 36, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="11000-: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [dien_giai_c].Label, [dien_giai_c]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>2m0kA77bWFt4wqHkFQrQFiTeTY+DiORBbc0yArO6d/ItuwRUIl2iwKR5vED5frl1PkpLMIZKwhcdFj/ZiQKGFo3tdeZL9axGxVfRbUqChsYHXRIB1smuzV/nk8oj1MM4rKoKPfK1zWdw5gIrtZR+GO4q3fp3tRFy0hQMNLdtWEwQu7hNWiEL8A3S177yhLmIvoeQhLXLiEpI9OaCZ7+556Iy77iIPUpfkNkWHKvJuMcRpRkEI27FHzlYBFaqQID7KkXUUHp1kuExV+zqYSe3Vg==</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>

    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ZMUvnq5KdfWBPMn1xTnZRexrAgrm3HikMUbYrlqav6NE/GkuYTYurg/b23zyeYCLLCM/VSHHBylM2HtH6vVSVYRM61OSrn21p2au4xlIA6+LoTOx6lt+oiVqEF4+iPneHwgnIKrTTcYmb5HOo8YOoWlvYiIRbbdFm9T8FJuBzLmz13jxo+p3fgoMZJigUSI1sHUFUEfWsKT56fr4v32Og9hH6yOA3m+bFhDUWX2WDc3w3aWY6uZiSnW+chAa9WhL/5ejUjNhZlTjcSifvjZT/PtyrWPgCEfAgjKIMQMYK7/Q5J3VePBAc++ejuoln6efeVd9Eit/gtWL3L997pd141TwEwtbEI62IgdgNmWfPV5VSSrfY+5Em+7E0kyKlb4lTsH+FCKVZ5HSpgvFyJoIX9vy6f8etB1qFRaNPk0Jz9BBeVIF9MV8RUlvIZa8i8oLdoL7SrQNiu3qgiiJu/pRzJ7Knw3/wnyuUmGpyeNIZvz7twy6z48CYehiw/8BrZUPkQEfSv/A4WeDAJ61zy7VtIejjyIzveknSnjjfp4K3FwIL9NDg3RWicswcyWSaqJ9UKUko/8DAIqCGS2TSa/4+qZ8lLQILCZMV5ggPdyT1CGQQKUXlqU2jDeWKSau7aDk2Qp4G2agO24QOJqElcANNGFEEB7Tr5RKtgFQ8LSNyvX4w/BQUxrE1p65Y3QBLsIMzCmNbiRWtT5QqTvrSIjZu9WYDMV2vePsurvK4AWvtTY=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
