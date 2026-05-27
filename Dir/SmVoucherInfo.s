<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>
<dir table="dmct" code="ma_ct" order="ma_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Khai báo các màn hình nhập chứng từ" e="Voucher Information"></title>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" disabled="true">
      <header v="Mã chứng từ" e="Voucher code"></header>
    </field>
    <field name="ten_ct" allowNulls="false">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>
    <field name="ten_ct2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_ct_me" categoryIndex="1">
      <header v="Chứng từ mẹ" e="Parent Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct_me%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct_me%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" type="Decimal" dataFormatString="###########0" categoryIndex="1">
      <header v="Số hiện tại" e="Current Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="trung_so" type="Decimal" external="true" defaultValue="'0'" allowContain="true" categoryIndex="1">
      <header v="Kiểm tra trùng số" e="Check Duplication"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0 - Không kiểm tra" e="0 - No"/>
        </item>
        <item value="1">
          <text v="1 - Theo ngày" e="1 - Daily"/>
        </item>
        <item value="2">
          <text v="2 - Theo tháng" e="2 - Monthly"/>
        </item>
        <item value="3">
          <text v="3 - Theo quý" e="3 - Quarterly"/>
        </item>
        <item value="4">
          <text v="4 - Theo năm" e="4 - Annually"/>
        </item>
        <item value="5">
          <text v="5 - Tất" e="5 - All"/>
        </item>
      </items>
      <clientScript><![CDATA[<encrypted>INbTunhNY4dPBKFPAJo94pCks+Zg3R49i41Ar5rZ8BI11tJUF6rYTblWhgp2T45FtASOe26bfuFAGg0iDYzJ5rWnDQ1WagArB/D2rhBjr/rTmrUQKl9UecKYuFzMX77WRc2NgW+7Lx6SFAbfQUVcM+5bVOqpIUdOqHFAnhp4Gpw=</encrypted>]]></clientScript>
    </field>
    <field name="cb_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="1">
      <header v="Chỉ cảnh báo" e="Warning only"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt" categoryIndex="1">
      <header v="Ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="m_ma_gd" categoryIndex="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = '{$%c[ma_ct]}'" information="ma_gd$dmmagd.ten_gd%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCC5XZ1IDPpaDqirJElpwGphj7k0IfLUu5dBXM9DEqppA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="m_loai_ct" categoryIndex="1">
      <header v="Loại chứng từ" e="Transaction Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai%l" key="ma_ct = '{$%c[ma_ct]}'" information="loai_ct$dmloaict.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="m_status" categoryIndex="1">
      <header v="Xử lý" e="Action"></header>
      <items style="AutoComplete" controller="Action" reference="action_name%l" key="ma_ct = '{$%c[ma_ct]}'" information="action_name$dmxlct.action_name%l"/>
    </field>
    <field name="action_name%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="m_ong_ba" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Sử dụng người giao dịch" e="Contact"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - None"></footer>
      <items style="Mask"/>
    </field>
    <field name="m_loc_nsd" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Lọc theo người sử dụng" e="User Filter"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="tieu_de_ct" categoryIndex="2">
      <header v="Tiêu đề" e="Title"></header>
    </field>
    <field name="tieu_de_ct2" categoryIndex="2">
      <header v="Tiêu đề khác" e="Other Title"></header>
    </field>
    <field name="so_lien" type="Decimal" dataFormatString="##0" categoryIndex="2">
      <header v="Số liên" e="Number of Copies"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ct_in" categoryIndex="2">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="stt_ct_nkc" type="Decimal" dataFormatString="##0" categoryIndex="2">
      <header v="Số thứ tự" e="Line Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="max_row" type="Decimal" dataFormatString="#0" align="right" categoryIndex="2">
      <header v="Số dòng" e="Rows Count"></header>
      <items style="Numeric"/>
    </field>

    <field name="post_vv" type="Boolean" disabled="true" categoryIndex="9">
      <header v="Dự án" e="Project"></header>
      <footer v="Tên trường" e="Field"/>
      <items style="Numeric"/>
    </field>
    <field name="post_sp" type="Boolean" categoryIndex="9">
      <header v="Sản phẩm" e="Product"></header>
      <footer v="Sử dụng" e="Use"/>
      <items style="Numeric"/>
    </field>
    <field name="post_bp" type="Boolean" categoryIndex="9">
      <header v="Phòng ban" e="Department"></header>
      <footer v="Nhóm khi lưu vào sổ cái" e="Group when Posting"/>
      <items style="Numeric"/>
    </field>
    <field name="post_lsx" type="Boolean" categoryIndex="9">
      <header v="Số lsx" e="MO Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="post_hd" type="Boolean" categoryIndex="9">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="Numeric"/>
    </field>
    <field name="post_ku" type="Boolean" categoryIndex="9">
      <header v="Khế ước" e="Loan Contract"></header>
      <items style="Numeric"/>
    </field>
    <field name="post_phi" type="Boolean" categoryIndex="9">
      <header v="Phí" e="Free"></header>
      <items style="Numeric"/>
    </field>

    <field name="use_ma_vv" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" disabled="true" categoryIndex="9">
      <header v="Vụ việc" e="Job"></header>
      <footer v="Tên trường" e="Field"/>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_sp" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Sản phẩm" e="Product"></header>
      <footer v="Sử dụng" e="Use"/>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_bp" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Bộ phận" e="Department"></header>
      <items style="Numeric"/>
    </field>
    <field name="use_so_lsx" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Số lsx" e="MO Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_hd" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_ku" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Khế ước" e="Loan Contract"></header>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_phi" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Phí" e="Free"></header>
      <items style="Numeric"/>
    </field>
    <field name="gd_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ct_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="xl_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
	  
	<field name="v_nbr_blank_yn" type="Boolean" categoryIndex="1">
	  <header v="Lưu trước khi xóa" e=""></header>
	  <items style="Numeric"/>
	</field>
	  
    <field name="voucher_yn" type="Boolean" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="xstt" width="0" hidden="true" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="332">
      <item value="120, 100, 100, 230, 0, 0"/>
      <item value="111111: [ma_ct].Label, [ma_ct], [voucher_yn], [gd_yn], [ct_yn], [xl_yn]"/>
      <item value="11001: [ten_ct].Label, [ten_ct], [xstt]"/>
      <item value="1100: [ten_ct2].Label, [ten_ct2]"/>

      <item value="1101000: [ma_ct_me].Label, [ma_ct_me], [ten_ct_me%l]"/>
      <item value="110--11: [so_ct].Label, [so_ct], [v_nbr_blank_yn], [v_nbr_blank_yn].Label"/>
      <item value="1100-11: [trung_so].Label, [trung_so], [cb_yn], [cb_yn].Label"/>
      <item value="1101000: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1101000: [m_ma_gd].Label, [m_ma_gd], [ten_gd%l]"/>
      <item value="1101000: [m_loai_ct].Label, [m_loai_ct], [ten_loai%l]"/>
      <item value="1101000: [m_status].Label, [m_status], [action_name%l]"/>
      <item value="1110000: [m_ong_ba].Label, [m_ong_ba], [m_ong_ba].Description"/>
      <item value="1110000: [m_loc_nsd].Label, [m_loc_nsd], [m_loc_nsd].Description"/>

      <item value="1100: [tieu_de_ct].Label, [tieu_de_ct]"/>
      <item value="1100: [tieu_de_ct2].Label, [tieu_de_ct2]"/>
      <item value="11: [ma_ct_in].Label, [ma_ct_in]"/>
      <item value="11: [so_lien].Label, [so_lien]"/>
      <item value="11: [stt_ct_nkc].Label, [stt_ct_nkc]"/>
      <item value="11: [max_row].Label, [max_row]"/>

      <item value="11010: [post_vv].Desciption, [post_sp].Desciption, [post_bp].Desciption"/>
      <item value="11-1: [post_vv].Label, [use_ma_vv], [post_vv]"/>
      <item value="11-1: [post_bp].Label, [use_ma_bp], [post_bp]"/>
      <item value="11-1: [post_lsx].Label, [use_so_lsx], [post_lsx]"/>
      <item value="11-1: [post_sp].Label, [use_ma_sp], [post_sp]"/>
      <item value="11-1: [post_hd].Label, [use_ma_hd], [post_hd]"/>
      <item value="11-1: [post_phi].Label, [use_ma_phi], [post_phi]"/>
      <item value="11-1: [post_ku].Label, [use_ma_ku], [post_ku]"/>
      <categories>
        <category index="1" columns="160, 30, 70, 100, 25, 25, 180, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 100, 100, 230">
          <header v="In chứng từ" e="Print"/>
        </category>
        <category index="9" columns="120, 25, 75, 25, 305">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7dDX1TUS6SjT6HFTfl+bMpELbSaQBR98F+O4dgSiJrKifj5I4boSTcDo83h2dBUhPkHlFKg3WSiwc9BvouqXJkM=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VOpfgOoiGWLcrOkxAyj9FfBr+8cqHYVJXxioTxaqynbLeMz7pApiGsvtxMe00SwfquRW3gkXbTEkeMc80SiZ4A=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>/+OLj6Ct1C31ua13q+3mMHQ3b/PixpJwU5Uaco94/V//hM5v6Mrus7BxAvbFlu9jyNXF+WoGwtC3o0VA/OVw+hxDQB3cbgo8X8UVcIHF8UvuI6m6sozXTXp/VykTE4F0yltl2YKJ9djrCBxqg42xroFZu7jZPZ1Ejnxc2wPNLGW4MQc+Pl2i/w0pIkF6AEVhMqFKUfHma8g8161r9lbWJpdWCbvAKiY9MJ95fKmyG6RlOcjK+YNXQapF7rAw05E1H0AAt2EJitssTMM7Ttjc3jMMK0tGBuybdqG1d8ETS/idnpSmvTXgrK1fZPXw7ichnKmMIlb1d09s//5nJl35bwH0DV0U53u0EvW64S0qZh2FifoDtVzmDvmRHSn/CQaCAjATETgewfWyW2NEMSnp1OksHRG7k6cyy7cN+U8bmJ7p1Vea7XLmGePLj1JJXbeA3ZkMYe7tthCB24RHAXd/H+zc0tWD4yXAuAsY+LdOqt8In4nGj8EciGT5OOkmRcgcIiTLvtfuOUO7nYjRxdUiHjliadB1R2OS/iU1y2yqjJb+aGfwyMw5q14pf4mCQy9iuoDncHzQWjdINLSiR5YUwR6FI4gT/zfIBK0rmeiH/ETvdFneLGPALcpjHXDaUIu8</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>raBRrqE2kjNyXM5SE6+9H3pYiM9MRKTlLgdoqp95CAPaM1pSZMYDXqz2+MFHIgelLi4xYijkSTebWYSlxRfmsXQ0FuEbedNKR1ovxCNZsXE/ukw/dalTh2oeqj7lqVzjVII9MKFWIjjU1O+8NwsOcWobAGrJi8H14HZ7CYbYSfe4XSNHDKoSr0g7mIld2/k/5MLZg2pj9pj3R1ov57EXSVb295y4doS/fWka3y6AMGvYD4VxACMERvsd3tGdBF4q/FgpnvmkSl+C/bYqgsPitt5Vb7uQBWFPVxbsYoKioantxDYH8svvSp+tlq0gw206Y5vAIENM95UJ61G+obtBtfriwwSwe4uILqvlx9uvqtby1MrAwqxugAtKBcrFQEIjmM+rmEBNq6NrkOIO+LToduoJnDbP/LvZd7dD7hFaLRm2tlVKLHguc6Yiod++RjopFSSWbqYC0CYYFMxqN+GHepEyz8IH+KF6Qmb1KF5N1C+2OJ4xQWY3GupjUUPIYXYwhoa3/ORo4ndBro3uAbPr8MChFwfZ/6lbxCQ7Stf7L/HC4S6o90lnYvjnTzttEnx0+8n4VbGgNOJnG+ynPg3B0yw2Z16oiTtFux/nFofiYPuSU90y7dmIdym14jS2FdDF</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>txVz+Tky68Gfh/tPSDaC/vIO/PghOySmxvUPmDSUK69hv4bKcqQyENINzEoTsWwINuoA9Fk1987iEQfqIJAOSe/xFe5RmDF0N4IyUtxmqdQ/VN8UAQwIHrpYgnNaArLZIolPUzVrj8o1YyPA4nLYEXOGjTDB29eaw9zl+V+FnDHQH5z+MgeIAa2pSm8bsdHf</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>DaV0lEYd+JnEI45X/rBWzkMTNDraZ8/iAKUrAy/KPHT2IK2pZHWBYU6158KVsPOLN7iP4oUsW8XzwNDell7fzHBcRdAxTuQhe43qK3k0tAc2alxui3yhkFiMxVzio2RGxsDYxgBsTOTZ/c1tsHuVsI/D0qtTkOjr1w6pvcqRJ3K3e0Y45aFFY9hiwk0qIheZm8wBWPeKZ+ajek38xW04Yz7cmkQTy5BIwucvSbZ++lCOCp7/syjuLxN+kl9rWeDwDRuVTlpmV0NlEuei6oX5vxIYTYw+T/03sp9qvV+0Y0kGOQbwAyj5Ff62TL3GPHQI6bJ2sXftt1pyioDqGJVUBwdvmiUWxYJFyo5U/UFi5xlv/7qTdn+yFgXgMcSCRIdxxAKj6SDZozQK/Yli/ptLMm5fWJw2pVVHhx/IVWodlpibgM/FpkbjpLSZQ6E2n3WFDHCHxuErPe0t5rDc4jw1hqsx5D2Wi/e7j/LkgU6jt9pUsE6Rwc7wqxbGtfEU5WGfLRcaQ9jhl3TnuVB45FODEV6POzPlGH1BZR5xmYjodUQDb5lLzAyzpDx2hgTm7R/MgXjoL2PqMk9e62QXAquF3xCJ/Uxdd/xoa9g+MHcN2elWK2ilDR/T6L/3AMEp9mlPhCrdyXWZiaak9yyjHGG9DNh77O3ICrClCp6cOpKZiWUM4A04PmCupTBW98Rwi396HhXdkdiJWt8jJyuv2z84aNnCEsVdRh2sj6OERk2jWA802KMS0AwrsBvm1cQf4b68Os3iFwlnMkmB9IJTVCmcm3gJ/blXfdGFAIR9XOC0tLTSlMXFtMZShoWa1c1zoFWKnFjj9Uxh/KiMNxKORfYKSPOza6hiI2dof/Wr72DKs8rFvpsEYAGtZsRJ61PFbjMPCJ5rwfxsUOZHKP+mzyugry3G8xFolU/DQqVanGyZZH8aCPWCX5BckPCC4F2Cp1T6PCxuO/D6xFmMDE4Vl12GUHSP2U4xdWuE14mv8IkU5eg=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Transaction">
      <text>
        <![CDATA[<encrypted>P2qu7DZx8/j7Cw8AgpdTzdj5icinvO8hMtsyFMM9eqxnhSKYae4lCFyI3MVDp8uk2lnj9iuKn1oZAtIHR6UNGvzl2iQnkPbTHSzwNnIpdbK/xLUQJsLoVdL8L9KIveeiw1Z6gqBqLrVNWeiN7lGUvxTlSPLXEX/gZnowq6Wdxln8Nf5bE/qf4ScFGH5BRKc3</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
