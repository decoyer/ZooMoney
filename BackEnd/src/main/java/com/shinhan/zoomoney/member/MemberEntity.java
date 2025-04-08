package com.shinhan.zoomoney.member;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "Member")
public class MemberEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int memberNum;

    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberPhone;
    private String memberType;
    // private Integer memberParent;
    @ManyToOne
    @JoinColumn(name = "member_parent")
    private MemberEntity memberParent;
    private Integer memberPoint;
    private String memberAccount;

}
