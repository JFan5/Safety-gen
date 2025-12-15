(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v4 ?v3)
             (pred_1 ?v13 ?v8)
             (pred_4 ?v4 ?v8)
             (pred_10 ?v12 ?v4 )
	     (pred_8 ?v4)
             (pred_2 ?v11)
             (pred_6 ?v13)
             (pred_5 ?v8)
             (pred_7 ?v4)
             (pred_3 ?v13)
             (pred_9 ?v4)
             (pred_11 ))



(:action op_4
:parameters (?v2 ?v10 ?v9 ?v5)
:precondition (and (pred_2 ?v2) (pred_2 ?v10) (pred_6 ?v9) (pred_5 ?v5)
          (pred_12 ?v2 ?v10) (pred_1 ?v9 ?v5)
                   (pred_4 ?v10 ?v5) (pred_8 ?v2) 
                   (pred_7 ?v10) (pred_3 ?v9))
:effect (and  (pred_9 ?v10) (not (pred_7 ?v10))))


(:action op_1
:parameters (?v2 ?v6)
:precondition (and (pred_2 ?v2) (pred_2 ?v6)
               (pred_8 ?v2) (pred_12 ?v2 ?v6) (pred_9 ?v6))
:effect (and (pred_8 ?v6) (not (pred_8 ?v2))))

(:action op_3
:parameters (?v2 ?v9)
:precondition (and (pred_2 ?v2) (pred_6 ?v9) 
                  (pred_8 ?v2) (pred_10 ?v9 ?v2) (pred_11 ))
:effect (and (pred_3 ?v9)
   (not (pred_10 ?v9 ?v2)) (not (pred_11 ))))


(:action op_2
:parameters (?v2 ?v1 ?v7)
:precondition (and (pred_2 ?v2) (pred_6 ?v1) (pred_6 ?v7)
                  (pred_8 ?v2) (pred_3 ?v7) (pred_10 ?v1 ?v2))
:effect (and (pred_3 ?v1) (pred_10 ?v7 ?v2)
        (not (pred_3 ?v7)) (not (pred_10 ?v1 ?v2))))

(:action op_5
:parameters (?v2 ?v9)
:precondition (and (pred_2 ?v2) (pred_6 ?v9) 
                  (pred_8 ?v2) (pred_3 ?v9))
:effect (and (pred_11 ) (pred_10 ?v9 ?v2) (not (pred_3 ?v9)))))


	
