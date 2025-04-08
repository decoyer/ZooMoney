package com.shinhan.zoomoney.stock.entity;

import java.util.Date;

import com.shinhan.zoomoney.member.MemberEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "StockHistoryBackup")
public class StockHistoryBackupEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int stockhistNum;

    @ManyToOne
    @JoinColumn(name = "member_num")
    private MemberEntity member;

    @ManyToOne
    @JoinColumn(name = "stock_num")
    private StockEntity stockNum;

    private String stockhistType;
    private int stockhistAmount;
    private int stockhistPrice;
    private Date stockhistDate;
}
