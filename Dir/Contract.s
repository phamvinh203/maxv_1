<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmhd" code="ma_hd" order="ma_hd" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hợp đồng" e="Contract"></title>
  <fields>
    <field name="ma_hd" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" >
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_hd" allowNulls="false" >
      <header v="Tên hợp đồng" e="Description"></header>
    </field>
    <field name="ten_hd2" >
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" >
      <header v="Ngày ký" e=" Date Signed"></header>
    </field>
    <field name="so_hd" dataFormatString="@upperCaseFormat">
      <header v="Số hợp đồng" e="Contract Number"></header>
	  <items style="Mask"/>
    </field>
    <field name="hd_sd_pslk" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="false" >
      <header v="Theo dõi số dư" e="Balance Tracking"></header>
      <footer v="1 - Có, 0 - Không " e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_nt" allowNulls="false" clientDefault="Default">
      <header v="Loại tiền" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" hidden="false" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" >
      <header v="Tiền ngoại tệ" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" >
      <header v="Tiền hạch toán" e="Base Currency Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left" >
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày kết thúc" e="Finish Date"></header>
    </field>

    <field name="ma_kh" >
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ma_nvbh" >
      <header v="NV bán hàng" e="Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" hidden="false" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ma_bp" >
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="nh_hd1" clientDefault="Default">
      <header v="Nhóm hợp đồng 1" e="Group 1"></header>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nh1%l" key=" status = '1' and loai_nh = 1" check="loai_nh = 1" information="ma_nh$dmnhhd.ten_nh%l"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd2" clientDefault="Default">
      <header v="Nhóm hợp đồng 2" e="Group 2"></header>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nh2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2" information="ma_nh$dmnhhd.ten_nh%l"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="nh_hd3" clientDefault="Default" >
      <header v="Nhóm hợp đồng 3" e="Group 3"></header>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nh3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3" information="ma_nh$dmnhhd.ten_nh%l"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ghi_chu" rows="2" >
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" >
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="258">
      <item value="120,30,80, 130,100,110,50,0"/>
      <item value="110: [ma_hd].Label, [ma_hd]"/>
      <item value="1100000: [ten_hd].Label, [ten_hd]"/>
      <item value="1100000: [ten_hd2].Label, [ten_hd2]"/>

      <item value="110-11: [ngay_hd].Label, [ngay_hd], [so_hd].Label, [so_hd]"/>
	        <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110-11: [tien_nt].Label, [tien_nt], [tien].Label, [tien]"/>
      
	  
	  <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
	  <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
	  <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
	  <item value="110-11: [ngay_hd1].Label, [ngay_hd1],[ngay_hd2].Label, [ngay_hd2]"/>
	  
	  
      <item value="111000: [hd_sd_pslk].Label, [hd_sd_pslk], [hd_sd_pslk].Description"/>

      <item value="1101000: [nh_hd1].Label, [nh_hd1], [ten_nh1%l]"/>
      <item value="1101000: [nh_hd2].Label, [nh_hd2], [ten_nh2%l]"/>
      <item value="1101000: [nh_hd3].Label, [nh_hd3], [ten_nh3%l]"/>
      
    
      <item value="1100000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>XGwIiG6XThPcGd/OrSOupbo7q+Huya1SQcvoUThxlwbdQSfonFiNmEj+0nmGTHvgtfFWWsz1GFxYzErkY6dELphetvDpopqJhY4nS9NBYCAelOzl+XiNaQoUtmwdaxeVOELE7yJF5UQ5fYju1F+tDLkzmFuYUap7Fbopq+x26CzKDjCiIjOWng31mpD0yKw0/oCmm72XCGOHUkIkF701tBBcuTHkc7TeT7tNqK3EJkGI9Ooh0vAr+V+vqpqGH15Hb83ou6P6n8fQU39t2IRoVgXtXEKe5GNL9BYyvlrz7urJPERBhp6ECgjN3gKW2Iy1owMWI2hsbdNVrwErdztDqdzwPqYlg9rPjkOHD888Q9CMyAqPSixkS8z2eKfVzbmWHuIaHkQ88IJ3x/5PuEh7xrmT065/NGRqXy46NgduyFJcXrZnxFQjefwgKME9InatoRW3jzz2efBW2J6OzxlISaH5ZAk0J+fHRMcNDP++FGDev5YAlLs6T3GunlNrq42XVT8mN9houaPpgXnGRIbxnIcvEuruuKKpBQEd4loCO5c=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhpN6BHorBZTsDzxO0dp7EcjGRo/AHNyVAS1q1v1LYJvTgnucHaRHpyNmUKeIk/mCxU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UNWxKXqT3noRZYqza6znvsOi4DgFUgv291gwrqZVcOj8sd6ElQjJJdVwebTONxNxG685EChYPgB9SiH3e6nhIc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>yOhHb3vNqmVcGGoblCYJqa4xcY76UJh/dyERkpLqdouuXwViac8Hm3mFrPOsmr4ycZ9nTHIb1Lw+FvuyQWXLpd9WpTZIKlxuy1Hf326E2KNfoFOlzJKBnDx087xjx4TXpDCmA3YrcTzg1QkGeJF0Gi1Q3C0i35/mrdYuHLkj/tbyzSZKvBuQ+x0lP0pe6cYJMsKrgid2vVWzVkaLUd9AFV8kOauhCvAczSg03PMPfLi61lLYvzx6z7xhxumNqBBgQWBZcKAjOXbd6fwMzQg3VA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>8Vg7oFqaTEF7GGx/R/WeuhjBVSTQJzbHFVH8FngsuU0PXRsex8y8Ap2Ee85dbU7VcSLbzsZLQkpAjt68HE+WV+0/7SU3RXnYNSXrfrNYlqRXGsweX1gxVh0ehEn/4J4JcMKu+2spFiZR5aXE4ATE2CmngaVx5mik91Gn2e0HAJCw/T8UzKtHOZ10uvk5VQIZPy+x6aaCCae7VepUIoLwDeDeDpmH/V05wFV6DUVfysLfVTMVQ9cIhNluztg69zoFTk4LTEnwyM1AVMFXDlvvgtw27KdLxR0CEK4XbaKtPQoa7c9t3otgO0uuYtKNmMY+YFQl0CVaG0fxFGbYUA9Gf8Ut2nVWj1EKaGsxxC23aWcbrjszuWQ3l/L05CZek8cU6dqCSuVw16i3EPkLwX/Ppw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILVqjJ+/h57gVjTM3IEWEqrmsJlhSHdPHyr6Xio2Jav9l</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>ivgrR3NTmOGPkdlNBe8q6ONKo/R8/EhUJwQEmRGJXAYYvTnfaFo++lGNdT0rBGiaFFPUVwJnteTVCR0bWZrLMz/hwxfLP0nVuGETuZzIh5qnQW7JS5AMnGWBe/ky8pAgUscQUFmVUySoU3K1jR+v14r6ga8ZXE5j8uEJ21J1D3St2yS6ws76eCe0L1zDMuqHexLVDUGWuHN0M+vb8WTpFizgH86Gx61pp2hc9VThqEY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>3klrz2Cjwj+yu7oLNlVR4cKUPc7si+bmuH7f5zoKcjHc/C0R7faiyXRUOLp6NInH6PxyBiuvJ1gtyMPc5YSVeoSdXz/1PaOYGiaFixxOr5453IkiBDnjcdYrEgQN1WNpTqy/xhaQZmNkic/e7jB8CNs5D4kKYrTTigM/NrHqb4YrV2t8tpoRFPnvMm/UrWo5tBqo50o+kTCiNGiRSmuhpt64813cc1/3HZ+2DFATzg55FWJEpNiVSKQpiSs2FAb1Q0y4knWUQ4XPRx8YWOu6wQzW052kHFELD/Uogj/LJr/u0UWwaWB0AM0oYgdpwCUVVvDe0CsudFVBHYUhSERIxL9j1O1ZiUEcpudxfzg9VYw9ns2dNd/n5lWcjXBXDV3txmd6hffWX0GFwNuuqlXA0SaPqzvbkgJQ2NrFuRyoCy6yQWhyeq7gaA328yxthuR6AMvR0JMQbKTLqQ+GCuZNl8z0y399zBhWSHnl07Nqbf8=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
