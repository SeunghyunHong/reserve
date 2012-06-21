package com.narratage.reserve.flightinformation.service;

import java.util.List;

import com.narratage.reserve.flightinformation.domain.Airport;

/**
 * @author StevePak
 * 구글맵에서 표시될 도시를 가져오기 위해서 사용합니다.
 * 동시에 DB에 저장된 모든 도시를 가져오는 경우 가독성이 떨어지며, DB에 지나친 IO를 발생시킬 가능성만 있습니다.
 * 구글맵의 왼쪽상단의 점과 오른쪽 하단의 점2개를 통해 직사각형을 그릴 수 있고 해당 직사각형 내부의 주요도시만 가져올 수 있도록 합니다.
 * 도시들을 검색할 때 마다, 테이블의 검색횟수 컬럼이 늘어나며, 해당 횟수에 따라 우선순위를 부여한다.
 * (미구현)
 * 몇개의 도시를 불러올건지를 정하는 부분은 XML을 이용해서, 또는 DB에 정보를 저장하는 형태로 가져옵니다. 
 *  
 **/
public interface AirportService {
	public List<Airport> getCitiesForMap(double topLeftLat, double topLeftLong, double botRightLat, double botRightLong);
}