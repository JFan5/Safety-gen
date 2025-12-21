(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v12)
             (pred_7 ?v8 ?v3)
             (pred_6 ?v9 ?v3)
             (pred_3 ?v1 ?v9 )
	     (pred_2 ?v9)
             (pred_12 ?v11)
             (pred_5 ?v8)
             (pred_9 ?v3)
             (pred_1 ?v9)
             (pred_11 ?v8)
             (pred_4 ?v9)
             (pred_8 ))



(:action op_3
:parameters (?v2 ?v6 ?v4 ?v13)
:precondition (and (pred_12 ?v2) (pred_12 ?v6) (pred_5 ?v4) (pred_9 ?v13)
          (pred_10 ?v2 ?v6) (pred_7 ?v4 ?v13)
                   (pred_6 ?v6 ?v13) (pred_2 ?v2) 
                   (pred_1 ?v6) (pred_11 ?v4))
:effect (and  (pred_4 ?v6) (not (pred_1 ?v6))))


(:action op_1
:parameters (?v2 ?v10)
:precondition (and (pred_12 ?v2) (pred_12 ?v10)
               (pred_2 ?v2) (pred_10 ?v2 ?v10) (pred_4 ?v10))
:effect (and (pred_2 ?v10) (not (pred_2 ?v2))))

(:action op_4
:parameters (?v2 ?v4)
:precondition (and (pred_12 ?v2) (pred_5 ?v4) 
                  (pred_2 ?v2) (pred_3 ?v4 ?v2) (pred_8 ))
:effect (and (pred_11 ?v4)
   (not (pred_3 ?v4 ?v2)) (not (pred_8 ))))


(:action op_2
:parameters (?v2 ?v5 ?v7)
:precondition (and (pred_12 ?v2) (pred_5 ?v5) (pred_5 ?v7)
                  (pred_2 ?v2) (pred_11 ?v7) (pred_3 ?v5 ?v2))
:effect (and (pred_11 ?v5) (pred_3 ?v7 ?v2)
        (not (pred_11 ?v7)) (not (pred_3 ?v5 ?v2))))

(:action op_5
:parameters (?v2 ?v4)
:precondition (and (pred_12 ?v2) (pred_5 ?v4) 
                  (pred_2 ?v2) (pred_11 ?v4))
:effect (and (pred_8 ) (pred_3 ?v4 ?v2) (not (pred_11 ?v4)))))


	
