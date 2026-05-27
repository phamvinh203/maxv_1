<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" allowNulls="false">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" aliasName="defaultGLCustomer">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="vu_viec_con" type="Boolean" clientDefault="1">
      <header v="Bao gồm vụ việc con" e="Including Sub-job"></header>
      <items style="CheckBox">
      </items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc">
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
      <item value="125, 20, 85, 105, 100, 100"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11: [vu_viec_con].Label, [vu_viec_con]"/>
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
        <![CDATA[<encrypted>AdAgRRagKwuv8cz1H1ymKvRykgsw1MQUEpxrz2yXywhDIr5I3kKPChPJV4Jww4tnhXWt6FKtahdjsRIDcAVj6tm5JgANjC5TuurPWjzLFxhHlnHtmkNqTu6qeOW3RxxECF+JI4Eb/7je5L1tDhil3V8If28amSMb5iEjksOi3v0YG1yrHbYzhwIE84ZbOxXlFZe0DyAYa+1XjzIY9iceweCQ7eaEtbwtsZpNhLR8TOZSTk6Lbazbg0hwcc4xFPXGzOdl6xGOaELn4P3e3vhOZWaoeYTD8gIX7Clrpw+jrin9cDfvPdKZdU5m6Sq+ymtGCTlavtzlVTSI5av+BehqlS1gZubPlJfp2QMLo0woow2IFhcS+S7pmPJ+ZWwgTaPh</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ZM0Yhb1gBE0SIPvcuakKaxuj7+VwkmCzsujaFdwNpBLcjwnH3gaPr83XOUR2s3AjW3xU2FJzBy22b6jlzu/zmFL1X61v6B7htBC6cQjZ5aqyynH+HqiOLhJwmydlWb4vOepm4uul+8Nha2gvsIyLsrxS5BOc+q/qYmNHkXYAFVGzyxvQwWP6nIdpokX3rufvOPwju3DbU9GDDwc5SM7aG5BYPZiDbbwK5qwoNpt2XnqdT9WJ1sFn9QJQL9FV2Nu2tDVGO2I4Fk9ywpUvrgrN4tP+lncNPgdhHQsN/uSecNwVhb5ZIAHgAhFjbAAq4KCVrrbmznZVCHtp5/k8jNsc0VwDjZYMKTXVUnx/qrWAVkS4iSAPhcYEa/dtl/Fd7NajD6Wx+XIuybSB7KhMPTw2O+FAlKmXQy/Eces0aavKi624TSmG9o2uccOiho0oahCshjPxPnPiaplRsnatlaaNaamkDluQIY/RcciHYTzezp2IWuG4ZfYvp1AHchooCY0mDyvzhdUquJYYwZv2yJcuVec2y/l5wqHZVFkoSe0UsC5s84Y4SQCI6HufBd+rO+OozxqYVmDeduXYlOC/4alsFvYSQw8AyfFoZXpMkSDWK0U9f1SNXkNTJbIJgr01a9L7GMnqAXKmg1WwCOKcBotWEtALFdMND9iRnnvxwqr9YUre8bLVxTTzCvX+XdaorMqJwjuAtsbuuHT796eM3yz84I6eDVr+VSdLCBnb+BZdbbet4dXoBMXU0I3D08/nCCLuKQpmQm9JwAqDJP17lFQlSbH/+mkvrqsc6qNg8RZZXsho+NqAfPhzZtSfOhFnkZ/pZjyCJx5da/J6QWxx+tj2usx1c6IgwOvJrFna6y9VZoQjhwTZq+dMPLjPaxFJ7TVdD6JQUGk0XLIrr5A1G4wTfNT61h/G3IGaQ3Ii75tkYFQ=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>IKtMmDPZWEkbea6IPMdVt57fzSewENLeSG8nHVafMXLi59/NFQ0FGZvtKLy7RyWd+NYvGYAuM/flpORBj/qFV/oLrufy2z33rEiV2+GQqKADp9RUmZtFFaSJdref09Wf25xnpgcEBPYYanYdKKfzXGcMn61d9/ZRBTDZu+aXXvxhUePTTGNmIp8Vu9r+jFFCAZ2bRb8XJsJBzrrGPXmCOQ==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
