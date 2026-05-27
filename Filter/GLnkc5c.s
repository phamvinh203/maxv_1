<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC5C">
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
        <![CDATA[<encrypted>+JH/XcEMmF0D9jCMxv+5u+fsqseuRRxEK5FqAHmPBkkcaRVwFZ8ZlwdOcdj9cp9AhL0lgGvmZcpHrm6F9Uo2f3FnPFE0GX2aNv2dnp7i1yH++O/MnHcrJL9gOFGOiDKDvExu/sciXsC+XnzTEimkf4Yrpmq7UEZHLMuUe/2jWvM/oegbttA/nbErZifJId+zOA5tmKYg+4isWaP0EfDaXWJjU6xX1dzmQCW77hJZxDC2ufhPHAsn2VfIU7RyDvgkq2WMgzC7gox2EKnt8kvy95hgwMn6+WqW1x26ytbRgKmdTjPPM/Q3sSvLCmm7r2lrBIDQhNshu/6ETM7/81y65KuC4m716nZ9O2xzTIUgTlVsYoLoWWdklDohUR8q5Oivnzcj4pMQfo0A9JOcnGL8BIOFHHoUvAAIKX2Z3Ny6nUG3zxq9/zJDWD8xHHBoW79O</encrypted>]]>&Form;<![CDATA[<encrypted>GL1ZvLGayGXDzICSaNPyu96sob+2iW+9SuTupKltpXTlK1jFPRZCMMWsfIR3qIZqlCCVc32k4bMMI9qFURuIlrjdAmNriBsHc2XjaJqIkj/nGqYjADFvRIjBjhgUuXOat8oG5wxmAEc0D5BTA+NpZbkOIG2K+oGP0UhpEJY3rSVZL5YihNaiSn2K0DLf1t17vQ2vb4XV89Bh/POlJgvHG62jVOK9U4iTgQ0w9SCLfNkxWar0swRmLNH8Eu2nJtGfkGBqKuu7Y7oxjA+HkVhB06I+k6GvZzMfyvT0BzJWTDwEWVB/4PgAUVZjhXIuyH1F18IOJk1luccOySGjq4z+kfTQ2+p5kQszeMh+BVIVDIFlGQ74LTA8J4tDaREjZhlWr3Hv49YBstWfCcztmw+ydg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ssj4jqa7cUMG59gdMjMbyNYbgwAT3iRQYmbGcEVZu7cw2eeXGg/BDCjIwKoGtVREH5X+T7WPbJ8aGOdAvROr4RkRa2Ore2sCJUh+kNWk6lHTYq4g5RDC9gKwz8FgEHsKo4KyMUea+TA9YMyRGpNfY8/NGKNk6pPjjlPwjkaBiuhXMwnpyYKvQNbA3tv5DZDLT4sYpWMcMWqzEaP1A3F7jAdeMpE7BpgD5ZXxyE/76a3WWySNeomde7BDVBJHPtg4rhKNymZ9QgQJ7WY5n7t3a/TMdmxf4Nnlj51hkySaH55hWhMGolakR+9D2ZPD05xHMsHu7/jjuBOfdtMDSWFCrjErYot+4FduiJtAgDw0eGGbqmXWWK7aVplHvZZtsRorJ3Fmatxko54kCzA4xJDkTm7FJtDPgelFBHvXKCvDP8skI6oQ0tuK1PElEadyNwKFGGfxE0778OwutVze36gaE7yRa/kZeKQvlDys3kzis2F5l2VVWxcsV83tXRAgbNJtGovCRH0QyJarIjQdkLe3snBXfEow/RsD7BrBDAdygTzs8z1U+IDuRolon8szICPYdGRVc7MBx9Bh+CQ004dctL7+L4sTsZlrLUB3rJq/SEwUgQ4dp8aO0czrCuMqyuHOXXKCgmSqhdbHaDdnHw008YL++QomLwM3P7aS373Jq4VrS5/bxj3GChxsi0CEpcWFZVvnbIZoFrwrRgQBASlYrg==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
