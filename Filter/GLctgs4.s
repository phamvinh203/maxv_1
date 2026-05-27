<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLCTGS4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110: [date_open].Label, [date_open]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>i9Lx7q3WPtbQc3AltLDQljU3IEFKzJj2xDbUsN+B3OgnMn4lnrPYas5TNr3WryuYKs3YAa6Z449J8eTynMzctdxiivZDec4pb0kxwk463AUc53KPmIqG9YXSR8o0axw+AtSD2bz0QiKUu3VXGnMu2yDoDSXOsnK7kEsoVMl45UKcJi0CIdKeMXoXzZsENf3CzONdYJrufNO1UMg5Yipvm42HfHzD4X16zDbdP3nkRXSdAbWuBwfiuB4Mar+MmT9zDwMCiWvbjd9OAfSI2X8YTA==</encrypted>]]>&Form;<![CDATA[<encrypted>VPPOLrCFs5ZE3HAGzhT9b2G8bhFtNL6WTyEOn49CuKsRNs/FNeKYAkT1hpbDI+s1jWLyndnO1iKAz80r2X42wxF2L3gSF8/6/DGx4Im9dKgbmFqImZko9zAkKHQulHdx6Wm7x2nL4mOHBSCh6UQ5+ufoICSoqswjmQUC86LlQLozecc1DsUsPLAi5hPwucGGWfPaeHDaIFfaJi8J/jgZSrZarYkl2Bi9mpOjZtXF6z3BP5gz87N4l6LSD6g6JfqB22i8Frfvbvw8Y/k6pfB3eoofTMZjFqGuHL/Dk5RmxPeNeQ0sIiOjwep8Ms5rPZbZJdvypwlFh/Y1wJmQEZrvwfBAOg2I2P8oNheKGm5guafWWg2BpGeWdAixjKScYCRR</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>ujt8mKStkM3HFpmryV3kYJtQ0AIompmdlYJbgssGmauQusRQHn1hnmxoTXdFUr+X4FBz+WiqQI2RIUV1FmW2fbJWHM+o6hkpyzIOuqTfuTVnaipHEGMxfkZsUITphhrfEpwpfYmrvbOUJIbtjYjABIKL8y6PuHZdlPY/aT/Yu3Zml0drUrAu0nUPI1g2Rx93iHJEbjJmQTDWx8xXs7JA+tPIhyBBMDcU83c0cQ8KsYGkI8Pz4SnQeXILpqRcX0NO4GK0JxGnB46SGXJ47qjLujqeztROpS1H9SK/6cArjJu/1BDFjevkKBCForUR1l9laNnQViTjDXOtOSPy8LqJwr2s6EdsYEI4chjOULL0uONrD1rP+YL2dfYrYiW1Cq9jkEoVz/IQHXwjWN/59KAY+Fjn5B1nnXo33E0tbD6CJE0b+0zV5Htb+9MxuVxPzHB74ADqFQpmokKb+GxE6vz+gG3h++FUk3tY6ehDP5Hi/tUFT0a7DWOirUqwYGub2UkQwoX60q10uTM+RMDOQfn0v7p+tNTni7js1LTxfXrIwQAJzEB3HmFp/J+c4GE5AtIiiI0fGrlAP+8KlAvlVKPPCDV/B5dKLJLeSSF31MNZpKoR/VTW5cubkeauYMM7ScSgnl9EsXkJBPOeQJDTNRs2ITVsXBCBMCUPtWN/FqH2jsiwfQdMkiU6J17ilDMEq/6KDbpAs91gR9Rg9IKIOnxPxRrrWFvV00pXC3MbP0OXK7uDvbuger3YmU4Qje/9vTOX3NkZ//nnJ5YvxqoHu7qeHwtnklckPAPBJbwS5S94o+ToMdFK2Tu6oYntcHJz8ajOhvLqw9y2guwhCUFIBd6sIJ166y3anaxKFqVPwqVUK4U=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>8HDYmxrt5lmM5WqJ2VZ/jMAExMycWEQ5IjD1g2hfMngspqKY1L+hEVxvlorELloJ6erhw1DakIDqgtVVhiihZkPQykKizKMYFVfmFTQZfXLWyh1LM0kw83km1qYLifimjlPaRpmpVOIzWNvncPJ2OMoSeoGt8f3InjWWZNYgkRk=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
