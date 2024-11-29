package com.ruoyi.web.app;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class app2 {
    public static void main(String[] args) {

        String[] arr = {"12", "34", "25"};
        List<Integer> collect = Arrays.stream(arr)
                .map(a -> Integer.valueOf(a))
                .collect(Collectors.toList());
        System.out.println(collect);
        // Integer::valueOf 等价于 a -> Integer.valueOf(a)
        List<Integer> collect1 = Arrays.stream(arr)
                .map(Integer::valueOf)
                .collect(Collectors.toList());
        System.out.println(collect1);

        System.out.println("-----------------------------");
        Arrays.stream(arr).forEach(x -> System.out.println(x));

        // 实例方法引用  对象名::实例方法
        // lambda表达式中用到的参数，在实例方法中使用
        Arrays.stream(arr).forEach(System.out::println);

        System.out.println("--------------------");

        Arrays.sort(arr, (o1, o2) -> o1.compareTo(o2));
        // 本例中，有两个参数o1,o2; o1是第一个参数，该参数用于调用方法compareTo,o2是剩余的参数，作为compareTo方法中的参数
        // 实例方法应用  类名::实例方法
        // lambda表达式中，第一个参数是方法的调用方，剩余的参数是调用的方法中用的参数
        Arrays.sort(arr, String::compareTo);
        System.out.println(Arrays.toString(arr));


        List<Integer> collect6 = Arrays.asList(arr).stream()
                .map(String::length).collect(Collectors.toList());
        System.out.println(collect6);

        System.out.println("-------------------");

//        List<User> collect2 = Arrays.stream(arr)
//                .map(item -> new User(item)).collect(Collectors.toList());
//        System.out.println(collect2);
//        // 构造方法引用 lambda的参数作为构造方法的参数
//        List<User> collect3 = Arrays.stream(arr)
//                .map(User::new).collect(Collectors.toList());
//        System.out.println(collect3);

    }
}
