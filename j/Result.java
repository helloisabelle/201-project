package mongo;

import java.util.List;

public class Result {

private List<AddressComponent> addressComponents = null;
private String formattedAddress;
private Geometry geometry;
private Boolean partialMatch;
private String placeId;
private PlusCode plusCode;
private List<String> types = null;

public List<AddressComponent> getAddressComponents() {
return addressComponents;
}

public void setAddressComponents(List<AddressComponent> addressComponents) {
this.addressComponents = addressComponents;
}

public String getFormattedAddress() {
return formattedAddress;
}

public void setFormattedAddress(String formattedAddress) {
this.formattedAddress = formattedAddress;
}

public Geometry getGeometry() {
return geometry;
}

public void setGeometry(Geometry geometry) {
this.geometry = geometry;
}

public Boolean getPartialMatch() {
return partialMatch;
}

public void setPartialMatch(Boolean partialMatch) {
this.partialMatch = partialMatch;
}

public String getPlaceId() {
return placeId;
}

public void setPlaceId(String placeId) {
this.placeId = placeId;
}

public PlusCode getPlusCode() {
return plusCode;
}

public void setPlusCode(PlusCode plusCode) {
this.plusCode = plusCode;
}

public List<String> getTypes() {
return types;
}

public void setTypes(List<String> types) {
this.types = types;
}

}