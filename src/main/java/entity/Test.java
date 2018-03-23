package entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.text.Collator;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class Test implements Serializable {
    @JsonIgnore
    private long id;
    @JsonProperty("name")
    private String name;
    @JsonProperty("quest")
    private List<Question> quest;
    @JsonProperty("type")
    private TestTypes type;

    public Test(String name, List<Question> quest, TestTypes type) {
        this.name = name;
        this.quest = quest;
        this.type = type;
    }

    public Test() {
        quest = new ArrayList<>();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Question> getQuest() {
        return quest;
    }

    public void setQuest(List<Question> quest) {
        this.quest = quest;
    }

    public TestTypes getType() {
        return type;
    }

    public void setType(TestTypes type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Test{" +
                "name='" + name + '\'' +
                ", quest=" + quest +
                ", type=" + type +
                '}';
    }
}
