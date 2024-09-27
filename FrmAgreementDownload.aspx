<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmAgreementDownload.aspx.cs" Inherits="S_FACTOR_VMS.FrmAgreementDownload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>AGREEMENT</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body lang="EN-IN" style="word-wrap: break-word">
    <form id="form1" runat="server">
        <div class="container" id="masterContent">
            <div class="row" style="padding: 15px 50px 15px 70px">
                <div class="WordSection1">

                    <p class="MsoNormal" align="center" style='text-align: center'>
                        <b><u><span
                            style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Agreement
for Distribution of 4SME Privilege Cards</span></u></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><u><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>
                            <span
                                style='text-decoration: none'></span></span></u></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>This Agreement
(&quot;Agreement&quot;) is made and entered into on this <b><span>
    <asp:Label ID="LblDocDay" Text="[DAY]" runat="server"></asp:Label></span></b>, Day of <b><span>
        <asp:Label ID="LblDocMonth" Text="[MONTH]" runat="server"></asp:Label></span></b>,<span> <b>
            <asp:Label ID="LblDocYear" Text="[YEAR]" runat="server"></asp:Label></b>,</span></span>
                    </p>

                    <p class="MsoNormal" align="center" style='text-align: center'>
                        <b><span
                            style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>BETWEEN</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Bharat Earn Technology <span
                            class="SpellE">Pvt.</span> Ltd</span></b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>. (hereinafter referred
to as &quot;Company&quot;), having its business address at <b>KTM BTM, 1st
floor, 6, Asha <span class="SpellE">Nivas</span>, 100ft <span class="GramE">Ring
road</span>, <span class="SpellE">Aicobo</span> Nagar, Bengaluru, Karnataka,
560068</b>.</span>
                    </p>

                    <p class="MsoNormal" align="center" style='text-align: center'>
                        <b><span
                            style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>AND</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'><span>
                            <asp:Label ID="LblRName" Text="[Recipient's Name]" runat="server"></asp:Label></span></span></b><span
                                style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>
(hereinafter referred to as &quot;Sales Associate&quot;), having its business
address at <b><span>
    <asp:Label ID="TxtRAddress" Text="[Recipient's Address]" runat="server"></asp:Label></span>.</b></span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>&nbsp;</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>1. Purpose:</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>The Company is 
engages in the issuance of 4SME Privilege Cards for promotional
purposes. Sales Associate agrees to distribute &amp; promote these 4SME
Privilege Cards to new users.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>2. Term:</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>This Agreement shall
commence on <b><span>
    <asp:Label ID="TxtDocDate" Text="[Date]" runat="server"></asp:Label></span></b>
                            and shall remain in effect for a period of 3 years unless terminated earlier as
per the terms stated herein.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>3. Distribution of 4SME
Privilege Cards:</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>The Company grants Sales
Associate the non-exclusive right to acquire new users for the 4SME Privilege
Card. Sales Associate shall acquire the users in a diligent manner, adhering to
the terms and conditions outlined in this Agreement.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>4. Remuneration and
Charges:</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>For each unique user
acquired by the Sales Associate, the Company shall provide a remuneration of INR 100 (Rupees One Hundred) to the Sales
Associate. The Sales Associate shall submit all relevant details of the new
user in the prescribed format provided by the Company</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>5. Obligations of
Company:</span></b>
                    </p>

                    <p class="MsoListParagraphCxSpFirst" style='margin-left: 39.0pt; text-align: justify; text-indent: -18.0pt;'>
                        <![if !supportLists]><span
                            style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif;'><span>a)<span
                                style='font: 7.0pt "Times New Roman"'>&nbsp;</span></span></span><![endif]><span
                                    style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>The Company
shall explain the details and benefits of the 4SME Privilege Cards and provide
adequate training to the Sales Associate to help them acquire new users for the
card.</span>
                    </p>
                    <br />
                    <br />
                    <br />

                    <p class="MsoListParagraphCxSpMiddle" style='margin-left: 39.0pt; text-align: justify; text-indent: -18.0pt;'>
                        <![if !supportLists]><span
                            style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif;'><span>b)<span
                                style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;</span></span></span><![endif]><span
                                    style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>The Company
upon receiving the details of all these users monthly from the Sales Associate
in the prescribed format, will subsequently issue digital cards to the users as
per the terms and conditions.</span>
                    </p>

                    <p class="MsoListParagraphCxSpMiddle" style='margin-left: 39.0pt; text-align: justify; text-indent: -18.0pt;'>
                        <![if !supportLists]><span
                            style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif;'><span>c)<span
                                style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;</span></span></span><![endif]><span
                                    style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>The Company
