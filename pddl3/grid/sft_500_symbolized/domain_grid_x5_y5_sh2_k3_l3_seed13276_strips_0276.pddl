(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v11 ?v3)
             (pred_9 ?v4 ?v8)
             (pred_4 ?v11 ?v8)
             (pred_8 ?v10 ?v11 )
	     (pred_10 ?v11)
             (pred_7 ?v7)
             (pred_5 ?v4)
             (pred_6 ?v8)
             (pred_2 ?v11)
             (pred_1 ?v4)
             (pred_3 ?v11)
             (pred_12 ))



(:action op_2
:parameters (?v9 ?v12 ?v6 ?v5)
:precondition (and (pred_7 ?v9) (pred_7 ?v12) (pred_5 ?v6) (pred_6 ?v5)
          (pred_11 ?v9 ?v12) (pred_9 ?v6 ?v5)
                   (pred_4 ?v12 ?v5) (pred_10 ?v9) 
                   (pred_2 ?v12) (pred_1 ?v6))
:effect (and  (pred_3 ?v12) (not (pred_2 ?v12))))


(:action op_5
:parameters (?v9 ?v1)
:precondition (and (pred_7 ?v9) (pred_7 ?v1)
               (pred_10 ?v9) (pred_11 ?v9 ?v1) (pred_3 ?v1))
:effect (and (pred_10 ?v1) (not (pred_10 ?v9))))

(:action op_4
:parameters (?v9 ?v6)
:precondition (and (pred_7 ?v9) (pred_5 ?v6) 
                  (pred_10 ?v9) (pred_8 ?v6 ?v9) (pred_12 ))
:effect (and (pred_1 ?v6)
   (not (pred_8 ?v6 ?v9)) (not (pred_12 ))))


(:action op_1
:parameters (?v9 ?v2 ?v13)
:precondition (and (pred_7 ?v9) (pred_5 ?v2) (pred_5 ?v13)
                  (pred_10 ?v9) (pred_1 ?v13) (pred_8 ?v2 ?v9))
:effect (and (pred_1 ?v2) (pred_8 ?v13 ?v9)
        (not (pred_1 ?v13)) (not (pred_8 ?v2 ?v9))))

(:action op_3
:parameters (?v9 ?v6)
:precondition (and (pred_7 ?v9) (pred_5 ?v6) 
                  (pred_10 ?v9) (pred_1 ?v6))
:effect (and (pred_12 ) (pred_8 ?v6 ?v9) (not (pred_1 ?v6)))))


	
