/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function mainName() {
    var rentalDate = document.getElementById("dateRent").value;
    var returnDate = document.getElementById("dateReturn").value;
    if (returnDate > rentalDate) {
        document.getElementById("btnClickName").innerHTML = `
        <button type="submit" class="btn btn-primary">Search</button>
        `;
    } else {
        document.getElementById("errName").innerHTML =
                "Return Date must bigger than rental Date";
    }
}
function mainCategory() {
    var rentalDatee = document.getElementById("dateRental").value;
    var returnDatee = document.getElementById("dateReturnn").value;
    console.log(rentalDatee + "rental");
    console.log(returnDatee + "return");
    if (returnDatee > rentalDatee) {
        document.getElementById("btnClickCategory").innerHTML = `
        <button type="submit" class="btn btn-primary">Search</button>
        `;
    } else {
        console.log(rentalDatee + "rental");
        console.log(returnDatee + "return");
        document.getElementById("errCategory").innerHTML =
                "Return Date must bigger than rental Date";
    }
}


