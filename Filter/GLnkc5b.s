<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC5B">
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
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc">
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
      <item value="120, 100, 100, 100, 130"/>
      <item value="111--: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11---: [ngay3].Label, [ngay3]"/>
      <item value="1100-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>f6Ps3zxUWv8SYXMWnYq072tTzvu+R2QUaNwF99Q7KLC6pEwVg1S3+jo8usxcmYxZX0YkwMsToUP+HnXBi6+1VZoFWnoEUt8fbsitHP0kpLrIZFre95snIsyg2SrnmCmUGoPSUNOJudqbhqRa42YQvwNiUJpDjksNnvWMqrkOk5hZcPzTpXQN7uFjsia2CCfRFa4VSjQQ1RpY8t2jloMgzmqQimrONkZnCSdjv0Faur2bZvRuh9oBHpy596xpxk7xuJUJbbxjBMycpzJFVnHYeIiJqMm0/t6eopFX8fR2lWxtNZqHuVVpiu3CBrmFtzrVoxwU2YERMfe1lGTSa3GGr6oyDA9MfesmEt4m7fDc9viYie77CQitl2thERycVt4CQjp3VZRiYvmdcIesfzZxM0XCgeQSEBGWqOo9JdFjzS0Sl/4c8XQqd65F/dz2+qVAAswDAjtw6ftMWbm7F8NZj92LJ0DN8Ee5MjYKZipTTuc=</encrypted>]]>&Form;<![CDATA[<encrypted>Hn3N4JgIO1COGDLmPl5OuY3ZPauywuZ1F0clQf47DhKwn7v7/+qVCJ9a4p9DCcFa5pvD9VKMWCyGD5GWQqbDXFxUTTYgeoNFbM2DI7YoRVkjdf2Ws2pMyqfiHvjEZfD6nKrrULq+sVFpGK8fbWyTNabbfyjYZC0EABEk200toR2V/mAAS1wxsf8qhefWut4/S0paOU9yJEy06RaqeA3aBWNxgjeULS7wZ973mer+Mk6dw3RbEWGTQjPvcw62fHETchc7LZqdhpEbnVteXsvq0UaKegfmXsrEuTKg+lXgOdPID7eiHqthWX0qF7vxzlj71LTbJjBjrVn9HzQSVmYjacUuLR6YXxKmpgZz50OlDVHcV9bw3XekOOw5JbwG+vMUBgOxPVOiG7u20pgSQ9N3A6GVOGUND7Kjr/yUv9yJ10U=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ssj4jqa7cUMG59gdMjMbyEShfihb+Se5tbMdUFtv9SoIeCr9E7psoNEyiZpF2o/I0fLEdGB9kEKazUwn2OJ2m6JTyF2ncxAYv5uJu0cOzycpMQJfLdAHeY4mmwMamVLkiusL3J4vG4I3GDC6EkJUIMjsrAgJtyWaQEd7aGC19wYsZYHxflMOHXFpY1GPZBcfNLp8eI/YPhaYHLvdx9b9t5LWSIuCxR2FwMWb+iAx2fhqY8QKScHhQIfuWgZuNUUFDrAB/F9sq1hhN4cqJsm2eUWCBQYDCCZhPBIh93yw3XgW7pGe7zQKDfCzk0koljRvTYfpVzESxnKjDFk9yPvAZrjwc8dKwsfdHWC6ZCTpADOSoz/3iPFrm+yvACUK6CS6UpU4Ad5Xji7BMqNZuTc/TrpreJ+EZILCPipdZeNZaa/b+ccyPxifWefbQcUFiHcFPAqyFcKcVtDyLX/so9liczSU7PKjcQqA1qLcbV0kcpmnGoUCaGN++Fk4+yTXWsn/gRxic2J6aPBibrL3/vgBMsgetHtJNnV/woW57HwdqgoYCan66PsO+eFICoiAzd3WdHo55W1gGkpAGWu6YRkr6SOwczIGA2jeV6MgE4WDwd8QC8JRtmki8HDwTouhH5WFWiu+DPf+2sGoSbY/VeSRFcmD2BYUPvdtdOzmwVQL5zPyz6DRTQHUY/Fl1Ju1E9IvDWR1xaGfQUmFS0dzD7G86cjLpuaSOdtvaZioIDubWDA=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
