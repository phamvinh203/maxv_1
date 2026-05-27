<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ParentAccountMessage "
select 'tk_me' as field, replace(@$parentAccount$Conflict, '$s', rtrim(@tk_me)) as message
return">
  <!ENTITY AccountBalanceFields "abs(du_no_nt00) + abs(du_co_nt00) + abs(du_no00) + abs(du_co00) + abs(du_no_nt1) + abs(du_co_nt1) + abs(du_no1) + abs(du_co1)">
  <!ENTITY CheckParentAccount "
if @tk_me &lt;&gt; '' begin
  if exists(select 1 from cdtk where tk = @tk_me and &AccountBalanceFields; > 0) begin &ParentAccountMessage; end
  if exists(select 1 from ct00 where tk = @tk_me) begin &ParentAccountMessage; end
end">
  <!ENTITY CheckARAPAccount "
if not exists(select 1 from options where name = 'm_tk_cn_list' and dbo.ff_Inlist(@tk, rtrim(val)) = @tk_cn)
  begin
    select 'tk_cn' as field, @$whenARAPCheckFail as message
    return
  end">
  <!ENTITY UpdateParentAccountType "
if @loai_tk = 1 update dmtk set loai_tk = 0 where tk = @tk_me">
  
  <!ENTITY RevertAccountBalance "
if @tk_me &lt;&gt; '' delete cdtk where tk = @tk_me and &AccountBalanceFields; = 0">
]>

