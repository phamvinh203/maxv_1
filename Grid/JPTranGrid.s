<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY XMLGridVoucherDetailLoading SYSTEM "..\Include\XML\GridVoucherDetailLoading.xml">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">
  <!ENTITY Identity "VoucherGrid">
]>

<grid table="" code="" order="stt_rec, stt_rec0" type="Detail" freezeColumns="3" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="so_ct" width="80" allowSorting="true">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    
    <field name="tk" width="100" allowSorting="true" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" width="250" allowSorting="true" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" width="100">
      <header v="Ps nợ" e="Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" width="100">
      <header v="Ps có" e="Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="nh_dk" width="80" allowSorting="true">
      <header v="Nhóm đk" e="Group"></header>
    </field>

    <field name="dien_giai" width="300" allowSorting="true" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>   

	<field name="ma_vv" width="100" allowSorting="true" aliasName="a">
      <header v="Dự án" e="Project"></header>
    </field>
	<field name="ma_bp" width="100" allowSorting="true" aliasName="a">
      <header v="Phòng ban" e="Department"></header>
    </field>
	<field name="ma_hd" width="100" allowSorting="true" aliasName="a">
      <header v="Hợp đồng" e="Contract"></header>
    </field>
	
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="stt_rec" e="stt_rec"></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="stt_rec0" e="stt_rec0"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="so_ct"/>
      <field name="tk"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="nh_dk"/>
      <field name="dien_giai"/>
	  <field name="ma_vv"/>
	  <field name="ma_bp"/>
	  <field name="ma_hd"/>

      <field name="stt_rec"/>            
      <field name="stt_rec0"/>      
    </view>
  </views>

  <commands>
    
  <command event="Loading">
   <text>
  <![CDATA[<encrypted>NvOY7ITRQY0SBizfS6nQmT0PaidPYFCyLRWQUdqUUbKh2TggTeQEKZOk16QKsb6x</encrypted>]]>&Identity;<![CDATA[<encrypted>DPLpk9NtejFvjj/UDiVHgrHbF9NV1quYsMlDM77J7WKQbW93YqdDzDQ0cUAp36cA</encrypted>]]>
   </text>
  </command>
  <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kr5KvfAmVSMBJKamQPxJIg00t8QK7uOVnLZZePSQeGmm</encrypted>]]>&Identity;<![CDATA[<encrypted>DPLpk9NtejFvjj/UDiVHgrHbF9NV1quYsMlDM77J7WI6n6H56/e+Hu5goFHUufjBGhiz8PXEXe4MU6Hh08LI6Q==</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kvL18DQRiJKAhiardMgqWqF/Qbuy0gIVQltexh6rMkmM</encrypted>]]>&Identity;<![CDATA[<encrypted>DPLpk9NtejFvjj/UDiVHgrHbF9NV1quYsMlDM77J7WI6n6H56/e+Hu5goFHUufjBGhiz8PXEXe4MU6Hh08LI6Q==</encrypted>]]>
      </text>
    </command>
  </commands>
  
  <queries>
    &XMLGridVoucherDetailLoading;
    <query event="Finding">
      <text>
        <![CDATA[<encrypted>nOKcFkfb84609DLsiIDPmyl11nVBz6YCQ04bNHY7r/OKa5WX8SXJtnvYr3/XHFBpHUDB5EhznbhtsPZ0Dt2j8U40muAByjl9Y/edX0JtnJZOa4S9LieArkYR3l6HVbJZUVcNKj+ShJFz+5ZaX5s+3XOGmewp9C8hb6XARGd+R9OWk5i30IfZVlgbmOUTO11s</encrypted>]]>
      </text>
    </query>
  </queries>
  <script>
    <text>
    &ScriptFlowGridFunction;
      <![CDATA[<encrypted>xgf127njGGiCYA6FkdYHUlMsti9bogWeATJbhoMEgLB51LYs8h2xwCOYvvev07ti</encrypted>]]>&Identity;<![CDATA[<encrypted>njLNMJlwK3YkXhxl7xQW+yjRGynam+/RADJA/fQcGjK9GEU30Bia3rzjIkBl6468V6N0i/Dm0YRtAfiGbB7vBA==</encrypted>]]>&Identity;<![CDATA[<encrypted>iUpGJvTqK0VBVl91K1LHNGX7zybfcd+h2YnFG4HZPvly8bEcg/TeiIrYqxvmqnM9mTMLf3gwESUTTcR8tIxCGEC0qemD8bfBHbv+W99lVlk=</encrypted>]]>&Identity;<![CDATA[<encrypted>tR3RGYGJzyQQqVRHGjHdsPyXo0cEA8IgDQzoTRoz+iI0ZrYzaC0AnpFLlGevgqhQaLh4hrwEmM++mlFIDQJ8dA==</encrypted>]]>&Identity;<![CDATA[<encrypted>njLNMJlwK3YkXhxl7xQW+7lEWq7VwWcIGcoenfeTi6PJ82uqSryperHoT+7wYumFOjEVvafQsu6O+KSmt4UTrA==</encrypted>]]>&Identity;<![CDATA[<encrypted>iUpGJvTqK0VBVl91K1LHNJzLG+CARjxAj/iXlcg5eOOEMgQyNwqYjQNVPZEMOt68C7ZrqA6qwln8eLe5BOXu+pA1crukgynDWgSw+Q5LkBUB/O9bDUT0AVR8gJ8XtkA3</encrypted>]]>&Identity;<![CDATA[<encrypted>tR3RGYGJzyQQqVRHGjHdsHDPY/8Qumf42J69EN9R4HZhDhjbE6h74rTnm/8VS25UrFQ62gemCNlzQAWnLw72kTUhcDN7G9PMu6snbVqXlhI=</encrypted>]]>&Identity;<![CDATA[<encrypted>njLNMJlwK3YkXhxl7xQW+4UvW4kilSO9H4QBl2M/n5mTeu6nup6E/hdg11iKkcHI</encrypted>]]>&Identity;<![CDATA[<encrypted>r2ZcJ4sumt8BDHfd+YPMdvX3J73MEL3HFnZOnxIyK+hueVY2+9vTM0GKXfy/9jx+H7nTYmME9MfQV8LIreuVK7Ur2kKG5uTlqZ6agOY36mR1ulVC7t2aOJP+icUJzU+T808oIY42olf2v+D2t3SlqRt+ftcPBaTIBPxRaJ/jL0hS2gPoXyGsJ+8RVvqaSlpb8U7n3X4b2Ffu97Tx3cyw0apgVpS1hWXqyqIeLi1fUNVszx/0Zho5V7NC+6t5OHlO</encrypted>]]>&Identity;<![CDATA[<encrypted>pGmsKlKGWhNAWDhxanwo6EUfV4mrrVrWzUGrJzbEXy302FZWItUdwDFvrrs3LgEpGuVUQGdShA2udXPScQVFgRLuzp3iWin8qCE2OBDz9x7WqQ4Uv00zt5Su6Bh3Gxlb/ZTC8PFNN0uUHfLK7PiVC1uftu/yTjzeJ+tHabMD08/YtBnh2ov6hWc91oVD6bsAlBsMg9x/m53yBO0yE7yS7WnG3RrZCF4U99WiYKRZKTk=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ProcessConvert">
      <text>
        <![CDATA[<encrypted>u1Sp1XFGPGILHX1z6aEgPe5ow/RI2LjNcBoREjlmFvU=</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>AZ1aFy+sKNhqG5q6KfUKWBfUo6MW0wR7wRvoUywtBDw=</encrypted>]]>
    </text>
  </css>


  <toolbar>
    <button command="Refresh">
      <title v="Làm tươi" e="Refresh"></title>
    </button>
  </toolbar>
 
</grid>
