package day2.dao;

public class Test {
	private static Test dao = new Test();
	private Test() { }
	public static Test getInstanceDao() {
		return dao;
	}
}