shall pay the remuneration to Sales Associate within 15 days of the receipt of
a valid invoice from Sales Associate.</span>
                    </p>

                    <p class="MsoListParagraphCxSpLast" style='margin-left: 39.0pt; text-align: justify; text-indent: -18.0pt;'>
                        <![if !supportLists]><span
                            style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif;'><span>d)<span
                                style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;</span></span></span><![endif]><span
                                    style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>The Company
shall digitally issue the 4SME Privilege Cards to new users promptly and
efficiently.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>6. Obligations of Sales
Associate:</span></b>
                    </p>

                    <p class="MsoListParagraphCxSpFirst" style='margin-left: 39.0pt; text-align: justify; text-indent: -18.0pt;'>
                        <![if !supportLists]><span
                            style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif;'><span>a)<span
                                style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;</span></span></span><![endif]><span
                                    style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Sales Associate shall explain the details
and benefits of the 4SME Privilege Card to the new users and take their
concurrence to take the card. The details of all these users will be shared
monthly to Company in the prescribed format shared by Company. Company then
subsequently issues digital cards to the users as per the terms and conditions.
                
                                </span>
                    </p>

                    <p class="MsoListParagraphCxSpMiddle" style='margin-left: 39.0pt; text-align: justify; text-indent: -18.0pt;'>
                        <![if !supportLists]><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif;'><span>b)<span
                            style='font: 7.0pt "Times New Roman"'>&nbsp;&nbsp;</span></span></span><![endif]><span
                                style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Sales Associate shall maintain accurate
records of the users and shall provide Company with periodic reports as
mutually agreed upon.</span>
                    </p>

                    <p class="MsoListParagraphCxSpLast" style='margin-left: 39.0pt; text-align: justify; text-indent: -18.0pt;'>
                        <![if !supportLists]><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif;'><span>c)<span
                            style='font: 7.0pt "Times New Roman"'>&nbsp;</span></span></span><![endif]><span
                                style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Sales Associate shall issue the invoice to
Company for the remuneration due as per the terms mentioned herein in timely manner.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>7. Ownership and
Intellectual Property:</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>All rights, title, and
interest in the 4SME Privilege Card, including any intellectual property
rights, shall remain the exclusive property of Company.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>8. Confidentiality:</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Both parties agree to
treat all information disclosed by either party during the term of this
Agreement as confidential and shall not disclose it to any third party without
prior written consent, except as required by law.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>9. Termination:</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Either party may terminate
this Agreement by providing 30 days written notice to the other party. Upon
termination, Sales Associate shall cease distributing the 4SME Privilege Cards,
and any outstanding payments shall be settled as per the terms herein.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>10. Governing Law and
Jurisdiction:</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>This Agreement shall be
governed by and construed in accordance with the laws of India. Any disputes
arising out of or in connection with this Agreement shall be subject to the
exclusive jurisdiction of the courts located in Bangalore, Karnataka.</span>
                    </p>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <%--<br />--%>
                    <p class="MsoNormal" style='text-align: justify'>
                        <b><span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>11. Entire Agreement:</span></b>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>This Agreement
constitutes the entire understanding between the parties and supersedes any
prior discussions, negotiations, or agreements, whether written or oral,
relating to the subject matter herein.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Please signify your acceptance of the 
                            terms and conditions of this Agreement by signing and returning a copy of this letter to us within 15 days of receipt.</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>&nbsp;</span>
                    </p>
                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>For</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Bharat Earn Technology <span
                            class="SpellE">Pvt.</span> Ltd.
                
                        </span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>&nbsp;</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span class="SpellE"><span
                            style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>(Dipak</span></span><span
                                style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>
Agarwal)</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Director</span>
                    </p>



                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>&nbsp;</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Accepted and Agreed:</span>
                    </p>

                    <%--<p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>&nbsp;</span>
                    </p>--%>
                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>For</span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'><span>
                            <asp:Label ID="LblREntityName" Text="[Company/Organization Name]" runat="server"></asp:Label></span></span>
                    </p>
                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>&nbsp;</span>
                    </p>
                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'><span>
                            <asp:Label ID="LblRName2" Text="[Recipient's Name]" runat="server"></asp:Label></span></span>
                    </p>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'><span>
                            <asp:Label ID="LblRDes" Text="[Recipient's Designation]" runat="server"></asp:Label></span></span>
                    </p>

                    <%--<p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>&nbsp;</span>
                    </p>--%>

                    <p class="MsoNormal" style='text-align: justify'>
                        <span style='font-size: 14.0pt; line-height: 107%; font-family: "Times New Roman",serif'>Date:
                            <asp:Label ID="LblAgreeDate" Text="[Agreement Date]" runat="server"></asp:Label>
                        </span>
                    </p>

                </div>
            </div>
        </div>
        <script type="text/javascript">
            window.onload = function () {
                //var element = document.getElementById('masterContent');
                //html2pdf().from(element).save('Agreement.pdf');
                //html2pdf(element);
                window.print();
            }
        </script>
    </form>

</body>

</html>
