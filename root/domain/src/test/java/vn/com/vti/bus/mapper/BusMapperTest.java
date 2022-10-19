package vn.com.vti.bus.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.mapper.BusMapper;

@SpringJUnitConfig(locations = {"classpath:test-context.xml"})
class BusMapperTest {

	@Autowired
	private BusMapper busMapper;

	@Test
	void test() {
		Bus bus = busMapper.selectByPrimaryKey(1);
		System.out.println(bus.getNumberKana());
	}

}
