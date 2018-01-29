package com.jz.springbootdemo.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "loginuser")
public class ConsultContract implements Serializable {
    
    private static final long serialVersionUID = 8127035730921338189L;



    /**主键的产生策略
     * 在java.persistence.GenerationType中定义了几种可以供选择的策略：
     1．  Identity：表自动增长字段，Oracle不支持这种方式；
     2．  AUTO：JPA自动选择合适的策略，是默认选项；
     3．  Sequence：通过序列产生主键，通过@SequenceGenerator注解指定序列名，Mysql不支持这种方式。
     4．  TABLE：通过表产生主键，框架借由表模拟产生主键，使用该策略可以使用更易于数据库的移植。
     */
    //    @GeneratedValue(strategy = GenerationType.AUTO)

    @Id
    private Integer id;

    @Column(nullable = false, name = "NAME")
    private String name;

    @Column(nullable = false, name = "AGE")
    private Integer age;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
