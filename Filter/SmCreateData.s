<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Tạo bộ số liệu mới" e="Create New Database"></title>
  <fields>
  <field name="kind" allowNulls="false" clientDefault="*">
      <header v="Bộ số liệu" e="Database"></header>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa45B616Vcmsn0TSZ5QZzNkVIKC+0KPLM6JGWb63Gy8Mdj</encrypted>]]></clientScript>
      <items style="DropDownList">
        <item value="1">
          <text v="Sao chép" e="Copy Databases"/>
        </item>
        <item value="2">
          <text v="Tạo mới" e="New Databases"/>
        </item>
      </items>
    </field>	
	
   	<field name="database_new" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bộ dữ liệu mới" e="New Database Code"></header>
      <footer v="&lt;span style='color:#c00;'&gt;(32 ký tự, đặt mã theo quy tắc: Tên không dấu _ Mã số thuế _ APP. Ví dụ: MAXV_1010101010_APP) &lt;/span&gt;" e="Mã bộ số liệu mới: &lt;span style='color:#c00;'&gt;Tên không dấu _ Mã số thuế _ APP &lt;/span&gt;"></footer>
	  <items style="Mask"/>
    </field>  
   	<field name="database_new_name" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Tên bộ dữ liệu mới" e="New Database Name"></header>
	  <footer v="&lt;span style='color:#c00;'&gt;(64 ký tự, Tên viết tắt. Ví dụ: 1010101010 - PHẦN MỀM MAXV) &lt;/span&gt;" e="Mã bộ số liệu mới: &lt;span style='color:#c00;'&gt;Tên không dấu _ Mã số thuế _ APP &lt;/span&gt;"></footer>
	  <items style="Mask"/>
    </field> 
	
    <field name="database_copy" allowNulls="false" clientDefault="">
      <header v="Mã bộ số liệu sao chép" e="Copy Databases Code"/>
      <items style="DropDownList" >
		<item value="">
			<text v="" e=""/>
		</item>
      </items>
	<clientScript>&OnSelectionOutline;</clientScript>
    </field> 
	
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 100, 100, 100, 180,0, 0"/>
	  <item value="11000: [kind].Label, [kind]"/>
	  <item value="11000: [database_new].Label, [database_new]"/>
	  <item value="-1000000-: [database_new].Description"/>
	  <item value="11000: [database_new_name].Label, [database_new_name]"/>
	  <item value="-1000000-: [database_new_name].Description"/>
	  <item value="11000: [database_copy].Label, [database_copy]"/>
    </view>
  </views>

  <commands>
  <command event="Showing">
	<text>
	<![CDATA[<encrypted>7ub7KwSo67eNhVJ0+Je2lsCQ4ysbhBveoq9X4dIUohe8V2EqDEpOMQM4ypP+etbtob5vGfxwd6Mj0icz619jtlymZULMyg+aKz+G12b0am/lu9D90Ivi7vH2Zc2MSQzqzqBwNe30N2Cn1kE4x/fRhEZdJtJ8DsxFOSSbhFMVEGt7KpB8ChV2MkkD65ezPQZ1x2ZKAwog19A5bZK1DhX3boZS+P4XilbekcyX/FzzS38OiTOWjWwDQRy1wM8LTuuMnqVcXRNbPOM2a2gYv3O4ljMlUPKcF7+ArsU7E1Y27g3paS6KlrFWuenpH35H4UTQqmB/zWBUW7t4/KOXzD/dJgd6TwFxXxIRAgoUGohq515QU6AJ5RZfyvJXkJ0BLBZd4Xpb6fGA0clf0hQ518REnABI1aETm4V8Xw4k7qr4AoMT/yEN1Q645ZqUuD4VBUxq</encrypted>]]>
			</text>
		</command>
   <command event="Inserting">
      <text>
        <![CDATA[<encrypted>jAhiEbOqHcJc9P5MWit6PvFfYW8cb06xthhSTc1/sv2gJneSRhqAemXWeiY/fCspqeRqlFa9I0tn2IHgEJf/19hzfJEHGldnmTHBlICsAxMbsLjjvtgmlL6D+lfXm7d8QqytWmZdOgHVZjI+0wBamX4vN6O47VHICs2QXp/+LsdAnt5dw0eUKrl1QsZp1/Iae5CHDjS20NkoqAvfJ7a05arLNSQHbJPHuuno9aBLYhjfoMFQd5Tgm/d2fB2F39CT4lBI8VDQzEsh1fZskG2lceM0Q8pZK2RZDfHylgYFOY8FD3Da1pxXMTev26NO5Z5tNDYh/V4lBejaK7qdxsf/RsBlfu5mlz2YzTohoukRpz+wAUAijWkttv/Hdz+KZwjEyj2Cv7pwINvJfPI/rer14Qf0spcwIvnuL3YpoQlhFz4EVT4BIA+WiQ/JhTTo9vj739hD7rlbJHsVr1rfS0h4u5MySQvPZEenNIIdMlMQLtSz/ntiwBZhEz1HlxhRU1eDiiVkWJF+M4MvauI6EVVvbCLIfUTRpfr9t0l7ISbDCgY=</encrypted>]]>
      </text>
    </command>
  
  </commands>
  <script>
    <text>
<![CDATA[<encrypted>w2qv8t4Fd3sM322QrDqeNI3Qu3BWDTUb7z/tBalHwHsY3pUqVxOzJf+pZpLVRfAW2LSJ2U7C3hp8Gk4ADHBkgQH0LFnVThmgq7HjhmJoqyjDRudvsTNG8RqzIMS2W/5K+Pvd65lEp/9yom5bC8PLnA7iw8l1Exx8xjX6c9Y90ULIZpsOBPiMkqjK8VYua5RlVa9uVAPTkT1Rsd42IrQtRn2m/TabKET6+lbE7viYqEx12o/FidARLFHEv3Vrzwov2HOJlOQb8e2Qyvb2tNxOY+E5QSKMNebCijslW4q7DX7mavYoEKGAFsj6B0mGgMkenn46K3uxhN6baw2PGSENp8q/LTwelhHZZgl8TP38ZqUu5uq2wb+o4cOUv7+IZVbOnAniFse7Z8trJsDTuFDLgQ==</encrypted>]]>
    </text>
  </script>

</dir>
