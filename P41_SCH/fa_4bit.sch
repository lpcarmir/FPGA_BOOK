<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <attr value="Always|BaseIndex" name="RenameBusIO" />
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_17" />
        <signal name="a(0)" />
        <signal name="a(1)" />
        <signal name="a(2)" />
        <signal name="a(3)" />
        <signal name="C" />
        <signal name="b(3)" />
        <signal name="b(2)" />
        <signal name="b(1)" />
        <signal name="b(0)" />
        <signal name="s(0:3)" />
        <signal name="s(0)" />
        <signal name="s(3)" />
        <signal name="s(1)" />
        <signal name="s(2)" />
        <signal name="b(0:3)" />
        <signal name="a(0:3)" />
        <port polarity="Output" name="C" />
        <port polarity="Output" name="s(0:3)" />
        <port polarity="Input" name="b(0:3)" />
        <port polarity="Input" name="a(0:3)" />
        <blockdef name="full_adder">
            <timestamp>2024-12-1T4:59:28</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="full_adder" name="u1">
            <blockpin signalname="a(0)" name="ai" />
            <blockpin signalname="b(0)" name="bi" />
            <blockpin signalname="XLXN_17" name="ci" />
            <blockpin signalname="XLXN_1" name="co" />
            <blockpin signalname="s(0)" name="so" />
        </block>
        <block symbolname="full_adder" name="u2">
            <blockpin signalname="a(1)" name="ai" />
            <blockpin signalname="b(1)" name="bi" />
            <blockpin signalname="XLXN_1" name="ci" />
            <blockpin signalname="XLXN_2" name="co" />
            <blockpin signalname="s(1)" name="so" />
        </block>
        <block symbolname="full_adder" name="u3">
            <blockpin signalname="a(2)" name="ai" />
            <blockpin signalname="b(2)" name="bi" />
            <blockpin signalname="XLXN_2" name="ci" />
            <blockpin signalname="XLXN_3" name="co" />
            <blockpin signalname="s(2)" name="so" />
        </block>
        <block symbolname="full_adder" name="u4">
            <blockpin signalname="a(3)" name="ai" />
            <blockpin signalname="b(3)" name="bi" />
            <blockpin signalname="XLXN_3" name="ci" />
            <blockpin signalname="C" name="co" />
            <blockpin signalname="s(3)" name="so" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="XLXN_17" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="544" y="1152" name="u3" orien="R0">
        </instance>
        <instance x="544" y="576" name="u1" orien="R0">
        </instance>
        <instance x="544" y="864" name="u2" orien="R0">
        </instance>
        <instance x="544" y="1456" name="u4" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="432" y1="608" y2="832" x1="432" />
            <wire x2="544" y1="832" y2="832" x1="432" />
            <wire x2="1008" y1="608" y2="608" x1="432" />
            <wire x2="1008" y1="416" y2="416" x1="928" />
            <wire x2="1008" y1="416" y2="608" x1="1008" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="432" y1="896" y2="1120" x1="432" />
            <wire x2="544" y1="1120" y2="1120" x1="432" />
            <wire x2="1008" y1="896" y2="896" x1="432" />
            <wire x2="1008" y1="704" y2="704" x1="928" />
            <wire x2="1008" y1="704" y2="896" x1="1008" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="432" y1="1184" y2="1424" x1="432" />
            <wire x2="544" y1="1424" y2="1424" x1="432" />
            <wire x2="1008" y1="1184" y2="1184" x1="432" />
            <wire x2="1008" y1="992" y2="992" x1="928" />
            <wire x2="1008" y1="992" y2="1184" x1="1008" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="368" y1="528" y2="544" x1="368" />
            <wire x2="528" y1="528" y2="528" x1="368" />
            <wire x2="528" y1="528" y2="544" x1="528" />
            <wire x2="544" y1="544" y2="544" x1="528" />
        </branch>
        <instance x="304" y="672" name="XLXI_5" orien="R0" />
        <branch name="a(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="416" type="branch" />
            <wire x2="464" y1="416" y2="416" x1="432" />
            <wire x2="544" y1="416" y2="416" x1="464" />
        </branch>
        <branch name="a(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="704" type="branch" />
            <wire x2="464" y1="704" y2="704" x1="400" />
            <wire x2="544" y1="704" y2="704" x1="464" />
        </branch>
        <branch name="a(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="992" type="branch" />
            <wire x2="464" y1="992" y2="992" x1="384" />
            <wire x2="544" y1="992" y2="992" x1="464" />
        </branch>
        <branch name="a(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="1296" type="branch" />
            <wire x2="464" y1="1296" y2="1296" x1="400" />
            <wire x2="544" y1="1296" y2="1296" x1="464" />
        </branch>
        <branch name="b(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="480" type="branch" />
            <wire x2="464" y1="480" y2="480" x1="432" />
            <wire x2="544" y1="480" y2="480" x1="464" />
        </branch>
        <branch name="b(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="448" y="768" type="branch" />
            <wire x2="448" y1="768" y2="768" x1="400" />
            <wire x2="544" y1="768" y2="768" x1="448" />
        </branch>
        <branch name="b(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="448" y="1056" type="branch" />
            <wire x2="448" y1="1056" y2="1056" x1="384" />
            <wire x2="544" y1="1056" y2="1056" x1="448" />
        </branch>
        <branch name="s(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="544" type="branch" />
            <wire x2="1040" y1="544" y2="544" x1="928" />
            <wire x2="1056" y1="544" y2="544" x1="1040" />
        </branch>
        <branch name="s(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="832" type="branch" />
            <wire x2="1024" y1="832" y2="832" x1="928" />
            <wire x2="1056" y1="832" y2="832" x1="1024" />
        </branch>
        <branch name="s(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="1120" type="branch" />
            <wire x2="1040" y1="1120" y2="1120" x1="928" />
            <wire x2="1056" y1="1120" y2="1120" x1="1040" />
        </branch>
        <branch name="s(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="1424" type="branch" />
            <wire x2="1024" y1="1424" y2="1424" x1="928" />
            <wire x2="1056" y1="1424" y2="1424" x1="1024" />
        </branch>
        <branch name="C">
            <wire x2="960" y1="1296" y2="1296" x1="928" />
        </branch>
        <iomarker fontsize="28" x="960" y="1296" name="C" orien="R0" />
        <branch name="s(0:3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1312" y="576" type="branch" />
            <wire x2="1312" y1="480" y2="512" x1="1312" />
            <wire x2="1312" y1="512" y2="560" x1="1312" />
            <wire x2="1312" y1="560" y2="576" x1="1312" />
            <wire x2="1312" y1="576" y2="608" x1="1312" />
            <wire x2="1312" y1="608" y2="656" x1="1312" />
            <wire x2="1312" y1="656" y2="688" x1="1312" />
        </branch>
        <bustap x2="1216" y1="512" y2="512" x1="1312" />
        <bustap x2="1216" y1="560" y2="560" x1="1312" />
        <bustap x2="1216" y1="608" y2="608" x1="1312" />
        <bustap x2="1216" y1="656" y2="656" x1="1312" />
        <branch name="s(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="512" type="branch" />
            <wire x2="1184" y1="512" y2="512" x1="1168" />
            <wire x2="1216" y1="512" y2="512" x1="1184" />
        </branch>
        <branch name="s(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="560" type="branch" />
            <wire x2="1184" y1="560" y2="560" x1="1168" />
            <wire x2="1216" y1="560" y2="560" x1="1184" />
        </branch>
        <branch name="s(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="608" type="branch" />
            <wire x2="1184" y1="608" y2="608" x1="1168" />
            <wire x2="1216" y1="608" y2="608" x1="1184" />
        </branch>
        <branch name="s(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1184" y="656" type="branch" />
            <wire x2="1184" y1="656" y2="656" x1="1168" />
            <wire x2="1216" y1="656" y2="656" x1="1184" />
        </branch>
        <branch name="b(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="1360" type="branch" />
            <wire x2="464" y1="1360" y2="1360" x1="400" />
            <wire x2="544" y1="1360" y2="1360" x1="464" />
        </branch>
        <iomarker fontsize="28" x="1312" y="688" name="s(0:3)" orien="R90" />
        <branch name="b(0:3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="144" y="1120" type="branch" />
            <wire x2="144" y1="992" y2="1040" x1="144" />
            <wire x2="144" y1="1040" y2="1088" x1="144" />
            <wire x2="144" y1="1088" y2="1120" x1="144" />
            <wire x2="144" y1="1120" y2="1136" x1="144" />
            <wire x2="144" y1="1136" y2="1184" x1="144" />
            <wire x2="144" y1="1184" y2="1248" x1="144" />
        </branch>
        <bustap x2="240" y1="1040" y2="1040" x1="144" />
        <bustap x2="240" y1="1088" y2="1088" x1="144" />
        <bustap x2="240" y1="1136" y2="1136" x1="144" />
        <bustap x2="240" y1="1184" y2="1184" x1="144" />
        <branch name="b(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="272" y="1184" type="branch" />
            <wire x2="272" y1="1184" y2="1184" x1="240" />
        </branch>
        <branch name="b(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="272" y="1136" type="branch" />
            <wire x2="272" y1="1136" y2="1136" x1="240" />
        </branch>
        <branch name="b(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="272" y="1088" type="branch" />
            <wire x2="272" y1="1088" y2="1088" x1="240" />
        </branch>
        <branch name="b(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="272" y="1040" type="branch" />
            <wire x2="272" y1="1040" y2="1040" x1="240" />
        </branch>
        <iomarker fontsize="28" x="144" y="1248" name="b(0:3)" orien="R90" />
        <branch name="a(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="288" y="704" type="branch" />
            <wire x2="288" y1="704" y2="704" x1="240" />
            <wire x2="320" y1="704" y2="704" x1="288" />
        </branch>
        <bustap x2="240" y1="848" y2="848" x1="144" />
        <bustap x2="240" y1="800" y2="800" x1="144" />
        <bustap x2="240" y1="752" y2="752" x1="144" />
        <bustap x2="240" y1="704" y2="704" x1="144" />
        <branch name="a(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="256" y="848" type="branch" />
            <wire x2="256" y1="848" y2="848" x1="240" />
            <wire x2="320" y1="848" y2="848" x1="256" />
        </branch>
        <branch name="a(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="256" y="800" type="branch" />
            <wire x2="256" y1="800" y2="800" x1="240" />
            <wire x2="320" y1="800" y2="800" x1="256" />
        </branch>
        <branch name="a(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="272" y="752" type="branch" />
            <wire x2="272" y1="752" y2="752" x1="240" />
            <wire x2="304" y1="752" y2="752" x1="272" />
            <wire x2="320" y1="752" y2="752" x1="304" />
        </branch>
        <branch name="a(0:3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="144" y="784" type="branch" />
            <wire x2="144" y1="672" y2="704" x1="144" />
            <wire x2="144" y1="704" y2="752" x1="144" />
            <wire x2="144" y1="752" y2="784" x1="144" />
            <wire x2="144" y1="784" y2="800" x1="144" />
            <wire x2="144" y1="800" y2="848" x1="144" />
            <wire x2="144" y1="848" y2="864" x1="144" />
        </branch>
        <iomarker fontsize="28" x="144" y="864" name="a(0:3)" orien="R90" />
    </sheet>
</drawing>