(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v3)
             (pred_11 ?v5 ?v9)
             (pred_8 ?v4 ?v9)
             (pred_4 ?v11 ?v4 )
	     (pred_2 ?v4)
             (pred_7 ?v8)
             (pred_1 ?v5)
             (pred_3 ?v9)
             (pred_6 ?v4)
             (pred_5 ?v5)
             (pred_12 ?v4)
             (pred_9 ))



(:action op_1
:parameters (?v2 ?v10 ?v6 ?v1)
:precondition (and (pred_7 ?v2) (pred_7 ?v10) (pred_1 ?v6) (pred_3 ?v1)
          (pred_10 ?v2 ?v10) (pred_11 ?v6 ?v1)
                   (pred_8 ?v10 ?v1) (pred_2 ?v2) 
                   (pred_6 ?v10) (pred_5 ?v6))
:effect (and  (pred_12 ?v10) (not (pred_6 ?v10))))


(:action op_2
:parameters (?v2 ?v12)
:precondition (and (pred_7 ?v2) (pred_7 ?v12)
               (pred_2 ?v2) (pred_10 ?v2 ?v12) (pred_12 ?v12))
:effect (and (pred_2 ?v12) (not (pred_2 ?v2))))

(:action op_5
:parameters (?v2 ?v6)
:precondition (and (pred_7 ?v2) (pred_1 ?v6) 
                  (pred_2 ?v2) (pred_4 ?v6 ?v2) (pred_9 ))
:effect (and (pred_5 ?v6)
   (not (pred_4 ?v6 ?v2)) (not (pred_9 ))))


(:action op_3
:parameters (?v2 ?v13 ?v7)
:precondition (and (pred_7 ?v2) (pred_1 ?v13) (pred_1 ?v7)
                  (pred_2 ?v2) (pred_5 ?v7) (pred_4 ?v13 ?v2))
:effect (and (pred_5 ?v13) (pred_4 ?v7 ?v2)
        (not (pred_5 ?v7)) (not (pred_4 ?v13 ?v2))))

(:action op_4
:parameters (?v2 ?v6)
:precondition (and (pred_7 ?v2) (pred_1 ?v6) 
                  (pred_2 ?v2) (pred_5 ?v6))
:effect (and (pred_9 ) (pred_4 ?v6 ?v2) (not (pred_5 ?v6)))))


	
