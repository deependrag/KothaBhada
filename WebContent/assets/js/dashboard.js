function confirmDialog(name, id) {

    var r = confirm("Do you want to delete " + name + "?\nThis cannot be undone.");
    if (r == true) {
        document.location.href = "./Delete?Id=" + id;
    }
}

function editUser(id) {
    document.location.href = "./GetUserData?Id=" + id;
}

function viewInfo(id) {
    document.location.href = "./GetPaymentHistory?Id=" + id;
}

function viewDetails(refno){
	document.location.href = "./PaymentDetails?RefNo=" + refno;
}
