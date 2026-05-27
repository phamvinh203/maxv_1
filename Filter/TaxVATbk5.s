<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "TAXVATBK5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" normal="true" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
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
    <field name="ma_nt" width="0" hidden="true" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101-1: [tu_ngay].Description, [tu_ngay], [den_ngay], [ma_nt]"/>
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
        <![CDATA[<encrypted>A2vseZFsoQz+SKIPEQPOa68wA/uY64ExWaub41qw8H+ZJyYOlgKvWeDrx4c8Qjj//7fFe9UmRjUp2MeYHJ7vDZlc+t6BbIye+BH7Hnm+eEibyNQdPCIEoSfMYaqjjhYBzBeMFMJkZSUMv8xdx3ZzsNFEpAQmAwLvWtsebJGvsMfsgz+LdsAPlpzoHRqj07TOSqxzo8iMW6C4bX3gfRH4yMmjNiyjUXZNS7ltwCL/FA21joN25nLjFosKNtDP7eQl</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>rHRSwslZMic5Lbl3gFjEhcdXKiHHTMmKWlrYB84DVjMy7U65w5AUDufE7Z+lNvf/HAADSfqn3qjSqo81mLsEcjviVeBcrfJR4bCSbAdHbbHAMR9n8wTgFXNjMBI++aUh04kIbATDBBm7KCn/FAqpFKtidpV86rHWjSISkKlW140B15vbc2wmrh+rJXBqn+65fIS6VH7RLvhkwuoTbjAPTU13wmyC9lusBtybQpjtIedTvXPcNNpx7og+e0RFMZNQ5VYkd0RL8Hdi1v1CKJPYZTQvxDFSAC4Z1L9PUtdtxyQUz2G2FoNPfNnipQYVqoCjEocREjb7l+Z6g04FVb3NgdtqNVDOriwCoNcwSqz8EbS0l2kYWRMij6tRviKkH54TlK8XYIYHVkCVGLipXU6ESu4mjYZ7YwJZx1OnNbs/Up6a5RjxRz3JuyTASFsEELuKv0WSwncBI8HlGiU7HGdT4LTyTbXboMuQpNBRjC1mtJqP37dvygSac1LlBTMyjk0+O1AueEtxqfvvesvULshvx28UG5Dl2I8DqW6iTYGZLOu/cnHwN8S+03ZIP1cJF+eSB2+OX4oGMuMbSWU9Q7hSDKylTf8BREGQoMOq0+j5eGsAba6/NbxdDyNvCFHwXlSFFRNvvCgj2/gK0AOM1No6diO013QfJVB3AGy7tg3WCFC2OI1ngT7axo6AtDFLGmg1fgFwkmRYvOMd9ikLQkzzTfVC7W4c7YRkXhl2ZndXH1awKLuE/PSRCJvbViykhAbY8JqffcGPV4KaxT6wExVYPKywKkY4Uw0AnP/XEhftqSx7Xh0a3xwEam5ocj9XotjR6DOfKYi3DYoWO0jXr/DgxbYJDaIbRCimdjQR4i/G1qUD5qiYnrkEAQcp2cXrekwJepb50QzNJehgdCNL4DOOAQ==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>AptZp4OZykEUH/yZocrbJ2PBfOw80bFHt34gdfTW6qKJFGd2Wo+uthg8JhyC0yDRXWzKi4LccuEP9hZURN/YfJawgK8W1wJABUUCQSqJvtVwnBabZls2seRysEuAAmkYylaKRXikqCqXmwZiHsEisU4s+SaH2j1ZUFDrrfawEsbcabn6uVP8QCFQ8ZvzCxxp</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
