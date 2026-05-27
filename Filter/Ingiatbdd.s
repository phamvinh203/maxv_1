<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Tính giá trung bình di động theo ngày" e="Calculate Daily Average Cost"></title>
  <fields>
    <field name="ky1" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Từ kỳ" e="From Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Đến kỳ" e="To Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh" defaultValue="''">
      <header v="Nhóm kho" e="Site Group"></header>
      <items style="AutoComplete" controller="SiteGroup" reference="ten_nh%l" key="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)) and status = '1'" check="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1))" information="ma_nh$dmnhkho.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1" information="ma_loai_vt$dmloaivt.ten_loai_vt%l"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1">
      <header v="Nhóm hàng hóa 1" e="Item Group 1"></header>
      <footer v="Nhóm hàng hóa" e="Item Group"></footer>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2">
      <header v="Nhóm vật tư 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3">
      <header v="Nhóm vật tư 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="tao_px" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Phiếu xuất chênh lệch" e="Create Issue"></header>
      <footer v="0 - Không tạo, 1 - Tạo khi không còn tồn kho" e="0 - None, 1 - When No Inventory"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_cl" allowNulls="false">
      <header v="Tài khoản chênh lệch" e="Difference Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cl%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_cl%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="kieu_cn" allowNulls="false" clientDefault="1">
      <header v="Kiểu cập nhật" e="Update Types"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Tính giá rồi cập nhật vào thẻ kho" e="Calculate and Update Stock Card"/>
        </item>
        <item value="1">
          <text v="Tính giá rồi cập nhật vào thẻ kho, sổ cái" e="Calculate, Update Stock Card and GL"/>
        </item>
        <item value="2">
          <text v="Cập nhật giá đã tính vào sổ cái" e="Post to GL"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="130, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11011: [nh_vt1].Description, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="111000: [tao_px].Label, [tao_px], [tao_px].Description"/>
      <item value="110100: [tk_cl].Label, [tk_cl], [ten_tk_cl%l]"/>
      <item value="11000: [kieu_cn].Label, [kieu_cn]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>pqaRFyW+JVmz6WxJfMYxF8vI7J1rokljDK6OyhNbhURdWTr0tp8ZNDHcEdPbA2Gbhdf2M2DBfpNxLuwdP/5vNV63PQl8HDMfl/3WBSvGYDahFDlqmkhlHkRLFZ0MqN9df0nhqLBCvlGByfJw2N1szgXCSp1p4AndPkQ3O7G1EQO0a5z5UoPVWlcN3waSWk2e2mNjyXy7IOKZUiSwKyeXpmB9ois0njLTcpbgUjl54lVcrRO562bxjVfN9EvMhOaKyUcMtm6XBJFm0BV4sHcBko4dsJCHBuY3snMmUzIx4tl1htMp+B9VYDTxx4QZHr3XLYVX0blL0s9760hTYPPyNauwACXf8psEtM4dr0Deq4+XXO9gaRkw8tZBib/M78/2</encrypted>]]>
      </text>
    </command>

    &XMLCheckProcess;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>9J8pKNgcIhmGd89ffpOcnu/VKBq/C/Yw16I8i8uWJcajEg5KeaxLoxNCmtzRTMp0UTh9cPVepV6qaj8eTGYawAbYqFeh/vrOCSedZWA62nh8PwQHX7RLB5ZpXj5H9QOA7IvTFlUQ30g1XvqurUuyvCufsDmcpuMugUAGuTY4xFvVVEBNC5iQpm1cq+XqU+mQxYFvIWI+pUuKvbncYjhGBckzr9JZZBpBhBG/x7HuEf1PV4Gz3zCUE1d0X8OW344htCwaYTBRvTt4N5G2y8Tsx8+/z5RNsMNycczbeZN6MPNT1fSfmKEaJj/Dtk5XGRdYn1NyIJ6mGbD26G3NM53ck30s9MxMcjVICXqW1qzsB+N7GgqOxuWy9Jh7CyuLEzlCdfDmvoD+vuNOgNA0ReMOilUeFRaHCiFREMMTjIh77VsvWo4JS3iJM/skEHg4tTN2JQ8yXlVkVmiAaN6/oid3xdWXRr7+SNBaNqv/o5uBc7Cycm+ZefwwxnWQSFPnYtnqJe1ei0+yaZ2iQsK0p/nsao0tg3x8XPCAKEMpHWMLFL/LQgDkTW0BsY+f/IKGoibfRcoD0cyWnRnlnZK1EE2beo15M02McuWyAUdJkDcrFJAz31bo/qeI9KPkUKI0Hm3i8zAvyEswjpmovdH6RJRBw6OUBrd7ESsW3Nef8J30Uhw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>WcaeWCvOJXfl3EkfIjRwm7/+qiH/Xc+O5zKX728dxDqs9JBRZkXvK7xNsg54ljEbBP5lbgKVyr93+Ca5wkSTaxQ3CLJMk0DZl2yGZgnSzqa/EtNlX+hYoVqKaGK3PnxL8txA0AC8owhwvg93PxVdqrYu43Z+S6iiwuCM85wmCA0g1xdy7EjNo9Lk2HAYaA4S7YqtQ0wT5j1bDGsGAvFCH8SeTurOXsmXJYvHuL/NC0SsSGTb1meSKnncZWdyY2ZeJ9R17zYCrrNb/MsqDd4guNMC/O/ijBPbFP6Z+R3+5sv2WTvYlqXVrKdIUKL+9B6j0+9rT5DAQrYpGT7TseRf9XcVMzD+a9YiQXwkMGU1siQA69ggaOsnXXwTQWbO5xfu</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
