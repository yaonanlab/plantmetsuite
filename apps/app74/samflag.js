<script type="text/javascript">
    lstFlags = [["read paired", 0x1],
        ["read mapped in proper pair", 0x2],
        ["read unmapped", 0x4],
        ["mate unmapped", 0x8],
        ["read reverse strand", 0x10],
        ["mate reverse strand", 0x20],
        ["first in pair", 0x40],
        ["second in pair", 0x80],
        ["not primary alignment", 0x100],
        ["read fails platform/vendor quality checks", 0x200],
        ["read is PCR or optical duplicate", 0x400],
        ["supplementary alignment", 0x800]];
    function explainFlags() {
        var flagValue = parseInt(document.getElementById('tb').value); //returns 0 or NaN if can't parse
        var summary  = ""; 
        var badFlags = [];   // Stores the flags that don't make sense with unpaired reads
        var hexString  = ""; // indicator for the user which flags are invalid with unpaired reads
        var pairedRead = lstFlags[0][1] & flagValue;
        for(var i = 0; i < lstFlags.length; i++) {
            var checkbox = document.getElementById('cb' + i)
            if(lstFlags[i][1] & flagValue) {
                hexString = " (0x" + lstFlags[i][1].toString(16) + ")";
                if (!pairedRead && (lstFlags[i][1] & 235)) {
                    badFlags.push(" 0x" + lstFlags[i][1].toString(16));
                    hexString += "<b>*</b>";
                }
                summary  += " &nbsp; &nbsp; " + lstFlags[i][0] + hexString + "<br>";
                checkbox.checked = true;
            } else {
                checkbox.checked = false;
            }
        }
        if (badFlags.length > 0){
            if (badFlags.length == 2){
                badFlags = badFlags.join(" and ");
            } else {
                badFlags[badFlags.length - 1] = " and" + badFlags[badFlags.length - 1];
            }
            summary += "<br> &nbsp; &nbsp; <b>*Warning:</b> Flag(s)" + badFlags + " cannot be set when read is not paired";
        }
        document.getElementById('summary').innerHTML = summary;
    }
    function checkboxClicked() {
        //compute the new flag value
        var newFlagValue = 0;
        for(var i = 0; i < lstFlags.length; i++) {
            var checkBox = document.getElementById('cb' + i);
            if(checkBox.checked) {
                newFlagValue |= lstFlags[i][1];
            }
        }
        var textbox = document.getElementById('tb');
        textbox.value = newFlagValue;
        explainFlags();
    }
    function switchToMate() {
        swaps = [[2,3],[4,5],[6,7]]
        for( var i = 0 ; i<swaps.length ; i++){
            swap1=swaps[i][0]
            swap2=swaps[i][1]
            val1 = document.getElementById('cb' + swap1).checked;
            val2 = document.getElementById('cb' + swap2).checked;
            document.getElementById('cb' + swap1).checked=val2
            document.getElementById('cb' + swap2).checked=val1
            checkboxClicked()
        }
    }
</script>
                    <script type="text/javascript">
                        for(var i = 0; i < lstFlags.length; i++) {
                            document.write("<input type=checkbox name=cb" + i + " id='cb" + i + "' onclick='checkboxClicked();'> &nbsp; " +lstFlags[i][0] + "</input><br />");
                        }
                    </script>