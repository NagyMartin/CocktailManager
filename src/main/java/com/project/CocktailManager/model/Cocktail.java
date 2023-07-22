package com.project.CocktailManager.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@AllArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name = "cocktails")
public class Cocktail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    private String name;
    private String baseIngredient;
    private String additionalIngredient1;
    private String additionalIngredient2;
    private String additionalIngredient3;
    private String additionalIngredient4;
    private String additionalIngredient5;
    private String measureBaseIngredient;
    private String measureAdditionalIngredient1;
    private String measureAdditionalIngredient2;
    private String measureAdditionalIngredient3;
    private String measureAdditionalIngredient4;
    private String measureAdditionalIngredient5;
    private String instructions;
    @ManyToMany(fetch = FetchType.LAZY)
    private List<User> userList;
    public Cocktail(){

    }
    public Cocktail(int id, String name){
        this.id = id;
        this.name = name;
    }

    public Cocktail(int id, String name, String baseIngredient, String additionalIngredient1,
                    String additionalIngredient2, String additionalIngredient3, String additionalIngredient4,
                    String additionalIngredient5, String measureBaseIngredient,
                    String measureAdditionalIngredient1, String measureAdditionalIngredient2,
                    String measureAdditionalIngredient3, String measureAdditionalIngredient4,
                    String measureAdditionalIngredient5, String instructions) {
        this.id = id;
        this.name = name;
        this.baseIngredient = baseIngredient;
        this.additionalIngredient1 = additionalIngredient1;
        this.additionalIngredient2 = additionalIngredient2;
        this.additionalIngredient3 = additionalIngredient3;
        this.additionalIngredient4 = additionalIngredient4;
        this.additionalIngredient5 = additionalIngredient5;
        this.measureBaseIngredient = measureBaseIngredient;
        this.measureAdditionalIngredient1 = measureAdditionalIngredient1;
        this.measureAdditionalIngredient2 = measureAdditionalIngredient2;
        this.measureAdditionalIngredient3 = measureAdditionalIngredient3;
        this.measureAdditionalIngredient4 = measureAdditionalIngredient4;
        this.measureAdditionalIngredient5 = measureAdditionalIngredient5;
        this.instructions = instructions;
    }
}
