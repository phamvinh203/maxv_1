<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC1">

  
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="in_ct" type="Boolean" clientDefault="1" inactivate="true">
      <header v="In chứng từ thuộc nhật ký đặc biệt" e="Include Special Books Voucher"></header>
      <items style="CheckBox">
      </items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="1101--: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="110---: [ngay3].Label, [ngay3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="-11000: [in_ct], [in_ct].Label"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>mr+CdJRjfaEWGsLt8O4tmbL7gmbOjk0BTAWT4IF9lErp8IczCuSt5Abu7BScmHB4SMbB6cyoiCMVtMqTCK8nZiJxh7FnnMTmJej11GsPPHUeJMy7fkRswOLV2VpT+v5dyJIpuO+DK3r+AI4QaC+wSp7g0XU5dJjt2Tj4KbGMxaXT0koMKy329e67WpLk/Fq9k1hPRAWXPusFTZuYVPvSt4JAOa+X92rUD/TS4enljEVkmUYtfnw5wlsaKzScbMBP</encrypted>]]>&Form;<![CDATA[<encrypted>Hg/fcwkXhdhWVmlJtWvzbS+pyRV6iaEjgEcM8ahEat0qSFB6C/TLiQAYCP6GuWOEOfaBWUoUFcCCmwlR9VmE7H5u5nzA7qS5LwEGN4usDER1GYfS06s2e/QrNRzDPMWC8jCLqkdUzV//hWk25JwDscNXJISeO7qYiUxQtX9Kx074/dm7/cjEKRmVvDhQOxc+bh6sLEdSoMauqpBQ3ITe3EdSdkK1O67ydNpyWbQ5pcIuBGxqDjOeAQzTy5doF+jXXYK/IfrbQcJB38/Lvx94ItiEJIkKm5aIVISi+KsnwF3ON/pNNHKoLq/h0Ks0k+P7vjgElaSwuz9r1el0z3Tgrw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>3reBuh7uI+71mciU7OOo/85R4uKOrtvPySk+5esyAvChfGZjuSCIK8Ozrql9pVutCHqi5LH9zxbfWPs3J4ipNqKRufZZE4oBb7g6UHgnpHWvZZCBh32GW7L8/wKCIG3OAEdwmdv5cLZJnbml2Wi/oUsAouTxmVYPStiurOP0cK6ce5e3q2kcKSF25hvlRm9kBcCGvx0u+3PvMhy/WeQR2Q0FFRI9bWAmbZ6B1AJJywysoJOQyIqtXHY5LYYETqyU7kbIF+GxbTBiA7rAIjyktbRfhDWTnw9CdxI+WETwi5/nN7T+Wion4AeIi4zLashVMAJUmbJUNCQqzdKTFxtoxodQVfCx+J2bgwSvvo5/4tTW4pvGLCHyu+GVBocn7O8nBg52NVIJSX6voaxvVFNsPAeKqQ9c3OEFQQGnxfJwoiRDUO2kiXbc7PHhzhLfY4+OYQTlZRAb/Xy8m1Xr6OPV/rQuAJE3frnxAjREjOGzPSnE/8KFsUV9+5ok0WRstZ6spTKW79XToPZ3hrId4MtAwzS5pbLrknMXsBlnbP3QSgDOMtWPU3mOM9oDTsEC5scyV4u03HeA72WVzcMXh7T+/xvYQqj22UcD25mZPQxoxa4ICbthIriZ0NOvdrEhrOfJ34hx0vvj/HeBYAkiC93fDQFLJbedrRm8YSk+GsuecQCXLaXUla4NjniVW1XEUcA0EsGU5L69JK6//yrHvL4hqg==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
