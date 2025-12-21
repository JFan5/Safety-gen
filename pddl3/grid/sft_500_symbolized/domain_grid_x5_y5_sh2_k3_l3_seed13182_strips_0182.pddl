(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v1 ?v7)
             (pred_8 ?v8 ?v13)
             (pred_7 ?v1 ?v13)
             (pred_5 ?v12 ?v1 )
	     (pred_2 ?v1)
             (pred_6 ?v6)
             (pred_11 ?v8)
             (pred_10 ?v13)
             (pred_4 ?v1)
             (pred_9 ?v8)
             (pred_1 ?v1)
             (pred_3 ))



(:action op_5
:parameters (?v3 ?v2 ?v10 ?v5)
:precondition (and (pred_6 ?v3) (pred_6 ?v2) (pred_11 ?v10) (pred_10 ?v5)
          (pred_12 ?v3 ?v2) (pred_8 ?v10 ?v5)
                   (pred_7 ?v2 ?v5) (pred_2 ?v3) 
                   (pred_4 ?v2) (pred_9 ?v10))
:effect (and  (pred_1 ?v2) (not (pred_4 ?v2))))


(:action op_2
:parameters (?v3 ?v4)
:precondition (and (pred_6 ?v3) (pred_6 ?v4)
               (pred_2 ?v3) (pred_12 ?v3 ?v4) (pred_1 ?v4))
:effect (and (pred_2 ?v4) (not (pred_2 ?v3))))

(:action op_3
:parameters (?v3 ?v10)
:precondition (and (pred_6 ?v3) (pred_11 ?v10) 
                  (pred_2 ?v3) (pred_5 ?v10 ?v3) (pred_3 ))
:effect (and (pred_9 ?v10)
   (not (pred_5 ?v10 ?v3)) (not (pred_3 ))))


(:action op_4
:parameters (?v3 ?v9 ?v11)
:precondition (and (pred_6 ?v3) (pred_11 ?v9) (pred_11 ?v11)
                  (pred_2 ?v3) (pred_9 ?v11) (pred_5 ?v9 ?v3))
:effect (and (pred_9 ?v9) (pred_5 ?v11 ?v3)
        (not (pred_9 ?v11)) (not (pred_5 ?v9 ?v3))))

(:action op_1
:parameters (?v3 ?v10)
:precondition (and (pred_6 ?v3) (pred_11 ?v10) 
                  (pred_2 ?v3) (pred_9 ?v10))
:effect (and (pred_3 ) (pred_5 ?v10 ?v3) (not (pred_9 ?v10)))))


	
