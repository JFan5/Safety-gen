(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v7)
             (pred_12 ?v2 ?v6)
             (pred_2 ?v5 ?v6)
             (pred_1 ?v11 ?v5 )
	     (pred_6 ?v5)
             (pred_10 ?v8)
             (pred_9 ?v2)
             (pred_4 ?v6)
             (pred_5 ?v5)
             (pred_8 ?v2)
             (pred_3 ?v5)
             (pred_7 ))



(:action op_4
:parameters (?v3 ?v4 ?v10 ?v13)
:precondition (and (pred_10 ?v3) (pred_10 ?v4) (pred_9 ?v10) (pred_4 ?v13)
          (pred_11 ?v3 ?v4) (pred_12 ?v10 ?v13)
                   (pred_2 ?v4 ?v13) (pred_6 ?v3) 
                   (pred_5 ?v4) (pred_8 ?v10))
:effect (and  (pred_3 ?v4) (not (pred_5 ?v4))))


(:action op_3
:parameters (?v3 ?v12)
:precondition (and (pred_10 ?v3) (pred_10 ?v12)
               (pred_6 ?v3) (pred_11 ?v3 ?v12) (pred_3 ?v12))
:effect (and (pred_6 ?v12) (not (pred_6 ?v3))))

(:action op_5
:parameters (?v3 ?v10)
:precondition (and (pred_10 ?v3) (pred_9 ?v10) 
                  (pred_6 ?v3) (pred_1 ?v10 ?v3) (pred_7 ))
:effect (and (pred_8 ?v10)
   (not (pred_1 ?v10 ?v3)) (not (pred_7 ))))


(:action op_2
:parameters (?v3 ?v1 ?v9)
:precondition (and (pred_10 ?v3) (pred_9 ?v1) (pred_9 ?v9)
                  (pred_6 ?v3) (pred_8 ?v9) (pred_1 ?v1 ?v3))
:effect (and (pred_8 ?v1) (pred_1 ?v9 ?v3)
        (not (pred_8 ?v9)) (not (pred_1 ?v1 ?v3))))

(:action op_1
:parameters (?v3 ?v10)
:precondition (and (pred_10 ?v3) (pred_9 ?v10) 
                  (pred_6 ?v3) (pred_8 ?v10))
:effect (and (pred_7 ) (pred_1 ?v10 ?v3) (not (pred_8 ?v10)))))


	
