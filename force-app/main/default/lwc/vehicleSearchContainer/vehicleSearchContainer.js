//? https://trailhead.salesforce.com/content/learn/modules/lightning-web-components-and-salesforce-data/use-apex-to-work-with-data?trailmix_creator_id=strailhead&trailmix_slug=prepare-for-your-salesforce-javascript-developer-i-credential


import { LightningElement, api, wire } from 'lwc';
import getVehDetails from '@salesforce/apex/AuthCallout.getVehDetails';

export default class VehicleSearchContainer extends LightningElement {
	@api vehicleRegistration;
	@wire(getVehDetails, { vehReg: '$vehicleRegistration' })
    vehicles;

	handleClick() {
		getVehDetails({
			// imperative Apex call
			vehReg: this.vehicleRegistration
		})
			.then(vehicles => {
				// code to execute if related vehicles are returned successfully


			})
			.catch(error => {
				// code to execute if related contacts are not returned successfully


			})
	}
}
