<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCCN1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultARCustomer">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = '1' or nv_yn = '1') and status = '1'" check="(kh_yn = '1' or nv_yn = '1')"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="isdetail" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Chi tiết mặt hàng" e="Detailed by Goods"/>
      <footer v="1 - Có chi tiết, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="isbalance" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có tính số dư, 0 - Không tính số dư" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 80, 110, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="111000: [isdetail].Label, [isdetail], [isdetail].Description"/>
      <item value="111000: [isbalance].Label, [isbalance], [isbalance].Description"/>

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
        <![CDATA[<encrypted>urUv0ge3MRlUESNGtHFYjFmbErp+CQ6T86uAMmYCw9c3zjxKxtlBEbR6fgus8gezrUqBdXgR/XUEphccXlf0FvF3OgNIcJKKy6eRlJ5LlpfMrs7+aFtp5aLDAhq5rZB0+c2T9ZfwiUlUEJXZvX7kVw6WCk98KO1YWE+v94XgiEvfmbCzUQN9LY70z0qBWaUVoALocouJ4mKSfaQb8N4OXTN5X6mi6dVn8AYhXbKVkUVz7FAPM/ls7HeboLPPgYjtNoqirJuAH6G4OPueGcowc9SO4vAmBFv4QANww8SPPAvEEU2QKRURH7MrAquIL8nxTRnJo3t5bNIjPR1jrRSmAQzp9WP5nhbIPhaM0nTyiUx91K8LilCtQ7w6HiTOqp2T</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>cRFFPVt8IZ9nXNpH3cOkMQgFGvIyL/TIn64/3YEqf0DPJttHfeczlpp4IuNZEL70XiClBG4EiGiMhXAH5aOTu06tRmE71aeVgxQpZpbRkdQF68UPmy9g9n9QxnAkZSkIrTKFy1ovhM2UAnK5JM7JJcCfLdd10fHFVB4SXL75oUhpdNGl97+Ta6/Zy75kZuUMXqxdgKyi6O1H1g6z9IWoQrYX9nnnQp9U9wNP0aeEmAiHSyszzLNZ3Zj7PomUBN0dp42MHAUdSalAqYzPoKw8/LUlQo2kRy6SCPjij/c4rCIXO8PTCFi60NlXek95ZgmZ2JUCKy9q7QxzDNKdgLrJCvy3XC5hJBJEy6uDKDt4DuI1yCC967Vs+h71gIKtrFjvxeOHv3mj89I435mttNlcCmMC0eDRaxTfRRGC/rtjqNTzUoaAKwpaiDfF8knsYtlpD4XHsapabYs1yhtZl69QI5/tqnfW5LeHoQC7FKejQ+XP6MovZPaj0T6r27bWiGHI6pe14enJtkBdXZI3jEtxie6lJ9i5N+7jzxzcJDRIB7Zox8CG0RYfybQ3lRv6sI2vOdAzhvpfdkLeuLw/BnefJP0uUT0WkdQe+RwdPA0TVwbFeJE4K7O6a7MAtZdml8reZDNWHolrijEAjJt+wp1/WKD3szjNqXRKzzfJoeJlhHn73YDZscZazh4xwYR50Fsn3vM9QvSWa8z5PfHShtP3Ucv4r90APPvuQ/FyUSGqfjSrdhpctVOWFJ+YYQMb1dJOxylD9jbfORj7rxJneN3jwHq0fra1xRRpw2BskV2XuiFItMgjJJGMwCTgz/a/6tntlv5Pwjpm50MOjnfyTOSrB8wK0n/pNJ8BjJtKeuersNvGPq0B9HiWMDNl/jxLMSj/Rqp4kZX91c8Jv1cswr+DlNMd++HnkQoHZbby48x6oIoQif3NnVYKGQmrGHnS0+ZeAg4UYrbq3DqEOJtW7mrhuzP79NooELQaDLq9+kHtKkXAMvTBqA34BHGkC2Pe4itylNTYTghkaivGDBpcCYhLw7z66FqMTXVlcLgzXIR8laE=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>m40pidbkB3skJxGmeCVZvQ+f3xFhWIqYVoBoGwbp1F9mYK+6nNs93Vn2ZzBDty9N8lpzFSiva7abr9oddrYo1hK44PnO7O5HmlLXCQr7HoxNTIXgCBDaaPlr5eJZ9HmZTRl3M+HXE2y9lWsiS2KQmj5tiefSdsq3EITaIQc2YRouxd7SazNfSl6dd6DRjUi53bAWwoU02R2tl+iIDFvFww==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;

</dir>
