<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2" />
        <signal name="XLXN_5" />
        <signal name="XLXN_7" />
        <signal name="ai" />
        <signal name="bi" />
        <signal name="ci" />
        <signal name="co" />
        <signal name="so" />
        <port polarity="Input" name="ai" />
        <port polarity="Input" name="bi" />
        <port polarity="Input" name="ci" />
        <port polarity="Output" name="co" />
        <port polarity="Output" name="so" />
        <blockdef name="half_adder">
            <timestamp>2024-12-1T4:48:48</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="half_adder" name="u1">
            <blockpin signalname="ai" name="a" />
            <blockpin signalname="bi" name="b" />
            <blockpin signalname="XLXN_5" name="c" />
            <blockpin signalname="XLXN_2" name="s" />
        </block>
        <block symbolname="half_adder" name="u2">
            <blockpin signalname="XLXN_2" name="a" />
            <blockpin signalname="ci" name="b" />
            <blockpin signalname="XLXN_7" name="c" />
            <blockpin signalname="so" name="s" />
        </block>
        <block symbolname="or2" name="XLXI_3">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="XLXN_5" name="I1" />
            <blockpin signalname="co" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="368" y="944" name="u1" orien="R0">
        </instance>
        <instance x="368" y="1232" name="u2" orien="R0">
        </instance>
        <branch name="XLXN_2">
            <wire x2="304" y1="1008" y2="1136" x1="304" />
            <wire x2="368" y1="1136" y2="1136" x1="304" />
            <wire x2="784" y1="1008" y2="1008" x1="304" />
            <wire x2="784" y1="912" y2="912" x1="752" />
            <wire x2="784" y1="912" y2="1008" x1="784" />
        </branch>
        <instance x="816" y="1200" name="XLXI_3" orien="R0" />
        <branch name="XLXN_5">
            <wire x2="800" y1="848" y2="848" x1="752" />
            <wire x2="800" y1="848" y2="1072" x1="800" />
            <wire x2="816" y1="1072" y2="1072" x1="800" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="816" y1="1136" y2="1136" x1="752" />
        </branch>
        <branch name="ai">
            <wire x2="368" y1="848" y2="848" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="848" name="ai" orien="R180" />
        <branch name="bi">
            <wire x2="368" y1="912" y2="912" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="912" name="bi" orien="R180" />
        <branch name="ci">
            <wire x2="368" y1="1200" y2="1200" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1200" name="ci" orien="R180" />
        <branch name="co">
            <wire x2="1104" y1="1104" y2="1104" x1="1072" />
        </branch>
        <iomarker fontsize="28" x="1104" y="1104" name="co" orien="R0" />
        <branch name="so">
            <wire x2="784" y1="1200" y2="1200" x1="752" />
        </branch>
        <iomarker fontsize="28" x="784" y="1200" name="so" orien="R0" />
    </sheet>
</drawing>