package main;

public class Kitchen {
	
	private String id;
	private String address;
	private String zip_code;
	private String supplier_id;
	private String inspector_id;
	
	public Kitchen() {		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getSupplier_id() {
		return supplier_id;
	}
	public void setSupplier_id(String supplier_id) {
		this.supplier_id = supplier_id;
	}
	public String getInspector_id() {
		return inspector_id;
	}
	public void setInspector_id(String inspector_id) {
		this.inspector_id = inspector_id;
	}

	public Kitchen(String id, String address, String zip_code, String supplier_id, String inspector_id) {
		this.id = id;
		this.address = address;
		this.inspector_id = inspector_id;
		this.zip_code = zip_code;
		this.supplier_id = supplier_id; 
	}
}