<dir table="dmtk" code="tk" order="tk" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tài khoản" e="Account"></title>
  <fields>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tk" clientDefault="Default" allowNulls="false">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
    <field name="ten_tk2" clientDefault="Default">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
    </field>
    <field name="tk_me" clientDefault="Default">
      <header v="Tài khoản mẹ" e="Parent Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_me%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_me%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false">
      <header v="Mã nt" e="Currency"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4xk9bwAC7wUD1L8H1veOenuPbJURWHe1oLWmCtjWzOLbZG37FYUrE+Ldk5+ISL9v1w==</encrypted>]]></clientScript>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cn" type="Byte" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Tk theo dõi công nợ" e="AR/AP Account"></header>
      <footer v="1 - Theo dõi công nợ, 0 - Không theo dõi công nợ" e="1 - AR/AP Account, 0 - Non AR/AP Account"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_sc" type="Byte" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Tài khoản sổ cái" e="GL Account"></header>
      <footer v="1 - Tk sổ cái, 0 - Không phải tài khoản sổ cái" e="1 - G/L Account, 0 - Non G/L Account"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh_tk0">
      <header v="Loại tài khoản" e="Account Type"></header>
      <items style="AutoComplete" controller="AccountType" reference="ten_nh_tk0%l" key="status = '1'" check="1=1" information="ma_nh$dmnhtk0.ten_nh%l"/>
    </field>
    <field name="ten_nh_tk0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_tk2">
      <header v="Nhóm tài khoản" e="Account Group"></header>
      <items style="AutoComplete" controller="AccountGroup" reference="ten_nh_tk2%l" key="loai_nh = 2 AND status = '1'" check="loai_nh = 2" information="ma_nh$dmnhtk.ten_nh%l"/>
    </field>
    <field name="ten_nh_tk2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_cl_no" type="Byte" columns="3">
      <header v="Pp tính tggs nợ" e="Debit Ex. Rate Type"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính chênh lệch" e="None"/>
        </item>
        <item value="1">
          <text v="Trung bình tháng" e="Monthly Average"/>
        </item>
        <item value="2">
          <text v="Đích danh" e="Specific"/>
        </item>
        <item value="3">
          <text v="Nhập trước xuất trước" e="FIFO"/>
        </item>
        <item value="4">
          <text v="Trung bình di động" e="Moving Average"/>
        </item>
      </items>
    </field>
    <field name="loai_cl_co" type="Byte" columns="3">
      <header v="Pp tính tggs có" e="Credit Ex. Rate Type"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính chênh lệch" e="None"/>
        </item>
        <item value="1">
          <text v="Trung bình tháng" e="Monthly Average"/>
        </item>
        <item value="2">
          <text v="Đích danh" e="Specific"/>
        </item>
        <item value="3">
          <text v="Nhập trước xuất trước" e="FIFO"/>
        </item>
        <item value="4">
          <text v="Trung bình di động" e="Moving Average"/>
        </item>
      </items>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110: [tk].Label, [tk]"/>
      <item value="11000: [ten_tk].Label, [ten_tk]"/>
      <item value="11000: [ten_tk2].Label, [ten_tk2]"/>
      <item value="110: [ten_ngan].Label, [ten_ngan]"/>
      <item value="110: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="11010: [tk_me].Label, [tk_me], [ten_tk_me%l]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11100: [tk_cn].Label, [tk_cn], [tk_cn].Description"/>
      <item value="11100: [tk_sc].Label, [tk_sc], [tk_sc].Description"/>
      <item value="1100: [loai_cl_no].Label, [loai_cl_no]"/>
      <item value="1100: [loai_cl_co].Label, [loai_cl_co]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>/hauu6RA1T79t3lhm4EG35TXBt9rfY0t/1kvbfiy4ZoRE60OTliIQVo/b8a8vW1sgrg7U+mbEIUg7ctDGPU8O41SNv4dQyGvmDlbu6yFkk9Y1rs+iV00sPXc4n3jVEnttIYgsh4j/FoYfw/CqiXakFrLth7w5Vc7fhI0n0OUBBZNejPNEeyXnZ7mWUn4Sae4ADfinawsw57TwS3imqyyW22oGz9VI/5u+XDUwCMlRB4XLxoeQMKpxUMelRLjqo09Tc6HxPD3eJPYeoFoGIG3FkukZbA+Z+lkfLTTr8nrqqvizcG8Q+pvJmSwaqtUTmYLfwHoLP+fK1c4og7RQXNK4Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7YjDEuh4wKeUP2/9SeHJatlLnbLGuo6dOf573lkfmOb6nCcODrKYeMO4YsGmgsM/4pffOoBelBfsiL56frXqSvI=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>OxoiuVIePIUB3n2FRH1HZT62hwUOA6bs4IirjuF1xc7k/9G4c5YN5EnMTg/ZimYm1RFib/f38FXxR7xNUlCylIKEn/GFl0lcv8VMWomn/Itu3K0HBmCoVdz0w+dgwWLb</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>62VEejx8TKU4H1VBDkxVBhZgoK5RE0wHD1Rlq+QCPto5sV4yy1HQ8d/2N1dccNq4/v3nthqWAQZjtfASiLpHjTXzLHWSENhseCSTB8R4KA6KNMKMqcvjQuShz8VetN6JGrAfA8fhoEqJv8gdsEkBvD82AJL3VFZcQ7T9TeuvCVZx3M5CeJnqlgj1ETlghX+12ZdnrjRMFnCTpAgt/AkR7/xEQKNtcSYWIn1Pb6kn0EWcsLqJAbHY2knBc8HZrByiYauNKdsZww+aJM6LZwcOikncjjPsblhwNMGsrQlEoZzKxNXjxw4IGmFu7e1jL2IvtUOpr+r5aCUsv/R1UuOkqzJtWsX8FzP6ndFuWtmG9yw/qW1pTfFz4O0CLLCjka21ABonYq+uNpExRVBTVQ065NV68r/jOE3FXR0tJi3kxbd7QOvxZSNwMeBNP11wDmUlscJyWStloGl2BIl0khr9xVUtmKkvYwWm7xV82YkNRHPIjgXFzHMyPpBDb2NUuNaQjsyYc2xNMV8R2XaCf+fdHC0n1V9vE+WeJ366SBunHV5VXixofxcBTvD1rJRHGI5eWRLCO85jpbp/hoceJ1LzvEU6myklzNkhXUGyOJF32nz+DIFo7Nej1I3Y7m3IQNAPler8jYGiguodbRrUE9F24ymQ2ij7e7fBOzuvH82LIRjRLsEMmtKUoihSNY8remDtJU+Hianutdmwq98aVKw/4xBKlYyVf59LuISealTTVDrzEHxQAlqE/8ljuho27xTa/prrDpxucI52rW++CTKHezBjO+wuVy6Qn6rO0+QbDS+y6SwFgrvRCyqU/sGrt4WzoyD2CYutMmh/IpAV3uZEvLK51PJu1WmaYLeAwg1hE2IXsx7tYh+VPjYhp6BNA1Nvn35jS/1UIrns6BFzVvZ7W1YsXBTNlf6LTDh7LpFUH83C/TdZydj13zQabLSwh1g8EuwgTwgPHMKURFdr5h+xXegAEevRRKzzuusUaeI9dhU=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckARAPAccount;
        &CheckParentAccount;
        <![CDATA[<encrypted>jzVThAOa1Li6yLximNsz/m82UAl8mTutEZI8TWRQZQpRHz8RAHIeFZ3cQKDsOUyjJ9NyNdVR1To6ChzioyoQdxGk5U18oPcPFZ+2Q3uclpAK9aml/4Ze/SG5wtGvnLsDihVO/lcWolxbFrE5Br8F99TjV5NiPgGiaM3gG2I5Ba1kik80hsmlgdvARWUeI3d0jD3GH4dmL0TWYr0Ut//uj742ptp+adPmY5nZsgiisOL4Hs46fS3Mm98i+n0ru6NZNVEvzeRHys82sh074dOK1FV80+okszGlJUDxv46O+QfX3132zkMLr8UtHn/s1ejsh33dsFYvVEaEv4pMFQEbwcjIGKQKvaqVn6yf2AJVYIPr50XFf+F+ViumlUBPXvseNJp5BnwDJwUe6FbjxRKUDw==</encrypted>]]>
        &UpdateParentAccountType;
        &RevertAccountBalance;
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckARAPAccount;
        <![CDATA[<encrypted>dVavMuZt5dBWf7kGrR4iGqGq9gPlYmCcu3n3INrlJxF2bEZv4sh3CVupdn9NYol2ha+7LXro0yC9rTp4LA7VtvkR6IbkmlNoPJSizmfL7vpEgacsOSbyUfL61YMCNXdnM81qR94rOAi2KRlw6AKgh9NKG/n6r2UDjD23WhhZGj2PZwRK6RUtjR4/m8TmhXx2C+MNOk+Nq5hlI/khW9gd3p0/4Wbo57jVK65ZJSXO1sHh0AA1zU8R0WmsqF5I5A/hQwskathEVSGv9U0eXAsfGkm2zqfwaPRX64PI17NaNQZu6qUNDiOztCilWJiT7ij6/ZRm8gHduUdpKaxzXTIcHK57M6LxfFPJZR5PqOzXSGSsyjkhW+Gg6mS93k5/U2cLj200K0Gmv+If5CT4XQXdvg==</encrypted>]]>&AccountBalanceFields;<![CDATA[<encrypted>31k+744vwDU3rSjrfUku9ozHGGPPeCrVOjDtcgRRRLuYbB3nvpMEroDrU+8MJWw0TLHGFMzkg6w2t1M4kd8jnayw/ZNUC3MJvQUp3nb8RcpsjIrwoic8pxVq3SR2UwEt+3JJKCW7F92U6Vio0W3czu1dGndNNJFEqgTbZtPvw+qRFKgwMVdMqfXBYeH5QL/IDmhyuzxELBGfp45VLZgmYQ==</encrypted>]]>&CheckParentAccount;<![CDATA[<encrypted>cFyS9UFIkaReLSNklQz8NsRhdo7psL0D9wZ9+G7FZ6aFjqF3vj0TY5j9WI6DJNTt+IQJikgSqUBtaR6GZWx2fHPvtjiFooWOwjvW7DDWnB4523SoZCwcs69R/VjfxPopXEAgDZXgWFOABNw/IgpTrbDzpKOVnkrSeGoFMwt40/9EXh2lutxd9+qjRppMo7uSDX0ZoecmraaA/Oav+sCfctFifEtCRKcMf4GW4sfUlmP7IIm1L5ICnt2lfIcq1j1HLwB1XVPA2//c1XM/c8th2q+R+hZJZ1L5gyspYLFQb+vQWy+9i+psQUy6Ag/t2vf6xXc4+Hhc6jS16w7gMD83zsE92NyzsM/N52tk0gp/vUNhzhu4sBQ8rQZ+gw55utxxmlucSGdnL73LqaacmlAaag==</encrypted>]]>&AccountBalanceFields;<![CDATA[<encrypted>n2j0DUxRXY5GtOrY82GDQitrvJjh+OT7TWGKSWzlFcQRf1uft2sMZnA3yVmb07AQZb3jUDobfJG5HDjj5FY/m3kiQV4X59Q8l0rzI51ON3ArtKv9bzdQpuO51Su0ddqR3H7x/Rdy6tCH1wxjlgaEzg==</encrypted>]]>&RevertAccountBalance;<![CDATA[<encrypted>iZzd+T9L5VmV4PzygBLM/A2hhxGirUMTf2uwe9iMPg0=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>j/j3wDlP0jEyeh6ZnEYpW46bxAA9Htjsp2vKngRwnoNIqB9Ml9TiqkPOLd5/uw5mygNIvzKGncLXebG8CzhKLFpMfd0xS7paA7Kg+OrIDpEYx9gwxpKLbrw/Qxk4qry6Lkl2e81pc4zyS2C0+evYPr9C2/WCoMKUZLhXuPpvD1TxxsNEK0toSy+pjf8MloZ+BNclMEtmyALDj1B9KQn1i9sggFRRWUJokL9AfpkzsSg=</encrypted>]]>
        &UpdateParentAccountType;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>FkydiioIua8cUbYQLgEiN+wfQz2ycOIpez0aGu2FXAFj0doaVczP8R4Ln0bH7+CvfRH7TFn17JYQFuAQAi7IlMv4WuRZOdkkFWnDZiPvTnaVRFqFX5xUE4mAwbPoBhHAVedPTJBMpgMJmxClP++rxMfUyEQ4xFizKEbH33YWOvpWeQ+uqOoGaUqjhNKmkGGEoLsiddpvMCfHlEEjE0Z8pnWudrQhEc/GI3bO5/xxwrJy3ZASUM2XBcBGWj6omWpGt/qtK14s5RCIfyc/3pxeQ5kzM+NDpcLBoeNMiqCOPCY=</encrypted>]]>&AccountBalanceFields;<![CDATA[<encrypted>Sk1L1VWTDJZ9fGQ2mqIOkluRx2nPCHhMfbUal7eO4WK3pkUx71L7HXpGT7fVHh9MTgQYt5TWquhWMPKF8h+Qw9LctZg1lxZ4U0ifDE+qTJ2eGeRBQpS9mmwr5PQL0Xhbj29giK+/4NWA3OusPownyG0G2aTSRlNn/ifZwD0Gcg7vYu3c1KV4648pSEUD8b3dwNwfuQhCwdxKro3bdPHZ8BXTfG9VHICQx7KC1G3r+JXLmc/sxX1DMc4R3+WIVnvHgfNEfZEgfMzWZhcvsFMDmQ==</encrypted>]]>&AccountBalanceFields;<![CDATA[<encrypted>n2j0DUxRXY5GtOrY82GDQpeCDqNM9vyOf2/sWk4yUWI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>qhZb6CvBmTjG8RvQwwnRxbMwpGOOI+becR5Bs42R05uvDC55XV80vElXA0Zv1mB525Yit/pzxLTAW5BwPcwVuy9AHpuXfnqmAlrTXcgIhMdTD0vznDYZB68dP100w1whCOStClxyMa/3vVdu70tXWcINR/wRXPPs2KINrqNMIm3SsxiWOW0Vuqcbj2TRGpiz2+Tot+xKDd4YNUGvJHq3574dMPStX+uye3qFzGmOsRocD70L+D7dV9ZpJmBLa1BGvrNgDw8DPmXgcxc1scZRBFcUJo2PIwBwziYc9yVmrjha7262wvgFHP/pjzSmUy2fJNAGJV6/hSy88WmZvpUhFJsB2SGofMW2f8bmfZt0+aOhohIR+wC+hkv9Z47npiSqt/3dp4gCQ25MxB+Le1vTQQR7zTH2wmEsG7YlLuEFJBf/A3ykTQk4tnoif7APvj9EInAhJeBt/FoisPPbWe01hA5Qy3BBEd5NPbX/wQadXqgZzEihjfUOKGnfPorZUjDk</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  &OutlineCss;
</dir>
