<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLTRANPRINTX">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Bút toán phân bổ tự động" e="Allocation Transaction Entry"/>
        </item>
        <item value="20">
          <text v="Bút toán kết chuyển tự động" e="Closing Transaction Entry"/>
        </item>
        <item value="30">
          <text v="Bút toán chênh lệch tỷ giá" e="Exchange Rate Transaction Entry"/>
        </item>
        <item value="40">
          <text v="Bút toán đảo chênh lệch tỷ giá" e="Reversing Entry of Exchange Rate Difference Entry"/>
        </item>
        <item value="50">
          <text v="Bút toán phân bổ khấu hao TSCĐ" e="Fixed Asset Depreciation Allocation Entry"/>
        </item>
        <item value="60">
          <text v="Bút toán phân bổ CCDC" e="Tool and Supply Allocation Entry"/>
        </item>
        <item value="70">
          <text v="Bút toán phiếu xuất chênh lệch giá vật tư" e="Auto Issuing Transaction for Cost Difference"/>
        </item>
        <item value="80">
          <text v="Bút toán phân bổ chi phí sản xuất chung" e="Production Overhead Allocation Transaction"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" check="status = '1'" key="1 = 1"/>
    </field>

    <field name="ext" readOnly="true" inactivate="true">
      <header v="" e=""></header>
    </field>

  </fields>

  <views>
    <view id="Dir" height="64">
      <item value="120, 30, 40, 30, 100, 100, 130, 0"/>
      <item value="111: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [form].Label, [form]"/>
      <item value="1100001: [mau_bc].Label, [mau_bc], [ext]"/>

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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7blXR6zS0mDSzFqFI4uaAE9PjMAg7+s6KS0OejUp9zN85FTBzqg85Av0SczrGGji+kf5f+rWbu6jDyKTxpHp6K+c3OSfevjlccTLWRvnoy6FZc1SCteu846gZpKCQkI/816k4OKvU1NbakKldXDd78xA2h2Aec8cjl76nlStQKjr</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>mE6hQ/s+CdHvqS1En7QoEZRl+7kt5G1fipqZhR/qyU0eZhn4AURoYjRmWkZFb/biYOzaA6zm1ZFf76Gm13LMZ8l1X1CvSaX9VjkdFGUR1CW49w9y55wOpm+Dso6sXeBCPz5HcuUiU5+RmemQ9l8tB35R+KBE7Y4AKMErOs40yMLYugrcWSKGzRXeU2WX1GML81xz0DfXjbKfzl9aGBtREX22Rz8i9Ipp3bWJl3tMEwlbQHJn0YWZyWCetfWHushFCZLttWeU2GgbqkaM0Fy9tlWp+I76c8OPG/a4RxPVmOZCwxdcjGPwCipsM0sFFMXChIuWls/EUoYSqiKrfE2gL2nVZ9CzSjwRU/zB06Yabi3Xh2Yb6o9WQXxJjkhtrIbzEEIap+jerdRKMfF08tH/5p7joZgG6HzD5s8WCyegXW6ezmhPHo67wE3tRD6pOf9DN+DtDew/w0mBI9HIu9VtEfrjS4dtOr0JbyLmPLGB2PwRSng6jsZn0RFbHI6ZmwZv4YkyirS/T6LriQtCx9UFP16B2uNvwqHxfClbq79TyS59Cg2CeDAoWiajMrwQbdYtDfzVyEi+TCPU/Vx3MrhhuZ66y6SDHntxBNZy1afBL1TSZTIPS79Z3uKmsvZfDIvaYkwCxdSYJNgscXVNz3biHkOFir9KI2YPPmfx+XuCruUiopYtEbb8PUncde2l1O/WznBJopqiYgleXEiCyUvZgkkjzTnsWwTgYsDZWGLMjU+RNWu61L/DrUkJXuepmj3kbxAp3AVq0f1e9P6VH22e7+MyHm/maSxvgLbH7Q46d8NjTu3g91QqKfJzfNVIuTQjuVT35cZ/tQH+SPCeiLFUdGNbS0d5IJscVcaiUOF+IGUa4vKZr1d1kphJzsqLomXdw7XBaNmybAwTWQUtG1jRv8fpu+2p3Uj3YI7FMd35ncr+4PrOw3FU+d9LXe+23Tr2nsuyQVoKw+gFHwOwhn5PDWprA2cXalasHfN3HMMrPB98ccbT/+zMR6DincCene9URUh1ynU7BZ4jp7yJR+MVaN6vjeeVUoY7EyAnFb8cKLk=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
