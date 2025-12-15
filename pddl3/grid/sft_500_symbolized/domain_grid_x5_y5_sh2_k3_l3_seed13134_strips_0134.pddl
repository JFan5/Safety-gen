(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v11 ?v7)
             (pred_7 ?v12 ?v13)
             (pred_1 ?v11 ?v13)
             (pred_3 ?v3 ?v11 )
	     (pred_6 ?v11)
             (pred_10 ?v10)
             (pred_9 ?v12)
             (pred_4 ?v13)
             (pred_5 ?v11)
             (pred_8 ?v12)
             (pred_2 ?v11)
             (pred_12 ))



(:action op_2
:parameters (?v4 ?v2 ?v6 ?v8)
:precondition (and (pred_10 ?v4) (pred_10 ?v2) (pred_9 ?v6) (pred_4 ?v8)
          (pred_11 ?v4 ?v2) (pred_7 ?v6 ?v8)
                   (pred_1 ?v2 ?v8) (pred_6 ?v4) 
                   (pred_5 ?v2) (pred_8 ?v6))
:effect (and  (pred_2 ?v2) (not (pred_5 ?v2))))


(:action op_5
:parameters (?v4 ?v1)
:precondition (and (pred_10 ?v4) (pred_10 ?v1)
               (pred_6 ?v4) (pred_11 ?v4 ?v1) (pred_2 ?v1))
:effect (and (pred_6 ?v1) (not (pred_6 ?v4))))

(:action op_1
:parameters (?v4 ?v6)
:precondition (and (pred_10 ?v4) (pred_9 ?v6) 
                  (pred_6 ?v4) (pred_3 ?v6 ?v4) (pred_12 ))
:effect (and (pred_8 ?v6)
   (not (pred_3 ?v6 ?v4)) (not (pred_12 ))))


(:action op_3
:parameters (?v4 ?v5 ?v9)
:precondition (and (pred_10 ?v4) (pred_9 ?v5) (pred_9 ?v9)
                  (pred_6 ?v4) (pred_8 ?v9) (pred_3 ?v5 ?v4))
:effect (and (pred_8 ?v5) (pred_3 ?v9 ?v4)
        (not (pred_8 ?v9)) (not (pred_3 ?v5 ?v4))))

(:action op_4
:parameters (?v4 ?v6)
:precondition (and (pred_10 ?v4) (pred_9 ?v6) 
                  (pred_6 ?v4) (pred_8 ?v6))
:effect (and (pred_12 ) (pred_3 ?v6 ?v4) (not (pred_8 ?v6)))))


	
