<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmku" code="ma_ku" order="ma_ku" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khế ước" e="Loan Contract"></title>
  <fields>
    <field name="ma_ku" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã khế ước" e="Contract Code"></header>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4y4A7Se/phl3tUCrZLVvd6i8olFwUYWTOlHy1TwZO21P4vUv0vPel36NmhQ8zkvaqw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_ku" allowNulls="false">
      <header v="Tên khế ước" e="Description"></header>
    </field>
    <field name="ten_ku2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ngay_ku" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày khế ước" e="Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41RC+tcKAaVzXmlFZ36jdLq61Hmen0L5MELxVqx2vxLQdjUkMvvCQbu5JSBa5KZulA==</encrypted>]]></clientScript>
    </field>
    <field name="so_ku" dataFormatString="@upperCaseFormat" align="right" allowNulls="false" categoryIndex="1">
      <header v="Số khế ước" e="Contract Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ku_sd_pslk" type="Byte" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Theo dõi số dư" e="Balance Tracking"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
	
	<field name="loai_ku" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false" categoryIndex="1">
      <header v="Loại khế ước" e="Contract Type"></header>
      <footer v="1 - Đi vay, 2 - Cho vay" e=" 1 - Borrow, 2 - Lend"></footer>
      <items style="Mask"/>
    </field>
	
	
    <field name="ma_nt" clientDefault="Default" allowNulls="false" categoryIndex="1">
      <header v="Mã nt" e="Currency Code"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ls_td" type="Decimal" dataFormatString="##0.00" clientDefault="0" categoryIndex="1">
      <header v="Lãi suất tối đa (%)" e="Max Interest Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="1">
      <header v="Tiền vay ngoại tệ" e="FC Loan Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="1">
      <header v="Tiền vay" e="Loan Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ku1" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày vay" e="Loan Date"></header>
    </field>
    <field name="ngay_ku2" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày đáo hạn" e="Due Date"></header>
    </field>
    <field name="ck_tt" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="1">
      <header v="Chu kỳ thanh toán" e="Payment Cycle"></header>
      <footer v="ngày" e="Days"></footer>
      <items style="Numeric"/>
    </field>
    <field name="sl_tt" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="1">
      <header v="Số lần thanh toán" e="Number of Payments"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk" allowNulls="false" clientDefault="Default" categoryIndex="1">
      <header v="Tài khoản vay" e="Loan Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" categoryIndex="1">
      <header v="Mã khách cho vay" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="1">
      <header v="Phòng ban thực hiện" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="1">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1" information="ma_hd$dmhd.ten_hd%l" new="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="1">
      <header v="Dự án" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ctdmku" external="true" clientDefault="0" defaultValue="0" rows="220" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi tiết lãi suất" e="Interest Rate"></label >
      <items style="Grid" controller="LoanContractInterestRate" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ku, ma_ku" e="String: ma_ku, ma_ku"></text>
        </item>
      </items>
    </field>

    <field name="ghi_chu" rows="2" categoryIndex="1">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="tinh_trang" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

        
  </fields>

  <views>
    <view id="Dir" height="360" anchor="5">
      <item value="120, 30, 80, 150, 230"/>
      <item value="110: [ma_ku].Label, [ma_ku]"/>
      <item value="11000: [ten_ku].Label, [ten_ku]"/>
      <item value="11000: [ten_ku2].Label, [ten_ku2]"/>

      <item value="110-11: [ngay_ku].Label, [ngay_ku], [so_ku].Label, [so_ku]"/>
	  <item value="11100: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="111000: [ku_sd_pslk].Label, [ku_sd_pslk], [ku_sd_pslk].Description"/>
	  
      <item value="110111: [ma_nt].Label, [ma_nt], [ten_nt%l], [ls_td].Label, [ls_td]"/>
      <item value="110-11: [tien_nt].Label, [tien_nt], [tien].Label, [tien]"/>
      <item value="110-11: [ngay_ku1].Label, [ngay_ku1], [ngay_ku2].Label, [ngay_ku2]"/>
      <item value="110111: [ck_tt].Label, [ck_tt], [ck_tt].Description, [sl_tt].Label, [sl_tt]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>

      <item value="1: [ctdmku]"/>

      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
      
      <item value="11100: [tinh_trang].Label, [tinh_trang], [tinh_trang].Description"/>
      <categories>
        <category index="1" columns="120, 30, 90, 120, 120, 120" anchor="4">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="566" anchor="1" >
          <header v="Thông tin lãi suất" e="Interest Rate"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>9v4dmIJZ1jlZi7gD75hxqBUgb8tuuCmyFrE/lObTXtJiZTsKYa3YQtkfSVQPx0tNpeEOXueOWPrzXyAkC9SJPMuLGh81jpfvjYkA6jVMEb9Vz0meWNL1JfZ2yamj7SCPp1wv7c1mlUqcGlmhS2e5dkM+fDyMMokYYT8mXHPgr8x5y25ZnUrqMg/LyPRqkEiQUEWVPy446NBSz7KfoFEzsGZI8RNI3M7kPZJuvnr78EpNI6AeVmzdKenerYrARGvl/9AODUh8sZuAd6x0AEKqG5lxflUOTsoqmWLpysOrow1Mqy/iCq4G4bJ3K5ArIXsy0uv6BqDy5z0TXlQN4S5rJjpmy+57twaOgPhgEuCrKhVHpaNHZ3bMrN3o891LmMYli67YwkOQ9t1lu/6TmD2qsKyXTypbc0hb1L/uQVmkyL3dvmnwixP1sfIckrQBHCI7UvLYbUjkOyGyC33Pw60+GkzPe+7jfwJJ1ezARXOmEndxRfYJmnAOvtyc8uogq9yinApoJk3dTss2ytH0nVvMQDlwaTz11kqlwxNse/jxR08=</encrypted>]]>

      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>fiUG/lYijxgQcCp52MbuMUFqB/Ic2TVAZ9w2/6TCchkFid/6zDPzSvk7pKSw8wPEKblMwyr3QaLucU1Y8ZrWmIJaAQbV/e4oL2hd0NuFLX5HJCfuZjZGhIUahsvzwQG7AAYsAFfclKsIuSKEKHBFTQ0IVkOV3sBv0pUiymQ825yfo7lkUiFjntSZSeAL+bkt0+kXtOJQitMsY7eFGha6Mn1ESmM8MMtqzhLQlbFhiwMPbSycQN0lsJqoqMr87QGrLkU5F3BpvbF8uu7Eutq1Oaiczhpu7p85N4zXcse9Khdkfom2T7ilc5NmTKgkD6t7CbpPmpmuHL6tXkjgLwcyqRmLA7juBGszMfP7NB007ou76+bNofWCf1tc68CYbTgp6nXjL1iSylExusuIUPnBSiYH3d3xJYCMGhrfA+XEc9hjHWvZ5LNGpXOn73IJj5pYw4gEN30lYlpcp3gL68BE5P5OCAZuFujAAF0HoKjLPQBJ0MLrh5T/MunA5OvVPfwlgEIw3pHdI4xTfr+H9m7SABehEpFlJOnogAFZP+Heufl17s3axSaSUCzNkyTzbZh1</encrypted>]]>


      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VEIVH484Gyp6/pbJT4huEhFyB5bFdkG2valq2p5kNTx6P83q73miv0iLV1VelRonm/Ls7wBf/lI19P/yvAcZAvacSZ2vsG8N6+em3cHVINY</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>B4tEDORRHhyCK+4omS14G1ivCc8uYjTMke/W0kydiqtYUrT54KCFEnD5xTtt5Xf5R70mAk+Vn9DiDEaQM9pZsICd6QIsWs2RCJ1lX5ZMVtatUrldyVlFF//O97tnUGmZNrztUpoF2j6advmJ+SRsW9jRtXIWp5W+PFTnCtLjC8jtWC6ByY9WkPaJ7fyQ8y3QZ0o3yOxOZDJ9cwkZcd6UMAWZHNVu5o5CBK4L+h/SVSQwxjLYOmXIAJm8Gk7uTj0xVd3YN17C+10ELx70/HhhDf9cLsB1r4lxej6N4GY7KkFYKjVxrtnNmZlfaF6++DSRIzMNMVr6Xer6BD0Eil3Ui3WTVraCleYjJKXFrk1C5m53Dj56DS7sYIrV6XpCIR6yiJ+UEsoRUOmRz/f8pOLQq60F4gT/kZz+K+TXWSySgdzozIuZZS5+ML8lrOg8jenM7bD8J13cWInNQk1A4F6vDwhZMkiBR4unpuQPU1JuyVIjBKxjKbSPOdClGlhEm5uPWjHPrKj6wAgtQbZPZzqUjzYueEswzE3BKqCd5Zzd8Tg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>mV6EEvZ/8qUwpKeYw+chbPfzkLAwCmc1cqVZlYV8O4e9B1q3+h+ki+fZXEow1i2yYWKek0FWyfBO/magk/nZVDmqIW/08I0CD6qZDbBvY9kXl/K0SVFjmgH9lLLo32rBsfzhkGO1wU2nzSmxSZseoacucrOvZY/+hu9C//TOmzP78QIXa9yMQ3d4EQpKmTIJuFjec1jD+R4gkTX7mP+VBfG1tcLQfqAonF4feFOygf4pMsQRS0qgaeg+yLHOathmzJXEInAO2e7BcfvXlkhPwhlL/OS5QbvpSDQyrdMqPTJsNeLRNjEl1vxAm0IF97XGVVOoqk5UFreWXDdwLTLGZQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPqIs2HkcVT0rhAMwewS0L3VeKBi90xsQjCfRoHres487mPfy7K5u130Q3tjM1lH+iA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>mCG1JSGKcnlzbB4PD2VQfnMPrW59TMAo72jOwLpIKKUTwIDQYw4TeAjksW3CMJ9N4cxCrpKPi0/Y3iGpA0AbyG3a8BjK8ysuytLe2AIK1BIL7YdwWTSwujZ3IL2Nh8X2+H0Oo5ck9HubLTS7kESY4D8VY9CK9VrBMhVz59t0A9xMkk9z97xPbGtriWiZkw924xdcomy0/Kh1Tg+QgWdjCP100FI4Qc1Z4igN5gBh7ufgbq2jOIbrGwThJ+Q2E/2ALifjZGXGs069odXA57o7eItO9G3BQuNSNyFKIG6RbYaVQ3iIEgN/a9HmkIG13c+lj5Ws8lEDwopkNmdlaA2KmyZ3kg3JfmheiMdNG/3m6A+08NHGs03wuf1qANh3MOkHbuSll3OV2VJAjNLA9nZ7vCQeHb3KdbqpLRw8JY0ipo4rOs7r/hUWRd7QEGYUhcHDtCy4rvgJVmhVhNWDMj+fcdcI1P0UhumU+MwpkqvNIBI=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>FUjJ1Osu4y9T+OkQtooB+TW/SCXWEPaR8ACYcQa5QBbMmznq6AVRswjqVs1nxFbgDjP3r3583keb5VMdF8wzB98xWE3s9Bjqdn+yHegRW5yAs4PHeSi828c0eMHz6HRFKtoV+H4hzsekevvnTk2GkTqf9vwuKhs/d5zc/PopIJev7XdFu74pX0EMTX8io+b6Ek31qCC9+AYkbOx5veCgdJrpg5eH0iDGRDzMlc3jTR9hZwi+bAZ6ZJxpYbQO9PPW</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>AEF6vvYpxtWim+O4x3yMktNlAmz9m5Djfu8XdvMPCRZY4mKy6qMVA+GAvVK5UzZmUsx4R8rYktUnGO26STaAglH3CeidP44s6sNNsV6sFODXSWICvmvJXgSGqY9KcFVfkI4OJxD1wlZ8VRAsKSy6rZpRw5Lu/EPEeQZSY+jwZUTziD25XxQSchn/7q5sA3COZvTSE1Ve+Q0a4tPIZbg1anZO7QgjX07c2JDimloi8EE=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>Dsscs9x9ljOibQfybxjCw/86crKirHQZ9JLVmn7Xiq/xvX87mqk9zruU60gkHGQv40rjbJccc67w37U2vX9VsYk6t9otHiMHSoRn0+lnTmFNpw9f68NhJQlUONTs5g5dSd4wKAG8fFcXA/n30toz/5tjPH2oBhH1so2z9NP5Tu0QDbp7u7bYwro9hRH3NnUKhunc2Renf48ckl2tSRzNxCOVipD1OWTTrZPcAtvgbXv9lH+ypZGJHVyTcjapdIrqFr+2uG/yC9hLn8q3nTcPUAyk9LIG5Q3uHwEGbuqm/yn1XBF/WiCd0zSGD7xNECRLS0QqKcecDbrRWN65f4vuhoTFW/uzt6XlLZVUjxoAC8QUUyxi+S13NE5ZTJTuZiC3JVFYEg9O16Ij6QrF9wfcPOqwRpuey796EhFarPhAdBP/VCC5qR18tfo7zC5vvNS9G5qtUCmQLo8UXjrJ0f9xvAz2blQEXaMYQkTXdI8/8RQ2D1ZyhyD3CX1e/Bpi7SyjqJB3HxWWxKEPIUQr8CB9UVU6g/l5GJ2LuBeVLKQqiUSPBLh10leMefVB1y+ZTunlNUfmEJlFaiwBFRCp1Q0KzcY0O3oBOYhj8b/e94YZgqELvSPCcn1XWFFYqTfMYAa4o+OrKqXjmk/logr1JUZKprpsbEPtzo/kVO4wWouoI+CbZaQzRGdnqIHiwAmaK/Vvzdxl8d1xuHuQZhaK5VBxSSXGnzpL/CfRF+Oyt2Bwz8UFO5CvOJtnPe4v21RjPN0aiS2jZE9YzJIy4RCmftMn8w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>jotw6OEejt5/sS8j1Weem7OPXr+Yc+z3+xqC/bWhXWzAg/CPGt3LapDWUJ3cApWnluKBzj5xBT3KPXtxT87wGaW9WFdWcG1ud2m89UprGy3GunRT5unn3U4wzAJTUkQJjXqCVdvGvedEXVIfKLi24Y+M5KsryzfWv/U8UY+aSPjzFkc6wMiO85bhfcYmckVUGDyiA4unDod8HAmZZozGgjXYb9akfzM4fLBTIAzyi1bvuT+uE0trwedDh6c8L++bFf2tk4Fx47/IB9dj3vc1bzuLGws86fzFaCD/BJlb0GFi3IFYJZCrqNffQSSngUhHnehNwI7/D+S4n9OkrhgOWY/XorwTumqakS6uj5hmdiMoyQGHzePNlxOtGc4mq3SyBjPamjcFNuIm1IluxitwGkf+fWYkiBptHjiRP6aGSuHyXjvIHSl09jNXbxFJ8B2oLmKsHFOoMvXQuQU1gQ30yD+oOgv7b/4Na1Oxu0nHCvERTT6YUvXYnZolTyxRV5DsYuPFTKU8R7ArzkalZOrjzRMj5wuoc+rxww3etTnTzmCKL2S1lrw4oSaLBjVxzXurgUifcP9QiNT/ORK9y+k/bDLfW1NarJ3T5Wn/cBiNwujwUvb9HYZXm7y4uTicgXjEa1bPgahc4SReSPWdou6/ysbaKJLYUuSlXOvkUgK5TPujT9eY3XVHFQUEaJYg5qfMzrZ1aAdfOiz8JjxZFe8UYC1Jm38vM//JprmO+sn+N63br9yh6LFEuGY9HeX2/lxsNxxyHqJYxP3ifevQUiLgRS44C4Bj29fx432zT+g0PI+c3J8rZY61sYQCuuU1y1u0</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
