package hairshop.dto;

public enum User_grade {

    브론즈(1),
    실버(2),
    골드(3),
    에메랄드(4),
    다이아(5);
	private final int gradeValue;
	
    User_grade(int gradeValue) {
        this.gradeValue = gradeValue;
    }

    public int getGradeValue() {
        return gradeValue;
    }

    public static User_grade fromValue(int value) {
        for (User_grade grade : User_grade.values()) {
            if (grade.getGradeValue() == value) {
                return grade;
            }
        }
        throw new IllegalArgumentException("Invalid grade value: " + value);
    }
    

}
