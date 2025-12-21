(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v8 ?v13)
             (pred_7 ?v10 ?v5)
             (pred_3 ?v8 ?v5)
             (pred_1 ?v7 ?v8 )
	     (pred_12 ?v8)
             (pred_10 ?v1)
             (pred_6 ?v10)
             (pred_4 ?v5)
             (pred_8 ?v8)
             (pred_2 ?v10)
             (pred_9 ?v8)
             (pred_11 ))



(:action op_5
:parameters (?v3 ?v4 ?v2 ?v6)
:precondition (and (pred_10 ?v3) (pred_10 ?v4) (pred_6 ?v2) (pred_4 ?v6)
          (pred_5 ?v3 ?v4) (pred_7 ?v2 ?v6)
                   (pred_3 ?v4 ?v6) (pred_12 ?v3) 
                   (pred_8 ?v4) (pred_2 ?v2))
:effect (and  (pred_9 ?v4) (not (pred_8 ?v4))))


(:action op_4
:parameters (?v3 ?v9)
:precondition (and (pred_10 ?v3) (pred_10 ?v9)
               (pred_12 ?v3) (pred_5 ?v3 ?v9) (pred_9 ?v9))
:effect (and (pred_12 ?v9) (not (pred_12 ?v3))))

(:action op_1
:parameters (?v3 ?v2)
:precondition (and (pred_10 ?v3) (pred_6 ?v2) 
                  (pred_12 ?v3) (pred_1 ?v2 ?v3) (pred_11 ))
:effect (and (pred_2 ?v2)
   (not (pred_1 ?v2 ?v3)) (not (pred_11 ))))


(:action op_3
:parameters (?v3 ?v12 ?v11)
:precondition (and (pred_10 ?v3) (pred_6 ?v12) (pred_6 ?v11)
                  (pred_12 ?v3) (pred_2 ?v11) (pred_1 ?v12 ?v3))
:effect (and (pred_2 ?v12) (pred_1 ?v11 ?v3)
        (not (pred_2 ?v11)) (not (pred_1 ?v12 ?v3))))

(:action op_2
:parameters (?v3 ?v2)
:precondition (and (pred_10 ?v3) (pred_6 ?v2) 
                  (pred_12 ?v3) (pred_2 ?v2))
:effect (and (pred_11 ) (pred_1 ?v2 ?v3) (not (pred_2 ?v2)))))


	
