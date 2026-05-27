<?xml version="1.0" encoding="utf-8"?>

<grid table="COCP1" code="form, stt, ma_so" order="form, stt, ma_so" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo doanh thu, chi phí" e="Sales, Expenses Report"></title>
  <subTitle v="Mẫu báo cáo: %s." e="Report Form: %s."></subTitle>

  <fields>
    <field name="form" isPrimaryKey="true" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" width="60" align="right">
      <header v="Stt" e="Number"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="100">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="chi_tieu%l" width="300">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="cach_tinh" width="300">
      <header v="Công thức" e="Formula"></header>
    </field>
    <field name="tk" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="in_ck" width="60" align="right">
      <header v="In" e="Print"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="stt"/>
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
      <field name="cach_tinh"/>
      <field name="tk"/>
      <field name="in_ck"/>
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
      <![CDATA[<encrypted>hqQ0Zf8mOhRssSZs+3dV9JnfRIyO5f7rHyLSMU+VAF8FEz1uzfqTUSq7fG9fYLi3pqvq0yDx99pbHBHAReUW/L0TbbclQcFaBbtLiXr9zaGzinDvD3IQDQvVS8TDIWntYrBA4DH3z0gwawIKWFYA3Dnah8TbLEOeN4oCDiL/v+9zXuV3RjMQ18Oej32IWtVCi7vVk6Q1+pl4bNgkmM3kEaHbujLA3ElTAppH2ybh8OU4yWyhJen4RcEzIbDjfqUJtmvsT94ZgdupIhAojBMquVEESHwgI73ayGIYgP5CpkB64vFvDTikPFtftOB6CWm0/i1+HksADWX296eYh6b/QT/AyDXNTxr1Q4p/3s3BGg4=</encrypted>]]>
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
