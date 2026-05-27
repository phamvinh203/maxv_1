<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
]>

<grid table="vdmpbky1" code="ma_bt, ky, nam" order="ma_dvcs, ma_bt, tk_no, tk_co" filter="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)))" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bút toán phân bổ định kỳ" e="Periodic Transaction"></title>
  <subTitle v="Kỳ %s1 năm %s2..." e="Period %s1 Year %s2..."></subTitle>

  <fields>
    <field name="stt_rec" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_bt" isPrimaryKey="true" readOnly="true" width="100" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glctpbky', Controller: 'PeriodicTransaction', Name: '[ma_bt]', Value: '[ma_bt] + this._queryFilterString + String.fromCharCode(253) + [ma_dvcs]'}, Script: 'beforeDrillDownWithCondition(this);'" allowFilter="true" allowSorting="true">
      <header v="Mã bút toán" e="Entry Code"></header>
    </field>
    <field name="ten_bt" width="300" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Tên bút toán" e="Entry Name"></header>
    </field>
    <field name="so_ct" width="100" dataFormatString="@upperCaseFormat" align="right" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Số chứng từ" e="Voucher Number"></header>
    </field>
    <field name="tk_no" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
    <field name="tien_pb_ky_nt" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" readOnly="true" allowSorting="true">
      <header v="Giá trị p.bổ kỳ nt" e="FC Allocation Value"></header>
    </field>
    <field name="tien_pb_ky" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" readOnly="true" allowSorting="true">
      <header v="Giá trị p.bổ kỳ" e="Allocation Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ky"/>
      <field name="nam"/>
      <field name="tag"/>
      <field name="ma_dvcs"/>
      <field name="ma_bt"/>
      <field name="ten_bt"/>
      <field name="so_ct"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
      <field name="tien_pb_ky_nt"/>
      <field name="tien_pb_ky"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksHDWCkHEtt+iNpyzh+LEKBKdSHSq2KxZh+kM06qUrCjf0VOcf5QGfSwrPTfWxXDu/kuR50cuFvCXRk3YVxuVus=</encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjsTx4aoKFC/0LzfM++Agf3Fpu6I4lq+rJk2T/lWJ989igNkrtMHCGTP0xuDcKUyOpwzZw+5PofBKEnfxnInsRo=</encrypted>]]>
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
      <![CDATA[<encrypted>aQNdFq+kVsXawVs4Ds0DMvdTTcZCzjGtKC0sITZsZySvYRptSB3UJ0nOpElTK2OfpBC7TQjgMTzqnTQL7+mp7ptsoOHv9MHdOBLQkYkHCPukw310j8pOeK2dzuiuW397dJFZXCwU2ACnwpdwVw6pXxJYfQ11nTm5hQXrgegXWxWX2RMrEhwgltGpPYEdJjqc6CqjTaServk0zl1F6EStrCmxiJxvuDQJuq1Q3ec6go7baAY3z2hvg6OFdYvx8cmkYsacRYsGy1OfNA1amAhCN98xfPP7WC/Esdrj3XvyPyWEqRGER/2Xtkpo9RilN/2PFhYEyIMBpXWMwzTkRjwfla1btUl/1rhdRX8peXsgJmcQRO8CS8fLC3GYv6a7YxurRqYMMl4gM7Hduk3KfZQD/RMYMt9099sx7LVQ/R4AXlPJTXmClbBOydYs+8mGDCggzWd42sFMxej5vW0Yty/1Yxc7LZZowWufBviF7cnAblR2mm9lOXFgJvxyc4YwOXs+GQdPQ9ZBr3d3K+zWnO0Cg48VvpfIvgIXlhlGUCFSTc7tv2G9hJO+hwdBWPJ/VcVkPuq0RIgSTw50mChmnoxOCACf5+5H5LjPYJLVrWg3GFwPrUiFEgYwRYxep7RFw24elMmMAFcMJdCqp9M3Hm+o0aGHkECTM65UlWz2WXPtLsqxL/ocd9pQ/c3k8lgbQY/dnkgvn/Bcm1cTFU+LU/5dCw6sQ53UPsp8Nm9R49hLtILPpbKE6zn1oSF74k36TPFyBYJ88M8i217KznSXpcY1B0WWZhluqVG2z67yK4n6xHdl7ZZfRc8pB5ACM5j/9/uLQqoZ+7ZKEy2x2KM0WncT7RO5+2G+1jkH8nePWCIp2GgaGgj6FhwVT2sO6CtN/YWXJmlaKLTfgZ81tAXZ9/3zbarDGOn+zVAGDBxwWG/1EKW8/o2abBgrzBSayRNQLBYl58QoEl7ij4nyV0Yz8Xg+02Zj0OzyyOQZGfqI42RNnjVV+cPGWbTrOESAOjk7uodpJQWbCboFdMvPdffRhzkY3xfl7PFYr0ldU3NWnF44Fth/LQLFwFK7zRbk8jijwdE8NHrMPJY0rIJTJIz2yxx+MEG9xsMBWAopLmHE8ym5OaTat+xylBeFGc/f0LWww4YBGvWRvUUx9kzhXdDYlqmwk3WBTizlojrYUluN3e/M2KbhrnSls3rm/Ih+n8rHTnR7xE3YzOONFw4nkVl6PB8vMQMiFpDfAIq4Y7ZzkZIOQ35ioGBNK2tKv5NzpGR0qBA8x2OCOBKPjbl3beykSuu020sz8VOEZa94YXRXzmwDpPNp2owZeZMyq20VIcOtWeszSYdnpOgGEETA6bn2ohJPcoD+NbUc6sgiGhSvl5TzpB45+Kias+MGsoy1nL2QnwUOwxEsTm0NJrIPx5X/PJiSTjABqmBmg8FuSILelnw7rOEr6wJNAsSPhbYtTrfrNaXECaFrzcVZ2PI0LsBLqgywMPN+SDPQyzPnW9eNuyl12+Z3E6U2ALH9VwZvbVc6jsg6u4D731gwGZh2S3/D38eHMBC51X2SElHjeIaVwuuFEkGxEGWCR6GaT/fPulYND/IoCAu3YDMGKOXkpC3mTmpt6Ml/V0FyHwxtm63JIG66TwRU5nvY8wOZEz/VDUt3fTQBh+VwJu5OseYzaZL/hKPeyiFmcKr8LbzltjuzkyfZi+IWkZsH9CLqbNwFyBYd7T4Oa1A/smS/y+DM5EO4MZmIX2KXujbFuOEddBvY9DjVO2MO3+HdSpVilJ8cElt78RTPNPynZw5uTFGPzaFYVC4475Fh06VnxMFfSd73ONOQo9vPB1hM0ZiJW+aS6yMQFkKLydKnB0EZS7ARHQ6MjThbAr5X4IET8DT2hmYkmOh4bYDLSg/A4gqN80WziX3pfD9SBbFvbjq1qw0ZrzdmLyDR0sP8x2lMIn3UTZ9K8rS4vu3AjfGyRVQi+u2WFKlRaWgB</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Create">
      <text>
        <![CDATA[<encrypted>1/ovCnbDxv0xZHPo9qxljiaTcev4PvdsPR2cmYC3xHlLVLzHRqjXUEjThhlPPUFuFD+Wr4Ox+koxCAalEcoCebSAVkVpPMgPyI+FNYdyXnVMKcDlBa8ZGTQn03NGQwQHgnlsXzOn5hxj+/hQQfkJA7Gb/b7ZRuTY6dqnEbwSs7loXp/ffcctBM1nCkgTb7mvGDkuJbPaGNyxfd2/BOxZZKdip5k3eqIg/7MZa27LpmHKnpU8MnevVogtQZzQiZ3tPbL4tlB5Z2CeoIVbvM9n/A==</encrypted>]]>
      </text>
    </action>

    <action id="DeleteAlloc">
      <text>
        <![CDATA[<encrypted>4s1gmH/tqqYIWChLl4xIXHTTNdvCv+HRIdLyBENBBzLh4TOqt3bbxfBAWWIsGdGtH7x6IOFpkcEerh3ElpezOjoSOek7MBodZNisyQw8Uuq8o/zFFnEI17D6xjKhsR9K6wJyA+HCj1ZSEbqABtkzXp1SvmNwFrSkZcoJk9KaW5HWq79uU1m/pac9JceWi2+esE4yO2Voxx7meoEGLC3/K6E3cz44vbjaRitMIjDezF7Oi4yr1mRtjKixBnAK2WmG</encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38Flktlvv/hBphTYlxk1PoS6qFFGHbHdvzlf+PUai1eINKPW14rN3yApxaw14jUx4wAGMcI02+w4UoOQXTsdhhB5iCHjYNSi007lR8tsYx7pqn6HMQifYM6SsPtkuXDPzsLTqowjzuk+wZEtQMJAnR9YxjKgrbAVo1lPmwOlGKam4Ly</encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Cập nhật số chứng từ " e="Toolbar.Edit"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Create">
      <title v="Tạo bút toán phân bổ" e="Create Periodic Transaction"></title>
    </button>
    <button command="DeleteAlloc">
      <title v="Xóa bút toán phân bổ" e="Delete Periodic Transaction"></title>
    </button>

    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
