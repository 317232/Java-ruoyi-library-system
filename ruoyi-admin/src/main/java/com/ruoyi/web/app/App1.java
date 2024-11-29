package com.ruoyi.web.app;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * stream流
 */
public class App1 {
    public static void main(String[] args) {
//        List<Integer> integerList = Arrays.asList(1, 2, 3, 4, 5);
        // lamada表达式 如果只有一句话尖括号不用写
//        Stream<Integer> stream = integerList.stream().filter(i -> i > 3); // 过滤
// 为了方便演示，转为集合类型
        // stream流需转为链表方式才可输出
//        List<Integer> collect = integerList.stream().filter(i -> i > 3).collect(Collectors.toList());
//        System.out.println(collect);
//
//        List<Integer> integerList = Arrays.asList(1, 1, 2, 2, 3, 4, 4, 5);
//        Stream<Integer> stream = integerList.stream().distinct(); // 去重
//        List<Integer> integerList = Arrays.asList(1, 2, 3, 4, 5);
////        Stream<Integer> stream = integerList.stream().limit(3);
        List<String> stringList = Arrays.asList("zhangsan", "lisi",  "wangwu", "haha");
        // map把一个又一个的把参数映射过来
        Stream<Integer> stream = stringList.stream().map(item -> item.length());
        List<Integer> collect = stream.collect(Collectors.toList());
        System.out.println(collect);

//        List<Integer> integerList = Arrays.asList(1, 2, 3, 4, 5);
//        Long result = integerList.stream().count();
//        System.out.println(result);
//        List<Integer> integerList = Arrays.asList(1, 2, 3, 4, 5);
//        Optional<Integer> result = integerList.stream().filter(i -> i > 3).findFirst();
       // orElse() 值存在就返回，不存在，返回执行值，比如null
//        Integer value = integerList.stream().filter(i -> i > 3).findFirst().orElse(null);
//        System.out.println(value);
    }
}
