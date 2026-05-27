<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmmagd" code="ma_ct, loai_ct, ma_gd" order="ma_ct, loai_ct, ma_gd" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="mã giao dịch" e="Transaction Code"></title>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and ma_ct in (select ma_ct from dmmagd) and status = '1'" check="wedition &lt;&gt; '9' and ma_ct in (select ma_ct from dmmagd)" information="ma_ct$vdmct.ten_ct%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4y6DzgvPygIiroZcHXWATSCy89zr+oDgqYUna2OBmdP6ZYUa4QR/C6kTH4O3DT0caA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="loai_ct" isPrimaryKey="true" allowNulls="false">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <items style="AutoComplete" controller="VoucherType" reference="ten_loai%l" key="ma_ct = '{$%c[ma_ct]}' and status = '1'" check="ma_ct = '{$%c[ma_ct]}'" information="loai_ct$dmloaict.ten_loai%l"/>
    </field>

    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_gd" isPrimaryKey="true" allowNulls="false" type="String" dataFormatString="@upperCaseFormat">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_gd" allowNulls="false">
      <header v="Tên giao dịch" e="Description"></header>
    </field>
    <field name="ten_gd2" >
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="type" allowNulls="false" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="111: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="111: [loai_ct].Label, [loai_ct], [ten_loai%l]"/>
      <item value="11-: [ma_gd].Label, [ma_gd]"/>
      <item value="110: [ten_gd].Label, [ten_gd]"/>
      <item value="1101: [ten_gd2].Label, [ten_gd2], [type]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khJMtlwvrHYYGDe+Ev1smc9fl4RuCeRxjcczVvJb6ZAifQx3cPWjhYZPdBA8XMrPX2zZuqHe5c+m0d92pWpAbWVrwEwhs107rUxuGafgOLk3Z5vWY7dwRoFtI47MmI2HDgD0QkPxk+Gmhr6EEQ25abc=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kmfiCFT7MlT7QQvObIXyLPKXAKfyc98vN0LorEkRb+D38b72v+MgJFAdrQD7ljZqGcqK2+M42Zrrj1N+yIIWUBw9qu5OIH28zvrMZpczlMjg</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>OxoiuVIePIUB3n2FRH1HZUhJ0wBD22kVgdieLRMcYjdMUktBSeIPwBQfB6O5M8rilheTEtRqvJr5qBUJqUTTYa+sjGjtFXD55Oxh/VFzhKTDiqu7lsz9wgX+fy9O78eSOoyZCHT9DKzH/ixmN0r2Eg==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>BydJGCjsaGIBQur53GfYIhOTTW8jVuYJB0+W6FlU51uYoa8lBuGFNjVnZsZla97D6kHf3Kim1+kv7u31X7+yGTMh92yUgdzJI0NXQ9VEYOc1Nw8rDzjSOqQ73XkiAtR84xKEw3cjz3iHW4jLxIv3KX803qmu0JCfqtOuB6ejQo98sxz0zPNTr+KBII0z5A5zei9B02/2o9YvhlS297VqWxmR/Mxo+mNTxWe4DZ5GuGOJjoPIprj3VRJVGsEpztOIDZpf2qUaEqGetxWS4fUi9OvSRuB51NFZ+1sr7QP2BiJZiyGh/nEDiNox5egdA0se915oyUCsYFezjpGDOKrtnOynig0gsVCD07Y3scp+jGVnQKZ0DRE4mS3S27AeDXTHxb9/FpF2PBrUwHCGzhwuRdp7mCPHrk0m1DTaL9gKzagtkpEyrJq2APxhltjHbgNCKst6Lg8+0hQxMa0kYW5537MgTyYuaA7/Npou7TW8JzJ7amrjzj3BKkPpdkwswQ0tI7zWLpard4t9trajJ3PxPRzWOkWcpnOCy/xg+qaRwGziiR9nr6DRWc5uMOdN5vDkvliOKkl0T4Ru/ZxtxQnbbueX9yxqb2CGoZr/1NaonJsjkOBShV2aR0SRn4uwfd3xYaJxiqTrp1CEAXIf3TOfPQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>M7T/RfimSf0tEv3eZrMef9LRLAvDwKWrAJv6vZOBspFEjUj0O86ZwLngq5aslowjCrVMq1fKIC3k2iN9KgCWlh+lsNgBiqfJPeGSNvxRz9s3l5lj3RMPq7iLt32VgofmU0HGpkLz2qLe978jzks28SF4dMF5FTbPSKqVtkX0yAaAwk1bjEYwkuDBHxWOJJvUsokS/SDzU3V95fLeJC4B4Q4yMXQVgwHiWsbLNyi9vsahpbuZVf8CMhmk1fmonx0na2PoVc4koL8tMtvuNurNLoc/C7D2cZALO+bZwYdx6HTWrYmDk2JWLa080pgBBH0j+M8RQty1oRxfmaUDmYzhimK/njR6AIrOQDrX12cbgik=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>wfQQbIHLJ3VCzZ8kJ284L7LpgqPyIxuuXeR5VvtWZPj3b9eacmvkBd/PyCyT632G2C0RSbcSh5+xjw6t+EvrwIVdiIliwIypI2lNbiU9y3gnIZ6Ko4cU5Sv4H7iJFjpixvHIUR22Mrg98ETnV3p+QcKGs5FURmVMvZOoi4yTC/0tmrMSfQ9eoyJtHxArGBq9sPPigCktNJJre+qrPzP2s789JrRgXGkNxXXNdt+Q1wRC9F3jcx4Vd4QNNcCUxfL2pOP228Fmud+AxcV0uNvM89wzQNEm4USvYV/CegGeZWoyrhbtS9ZYsjRJj3KFeo8U1sY9JuDWh8v4q2Lxf1dHT/bYmt+d2Mj9BXYHiw9XtQqSvQLDl94ZhLmy4hamd44C8a8VD6tjvTq6o3acVxS1zdf1uIA3E+2t85hRW/WS/tuPXleidTyAZvJFimCIbK8dYmiR5YhwV6xAfp7l0Jv489gYYmkwGhxkVzBM1+p17xo=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>BnV7UbgFoDMluJYAuZ00o+jC/dKCp4TAJd0kkP9YrSQ8sdc34sTy4Rlwy0poL7Xfy6pGBFA177uEft88WdPG7Lw2+6vqjFVenq2nJeMvvN4Hh7Re3e6rMRo9LFxns7ENBeBjBk1TOWRJ4pzdJRHl+w==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>ivgrR3NTmOGPkdlNBe8q6CcNC91X7x21wGfxN2TCN3a4XftwvaJPJkmfUCN/6QIhVb08DDroHi5yb+LY6m/bI5YHuqwNxvYLty1k5RoiUVnBrUG74mHlXqPZFm+8zfl/X2Q9prF1ZIG0c8FTp5llN4w329BzW7yoLcbXfNTdHApvK4KDTL1G9BLJ3eIAgJt9Ru5vKQM5Q61KcUSnUdQpIbFfURx7+EECGD5LufyyVR/B5sNPkp5+z+9OtOZPaiRO</encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>7xnSriCNEiZquAxpsgQ4TneUvDU2sHmxDXXwF6Q6148ROIgL8pU4VptNtBe7wqGM4Yl2brUEonGcOqOW14r8FlTk9b5GfPfOD6m0fn/m1F+45xdcANQBpaVm6McM8GCmGldywlD9/D3ncy6MSBOpA3k4tFYaC+P8LaFaVfPqrQxCFgB2C+JYsiTb6k5w5h0/pf47WdLxHOYyqS4BU8B3SODI13sBlV9aEPKGWOXsOr/rMjGUTjhSbHagTTvdc3w3VY7hLh2iA+WeOdaT8Is+4LCWl8rZp04pGhdvHzoAYdMz09hZtQFxEl7IYLKyN4deDyz15Z4ZVbmvC08jagEilPCAnN2Qi/bspKy/CnH2NfyqR9wVoSdwgain8gCqTci0tYB//2Nh2bKo7vib80kMHsUR/2dhKoWlG/lWSpSSmY4=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>


