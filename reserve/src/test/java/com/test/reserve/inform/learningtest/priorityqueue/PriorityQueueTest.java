package com.test.reserve.inform.learningtest.priorityqueue;

import java.util.PriorityQueue;
import java.util.Random;


public class PriorityQueueTest {
	public static void main(String[] args) {
		PriorityQueue<Element> q = new PriorityQueue<Element>();

		Random random = new Random(System.nanoTime());

		// 0~49의 난수를 생성하여 큐에 넣습니다.
		for (int i = 0; i < 10; i++) {
			q.add(new Element(random.nextInt(50)));
		}

		// 큐에서 값을 빼면서 정렬이 되었는지 출력해봅니다.
		int size = q.size();
		for (int i = 0; i < size; i++) {
			System.out.println(q.poll().getNum());
		}
	}
}