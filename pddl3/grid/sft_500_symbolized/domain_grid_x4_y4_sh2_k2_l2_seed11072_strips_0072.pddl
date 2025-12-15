(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v13)
             (pred_11 ?v7 ?v8)
             (pred_12 ?v4 ?v8)
             (pred_3 ?v10 ?v4 )
	     (pred_2 ?v4)
             (pred_7 ?v11)
             (pred_1 ?v7)
             (pred_5 ?v8)
             (pred_6 ?v4)
             (pred_4 ?v7)
             (pred_9 ?v4)
             (pred_8 ))



(:action op_3
:parameters (?v2 ?v5 ?v9 ?v6)
:precondition (and (pred_7 ?v2) (pred_7 ?v5) (pred_1 ?v9) (pred_5 ?v6)
          (pred_10 ?v2 ?v5) (pred_11 ?v9 ?v6)
                   (pred_12 ?v5 ?v6) (pred_2 ?v2) 
                   (pred_6 ?v5) (pred_4 ?v9))
:effect (and  (pred_9 ?v5) (not (pred_6 ?v5))))


(:action op_2
:parameters (?v2 ?v3)
:precondition (and (pred_7 ?v2) (pred_7 ?v3)
               (pred_2 ?v2) (pred_10 ?v2 ?v3) (pred_9 ?v3))
:effect (and (pred_2 ?v3) (not (pred_2 ?v2))))

(:action op_1
:parameters (?v2 ?v9)
:precondition (and (pred_7 ?v2) (pred_1 ?v9) 
                  (pred_2 ?v2) (pred_3 ?v9 ?v2) (pred_8 ))
:effect (and (pred_4 ?v9)
   (not (pred_3 ?v9 ?v2)) (not (pred_8 ))))


(:action op_4
:parameters (?v2 ?v1 ?v12)
:precondition (and (pred_7 ?v2) (pred_1 ?v1) (pred_1 ?v12)
                  (pred_2 ?v2) (pred_4 ?v12) (pred_3 ?v1 ?v2))
:effect (and (pred_4 ?v1) (pred_3 ?v12 ?v2)
        (not (pred_4 ?v12)) (not (pred_3 ?v1 ?v2))))

(:action op_5
:parameters (?v2 ?v9)
:precondition (and (pred_7 ?v2) (pred_1 ?v9) 
                  (pred_2 ?v2) (pred_4 ?v9))
:effect (and (pred_8 ) (pred_3 ?v9 ?v2) (not (pred_4 ?v9)))))


	
