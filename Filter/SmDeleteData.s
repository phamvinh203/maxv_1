<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Xóa bộ số liệu" e="Delete Database"></title>
  <fields>	
    <field name="database_delete" allowNulls="false" clientDefault="">
      <header v="Xóa bộ số liệu" e="Delete Databases"/>
      <items style="DropDownList" >
		<item value="">
			<text v="" e=""/>
		</item>
      </items>
	<clientScript>&OnSelectionOutline;</clientScript>
	      <footer v="&lt;span style='color:#c00;'&gt;(Kiểm tra và thực hiện Backup số liệu trước khi thực hiện xóa) &lt;/span&gt;" e="&lt;span style='color:#c00;'&gt;(Check and Backup before delete) &lt;/span&gt;"></footer>
    </field> 
	
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 100, 100, 100, 180,0, 0"/>
	  <item value="11000: [database_delete].Label, [database_delete]"/>
	  <item value="-1000000-: [database_delete].Description"/>
    </view>
  </views>

  <commands>
  <command event="Showing">
	<text>
	<![CDATA[<encrypted>mfvbJ0HxfmAHimSSXhcrpjKlHWJtQTEBntJ9gUgKurlouFemIxQUJJNwd99jjOprDG8+03Oz11M9QB/ErzPJHAAeyJwvMstg/hILFBeLpEjyc2SyFIBXALzB9RxiB+vfYt4qeGGG5GWtEjAgTTh25f3GrnKfGxaJTvShBMVZ9n9y2MvWTge9CExemCIsVQR1aAmEPAv21MqsVgq7FrEVPL+qWEt7uifKMRYVvxIzkp1jmacNCZdOHtXYEFBX3oCidAvoR8rjdpQDktHoNGR/y4Ub6e1yfjw2yDfDcPfslwTjakVOI6N5ejLUgPVGJf2dTdl6e6xdL62a+ccSHwy3z2B7yCYCC34NAE4fU55gWU4=</encrypted>]]>
			</text>
		</command>
   <command event="Inserting">
      <text>
        <![CDATA[<encrypted>cKv/Gt1Ov6deijY6wzXQBBb8KN26+df3WEQU95GdX0nc2wytltQ4BIbW2AmTONDzKxL5VIDNk9FtLdOtDvmMOGzQasOBi3AKj1q7ozKjMvKXCKAdGw6GwPK+NjLnNhfStrOBIItqAocCzfUuFZX9zOrveDmFYkDGUGJvfHEqXObO1luRWtInRQecH/fzas9AF/ZEF9EHQQaHmEZFqhRbfVTe6yFJDhMTZx7DdYpwF2srQ6DbMrh+3OK/76C3TPHCwGQN2yA+kuiuqYaASklqPa2JS3fQahK1hDLIyBcXplHYUOwp8yD3tNtewhn6QMubmFerKqepDFE/S1gILN0/SkE/wEG53YZeNrYZ4Lx24nnLASo+yOaYCJ18FPfHQNnlR/+w02rdQeTJl3CNXTIKKqEep02uCHcV+M/ceEuWSeb/Jf1V+4tY5+Mg1DHYrnab72RlxwmAMprAv3QaKcZpeQ5DaLEhN6NjEil75T0AuIFk7RbPXxGBaU5lMYImyH+Gq+xhnmh/ROpGfwpqsK7diigCKnsIr4dp9U9Lnuq8uXl1Pu3jXd1AqKsX1qVWx5lmb2LQXogdzSkEIztRxdXIwlYH3XjBtkgyRYcf9HegWBIpZznJemMMhtFtXgEBJpYjI/SW3lgv9ysrEVjYBjZTKKaMnbGIU4K1OWsszjlAHF3HwFTnyQ8HeBfrQWNT4BkgBZ1j6roD1Yd35we9SVhlxlKhGh5sYEDwzMFKcFXnGgHriiPlL8sDnZZ8FVlGueFXYYkidQKKPI3tWHgyLTPB8fsinQXijsLT3QuKTo+873EtSg4VZJoNALTlrKc6BKp77TCuJlAxZrBrGIizfJT9spS+8kKnzHK1CP4wYiSrEjoLZMs2liKsN4nSWrGoBGjkRFEytUQvh7wP8UuIaCcR5A==</encrypted>]]>
      </text>
    </command>
  
  </commands>
  <script>
    <text>
<![CDATA[<encrypted>O84TLPcl2BE6nAYmRdCOeR1Jx60NmTyGodyJCUxWJHEIKSySpAlW28vehnYF0zlycHuXg092fHLn8qlOpnVB/vb+oLdsZ4NqlFn8HkpPCLBTFibiSRzJMqHpjuI+mfDY/R/FsH32STlM2Um0JdkWYdA2znNqEeFYO2bhB+W/0uvi95vYzHfTMizX4F/pBVVwb9evsUqKWGyWZYTKpXW4VN/l4FRs4MhH/IgCA7rMp0TnnV7D63FpFkWzy23rQcsf0HQB62ri9O+PYuldZaQi1A==</encrypted>]]>
    </text>
  </script>

</dir>
