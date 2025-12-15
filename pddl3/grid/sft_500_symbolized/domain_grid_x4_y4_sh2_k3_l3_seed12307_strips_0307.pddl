(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v10 ?v11)
             (pred_10 ?v6 ?v7)
             (pred_8 ?v10 ?v7)
             (pred_12 ?v8 ?v10 )
	     (pred_3 ?v10)
             (pred_2 ?v13)
             (pred_7 ?v6)
             (pred_6 ?v7)
             (pred_4 ?v10)
             (pred_5 ?v6)
             (pred_1 ?v10)
             (pred_11 ))



(:action op_2
:parameters (?v3 ?v5 ?v2 ?v4)
:precondition (and (pred_2 ?v3) (pred_2 ?v5) (pred_7 ?v2) (pred_6 ?v4)
          (pred_9 ?v3 ?v5) (pred_10 ?v2 ?v4)
                   (pred_8 ?v5 ?v4) (pred_3 ?v3) 
                   (pred_4 ?v5) (pred_5 ?v2))
:effect (and  (pred_1 ?v5) (not (pred_4 ?v5))))


(:action op_4
:parameters (?v3 ?v12)
:precondition (and (pred_2 ?v3) (pred_2 ?v12)
               (pred_3 ?v3) (pred_9 ?v3 ?v12) (pred_1 ?v12))
:effect (and (pred_3 ?v12) (not (pred_3 ?v3))))

(:action op_1
:parameters (?v3 ?v2)
:precondition (and (pred_2 ?v3) (pred_7 ?v2) 
                  (pred_3 ?v3) (pred_12 ?v2 ?v3) (pred_11 ))
:effect (and (pred_5 ?v2)
   (not (pred_12 ?v2 ?v3)) (not (pred_11 ))))


(:action op_3
:parameters (?v3 ?v9 ?v1)
:precondition (and (pred_2 ?v3) (pred_7 ?v9) (pred_7 ?v1)
                  (pred_3 ?v3) (pred_5 ?v1) (pred_12 ?v9 ?v3))
:effect (and (pred_5 ?v9) (pred_12 ?v1 ?v3)
        (not (pred_5 ?v1)) (not (pred_12 ?v9 ?v3))))

(:action op_5
:parameters (?v3 ?v2)
:precondition (and (pred_2 ?v3) (pred_7 ?v2) 
                  (pred_3 ?v3) (pred_5 ?v2))
:effect (and (pred_11 ) (pred_12 ?v2 ?v3) (not (pred_5 ?v2)))))


	
