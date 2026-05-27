<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
]>
<grid table="v20GLTC5" code="form, stt, ma_so" order="form, stt, ma_so" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo lưu chuyển tiền tệ theo phương pháp trực tiếp" e="Cash Flow under the Direct Method"></title>
  <subTitle v="Mẫu báo cáo: %s." e="Report Form: %s"></subTitle>

  <fields>
    <field name="form" isPrimaryKey="true" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" width="80" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="100">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="chi_tieu%l" width="300" dataFormatString="X">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="cach_tinh" width="300" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
    </field>
    <field name="tk_no" width="150" dataFormatString="X">
      <header v="Tài khoản nợ" e="Debit Acct."></header>
    </field>
    <field name="tk_co" width="150" dataFormatString="X">
      <header v="Tài khoản có" e="Credit Acct."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="stt"/>
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
      <field name="cach_tinh"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksHDWCkHEtt+iNpyzh+LEKBKdSHSq2KxZh+kM06qUrCjf0VOcf5QGfSwrPTfWxXDu/kuR50cuFvCXRk3YVxuVus=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ku0s+MPpSw+4BviHGbpGdzmfyHR4o7kMFkgcV8IF788NeGSFsV3oPRikiY+QT/tRUqEgJ7LJBBOv5piVkre9bso=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hqQ0Zf8mOhRssSZs+3dV9CzKCZOx/7yOwHFN8zhpRbrHbt1lxHBYV7nPD5d29fhTEE4WV53yTQ7Fk43R6YdyMbp4SHRbE+4+ZEfcCzUC+wOuuDGk5RNIYyM1t7qJnI2GrXM8IgzFfUvfR4/sopz0JgdBryxXCf2cmDyVRFW+b1QEBHCDs22pxZxeZPJcwWNRg+beImGKZoI99LirPpzEa159EMVPvR7SUfsDPSYWrStaHpCnk+R3IsUdIoYFWEEvhYBTK1k3zZByTAkhfK7AYLu6v457ICOjTz2ZQSlCRLLZySAApQ+J3Y3g7nhgRCN+ONc2X3zBV6qz6zv+ezQgyMGcZbcOamPFbnfU/zaZje8=</encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
