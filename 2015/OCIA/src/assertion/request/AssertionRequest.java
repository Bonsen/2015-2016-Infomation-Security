package assertion.request;

import java.io.Serializable;

@SuppressWarnings("serial")
public class AssertionRequest implements Serializable {
	public String origin;
	public String TLS_channel_ID;
	public boolean tls_obc_support;

	public AssertionRequest() {
		origin = "Sherry";
		TLS_channel_ID = "hello world!";
		tls_obc_support = true;
	}
}
