/* custom formatters */
function listingLinkFormatter(cellvalue, options, rowObject){
    let listings = options.colModel.editoptions.value.split(';');

    // listingData returns '4:2222 W First St, Phoenix, AZ 85048' 
    let listingData = listings.find(elm => elm.startsWith(cellvalue + ':'));

    // need the value after semicolon
    return `<a href='property.php?id=${cellvalue}'>${listingData.split(':')[1]}</a>`;
}

function agentLinkFormatter(cellvalue, options, rowObject){
    let listings = options.colModel.editoptions.value.split(';');

    // listingData returns '4:2222 W First St, Phoenix, AZ 85048' 
    let listingData = listings.find(elm => elm.startsWith(cellvalue + ':'));

    // need the value after semicolon
    return `<a href='agent_details.php?id=${cellvalue}'>${listingData.split(':')[1]}</a>`;
}


function mainPhotoFormatter(cellvalue, options, rowObject){
    let imgs = options.colModel.editoptions.value.split(';');

	// console.log(imgs);

    let imgData = imgs.find(elm => elm.startsWith(cellvalue + ':'));

	// split first (slice) semicolon e.g. 1:https://example.com/img.jpg
	return `<img src="${imgData.split(/:/).slice(1).join(':')}" />`;
}