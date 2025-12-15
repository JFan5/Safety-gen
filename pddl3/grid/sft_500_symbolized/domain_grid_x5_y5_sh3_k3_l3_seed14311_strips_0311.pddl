(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v11 ?v8)
             (pred_11 ?v9 ?v10)
             (pred_5 ?v11 ?v10)
             (pred_1 ?v5 ?v11 )
	     (pred_8 ?v11)
             (pred_6 ?v6)
             (pred_7 ?v9)
             (pred_2 ?v10)
             (pred_12 ?v11)
             (pred_4 ?v9)
             (pred_9 ?v11)
             (pred_3 ))



(:action op_3
:parameters (?v2 ?v4 ?v3 ?v7)
:precondition (and (pred_6 ?v2) (pred_6 ?v4) (pred_7 ?v3) (pred_2 ?v7)
          (pred_10 ?v2 ?v4) (pred_11 ?v3 ?v7)
                   (pred_5 ?v4 ?v7) (pred_8 ?v2) 
                   (pred_12 ?v4) (pred_4 ?v3))
:effect (and  (pred_9 ?v4) (not (pred_12 ?v4))))


(:action op_4
:parameters (?v2 ?v12)
:precondition (and (pred_6 ?v2) (pred_6 ?v12)
               (pred_8 ?v2) (pred_10 ?v2 ?v12) (pred_9 ?v12))
:effect (and (pred_8 ?v12) (not (pred_8 ?v2))))

(:action op_2
:parameters (?v2 ?v3)
:precondition (and (pred_6 ?v2) (pred_7 ?v3) 
                  (pred_8 ?v2) (pred_1 ?v3 ?v2) (pred_3 ))
:effect (and (pred_4 ?v3)
   (not (pred_1 ?v3 ?v2)) (not (pred_3 ))))


(:action op_1
:parameters (?v2 ?v1 ?v13)
:precondition (and (pred_6 ?v2) (pred_7 ?v1) (pred_7 ?v13)
                  (pred_8 ?v2) (pred_4 ?v13) (pred_1 ?v1 ?v2))
:effect (and (pred_4 ?v1) (pred_1 ?v13 ?v2)
        (not (pred_4 ?v13)) (not (pred_1 ?v1 ?v2))))

(:action op_5
:parameters (?v2 ?v3)
:precondition (and (pred_6 ?v2) (pred_7 ?v3) 
                  (pred_8 ?v2) (pred_4 ?v3))
:effect (and (pred_3 ) (pred_1 ?v3 ?v2) (not (pred_4 ?v3)))))


	
