package beans;

public class CharacterBean {
    private int id;
    private String name;
    private String category;
    private String role;
    private String description;

    public CharacterBean() { }

    public CharacterBean(int id, String name, String category, String role, String description) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.role = role;
        this.description = description;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}