package mongo;


public class Geometry {

private Location location;
private String locationType;
private Viewport viewport;

public Location getLocation() {
return location;
}

public void setLocation(Location location) {
this.location = location;
}

public String getLocationType() {
return locationType;
}

public void setLocationType(String locationType) {
this.locationType = locationType;
}

public Viewport getViewport() {
return viewport;
}

public void setViewport(Viewport viewport) {
this.viewport = viewport;
}

}