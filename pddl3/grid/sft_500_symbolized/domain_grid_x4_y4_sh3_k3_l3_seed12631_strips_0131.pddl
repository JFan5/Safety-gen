(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v8)
             (pred_9 ?v4 ?v7)
             (pred_11 ?v5 ?v7)
             (pred_10 ?v3 ?v5 )
	     (pred_1 ?v5)
             (pred_7 ?v11)
             (pred_2 ?v4)
             (pred_4 ?v7)
             (pred_12 ?v5)
             (pred_5 ?v4)
             (pred_3 ?v5)
             (pred_8 ))



(:action op_4
:parameters (?v9 ?v10 ?v1 ?v2)
:precondition (and (pred_7 ?v9) (pred_7 ?v10) (pred_2 ?v1) (pred_4 ?v2)
          (pred_6 ?v9 ?v10) (pred_9 ?v1 ?v2)
                   (pred_11 ?v10 ?v2) (pred_1 ?v9) 
                   (pred_12 ?v10) (pred_5 ?v1))
:effect (and  (pred_3 ?v10) (not (pred_12 ?v10))))


(:action op_5
:parameters (?v9 ?v6)
:precondition (and (pred_7 ?v9) (pred_7 ?v6)
               (pred_1 ?v9) (pred_6 ?v9 ?v6) (pred_3 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v9))))

(:action op_1
:parameters (?v9 ?v1)
:precondition (and (pred_7 ?v9) (pred_2 ?v1) 
                  (pred_1 ?v9) (pred_10 ?v1 ?v9) (pred_8 ))
:effect (and (pred_5 ?v1)
   (not (pred_10 ?v1 ?v9)) (not (pred_8 ))))


(:action op_3
:parameters (?v9 ?v12 ?v13)
:precondition (and (pred_7 ?v9) (pred_2 ?v12) (pred_2 ?v13)
                  (pred_1 ?v9) (pred_5 ?v13) (pred_10 ?v12 ?v9))
:effect (and (pred_5 ?v12) (pred_10 ?v13 ?v9)
        (not (pred_5 ?v13)) (not (pred_10 ?v12 ?v9))))

(:action op_2
:parameters (?v9 ?v1)
:precondition (and (pred_7 ?v9) (pred_2 ?v1) 
                  (pred_1 ?v9) (pred_5 ?v1))
:effect (and (pred_8 ) (pred_10 ?v1 ?v9) (not (pred_5 ?v1)))))


	
