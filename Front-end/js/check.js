function checkDate(rentalDate, returnDate) {
  if (returnDate > rentalDate) {
    document.getElementById("btnSearch").innerHTML = `
        <button type="submit" id="btnS">Search</button>
        `;
  } else {
    document.getElementById("err").innerHTML =
      "Return Date must bigger than rental Date";
    return false;
  }
}

function main() {
  var rentalDate = document.getElementById("rental").value;
  var returnDate = document.getElementById("return").value;
  if (checkDate(rentalDate, returnDate)) {
      document.getElementById("btnS").click();
  }
}
