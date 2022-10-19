package vn.com.vti.bus.entity;

import java.util.ArrayList;
import java.util.List;

public class BusExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public BusExample() {
        oredCriteria = new ArrayList<>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andRowNumIsNull() {
            addCriterion("row_num is null");
            return (Criteria) this;
        }

        public Criteria andRowNumIsNotNull() {
            addCriterion("row_num is not null");
            return (Criteria) this;
        }

        public Criteria andRowNumEqualTo(Integer value) {
            addCriterion("row_num =", value, "rowNum");
            return (Criteria) this;
        }

        public Criteria andRowNumNotEqualTo(Integer value) {
            addCriterion("row_num <>", value, "rowNum");
            return (Criteria) this;
        }

        public Criteria andRowNumGreaterThan(Integer value) {
            addCriterion("row_num >", value, "rowNum");
            return (Criteria) this;
        }

        public Criteria andRowNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("row_num >=", value, "rowNum");
            return (Criteria) this;
        }

        public Criteria andRowNumLessThan(Integer value) {
            addCriterion("row_num <", value, "rowNum");
            return (Criteria) this;
        }

        public Criteria andRowNumLessThanOrEqualTo(Integer value) {
            addCriterion("row_num <=", value, "rowNum");
            return (Criteria) this;
        }

        public Criteria andRowNumIn(List<Integer> values) {
            addCriterion("row_num in", values, "rowNum");
            return (Criteria) this;
        }

        public Criteria andRowNumNotIn(List<Integer> values) {
            addCriterion("row_num not in", values, "rowNum");
            return (Criteria) this;
        }

        public Criteria andRowNumBetween(Integer value1, Integer value2) {
            addCriterion("row_num between", value1, value2, "rowNum");
            return (Criteria) this;
        }

        public Criteria andRowNumNotBetween(Integer value1, Integer value2) {
            addCriterion("row_num not between", value1, value2, "rowNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumIsNull() {
            addCriterion("column_num is null");
            return (Criteria) this;
        }

        public Criteria andColumnNumIsNotNull() {
            addCriterion("column_num is not null");
            return (Criteria) this;
        }

        public Criteria andColumnNumEqualTo(Integer value) {
            addCriterion("column_num =", value, "columnNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumNotEqualTo(Integer value) {
            addCriterion("column_num <>", value, "columnNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumGreaterThan(Integer value) {
            addCriterion("column_num >", value, "columnNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("column_num >=", value, "columnNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumLessThan(Integer value) {
            addCriterion("column_num <", value, "columnNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumLessThanOrEqualTo(Integer value) {
            addCriterion("column_num <=", value, "columnNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumIn(List<Integer> values) {
            addCriterion("column_num in", values, "columnNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumNotIn(List<Integer> values) {
            addCriterion("column_num not in", values, "columnNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumBetween(Integer value1, Integer value2) {
            addCriterion("column_num between", value1, value2, "columnNum");
            return (Criteria) this;
        }

        public Criteria andColumnNumNotBetween(Integer value1, Integer value2) {
            addCriterion("column_num not between", value1, value2, "columnNum");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceIsNull() {
            addCriterion("number_place is null");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceIsNotNull() {
            addCriterion("number_place is not null");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceEqualTo(String value) {
            addCriterion("number_place =", value, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceNotEqualTo(String value) {
            addCriterion("number_place <>", value, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceGreaterThan(String value) {
            addCriterion("number_place >", value, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceGreaterThanOrEqualTo(String value) {
            addCriterion("number_place >=", value, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceLessThan(String value) {
            addCriterion("number_place <", value, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceLessThanOrEqualTo(String value) {
            addCriterion("number_place <=", value, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceLike(String value) {
            addCriterion("number_place like", value, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceNotLike(String value) {
            addCriterion("number_place not like", value, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceIn(List<String> values) {
            addCriterion("number_place in", values, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceNotIn(List<String> values) {
            addCriterion("number_place not in", values, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceBetween(String value1, String value2) {
            addCriterion("number_place between", value1, value2, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberPlaceNotBetween(String value1, String value2) {
            addCriterion("number_place not between", value1, value2, "numberPlace");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionIsNull() {
            addCriterion("number_division is null");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionIsNotNull() {
            addCriterion("number_division is not null");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionEqualTo(String value) {
            addCriterion("number_division =", value, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionNotEqualTo(String value) {
            addCriterion("number_division <>", value, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionGreaterThan(String value) {
            addCriterion("number_division >", value, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionGreaterThanOrEqualTo(String value) {
            addCriterion("number_division >=", value, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionLessThan(String value) {
            addCriterion("number_division <", value, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionLessThanOrEqualTo(String value) {
            addCriterion("number_division <=", value, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionLike(String value) {
            addCriterion("number_division like", value, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionNotLike(String value) {
            addCriterion("number_division not like", value, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionIn(List<String> values) {
            addCriterion("number_division in", values, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionNotIn(List<String> values) {
            addCriterion("number_division not in", values, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionBetween(String value1, String value2) {
            addCriterion("number_division between", value1, value2, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberDivisionNotBetween(String value1, String value2) {
            addCriterion("number_division not between", value1, value2, "numberDivision");
            return (Criteria) this;
        }

        public Criteria andNumberKanaIsNull() {
            addCriterion("number_kana is null");
            return (Criteria) this;
        }

        public Criteria andNumberKanaIsNotNull() {
            addCriterion("number_kana is not null");
            return (Criteria) this;
        }

        public Criteria andNumberKanaEqualTo(String value) {
            addCriterion("number_kana =", value, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaNotEqualTo(String value) {
            addCriterion("number_kana <>", value, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaGreaterThan(String value) {
            addCriterion("number_kana >", value, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaGreaterThanOrEqualTo(String value) {
            addCriterion("number_kana >=", value, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaLessThan(String value) {
            addCriterion("number_kana <", value, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaLessThanOrEqualTo(String value) {
            addCriterion("number_kana <=", value, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaLike(String value) {
            addCriterion("number_kana like", value, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaNotLike(String value) {
            addCriterion("number_kana not like", value, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaIn(List<String> values) {
            addCriterion("number_kana in", values, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaNotIn(List<String> values) {
            addCriterion("number_kana not in", values, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaBetween(String value1, String value2) {
            addCriterion("number_kana between", value1, value2, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberKanaNotBetween(String value1, String value2) {
            addCriterion("number_kana not between", value1, value2, "numberKana");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfIsNull() {
            addCriterion("number_first_half is null");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfIsNotNull() {
            addCriterion("number_first_half is not null");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfEqualTo(String value) {
            addCriterion("number_first_half =", value, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfNotEqualTo(String value) {
            addCriterion("number_first_half <>", value, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfGreaterThan(String value) {
            addCriterion("number_first_half >", value, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfGreaterThanOrEqualTo(String value) {
            addCriterion("number_first_half >=", value, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfLessThan(String value) {
            addCriterion("number_first_half <", value, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfLessThanOrEqualTo(String value) {
            addCriterion("number_first_half <=", value, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfLike(String value) {
            addCriterion("number_first_half like", value, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfNotLike(String value) {
            addCriterion("number_first_half not like", value, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfIn(List<String> values) {
            addCriterion("number_first_half in", values, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfNotIn(List<String> values) {
            addCriterion("number_first_half not in", values, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfBetween(String value1, String value2) {
            addCriterion("number_first_half between", value1, value2, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberFirstHalfNotBetween(String value1, String value2) {
            addCriterion("number_first_half not between", value1, value2, "numberFirstHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfIsNull() {
            addCriterion("number_latter_half is null");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfIsNotNull() {
            addCriterion("number_latter_half is not null");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfEqualTo(String value) {
            addCriterion("number_latter_half =", value, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfNotEqualTo(String value) {
            addCriterion("number_latter_half <>", value, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfGreaterThan(String value) {
            addCriterion("number_latter_half >", value, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfGreaterThanOrEqualTo(String value) {
            addCriterion("number_latter_half >=", value, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfLessThan(String value) {
            addCriterion("number_latter_half <", value, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfLessThanOrEqualTo(String value) {
            addCriterion("number_latter_half <=", value, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfLike(String value) {
            addCriterion("number_latter_half like", value, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfNotLike(String value) {
            addCriterion("number_latter_half not like", value, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfIn(List<String> values) {
            addCriterion("number_latter_half in", values, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfNotIn(List<String> values) {
            addCriterion("number_latter_half not in", values, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfBetween(String value1, String value2) {
            addCriterion("number_latter_half between", value1, value2, "numberLatterHalf");
            return (Criteria) this;
        }

        public Criteria andNumberLatterHalfNotBetween(String value1, String value2) {
            addCriterion("number_latter_half not between", value1, value2, "numberLatterHalf");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table public.bus
     *
     * @mbg.generated do_not_delete_during_merge Tue Jun 02 05:35:19 JST 2020
     */
    public static class Criteria extends GeneratedCriteria {
        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table public.bus
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}