(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v4 ?v9)
             (pred_10 ?v6 ?v11)
             (pred_12 ?v4 ?v11)
             (pred_2 ?v12 ?v4 )
	     (pred_9 ?v4)
             (pred_4 ?v13)
             (pred_11 ?v6)
             (pred_8 ?v11)
             (pred_3 ?v4)
             (pred_7 ?v6)
             (pred_6 ?v4)
             (pred_1 ))



(:action op_2
:parameters (?v2 ?v3 ?v1 ?v7)
:precondition (and (pred_4 ?v2) (pred_4 ?v3) (pred_11 ?v1) (pred_8 ?v7)
          (pred_5 ?v2 ?v3) (pred_10 ?v1 ?v7)
                   (pred_12 ?v3 ?v7) (pred_9 ?v2) 
                   (pred_3 ?v3) (pred_7 ?v1))
:effect (and  (pred_6 ?v3) (not (pred_3 ?v3))))


(:action op_3
:parameters (?v2 ?v8)
:precondition (and (pred_4 ?v2) (pred_4 ?v8)
               (pred_9 ?v2) (pred_5 ?v2 ?v8) (pred_6 ?v8))
:effect (and (pred_9 ?v8) (not (pred_9 ?v2))))

(:action op_5
:parameters (?v2 ?v1)
:precondition (and (pred_4 ?v2) (pred_11 ?v1) 
                  (pred_9 ?v2) (pred_2 ?v1 ?v2) (pred_1 ))
:effect (and (pred_7 ?v1)
   (not (pred_2 ?v1 ?v2)) (not (pred_1 ))))


(:action op_1
:parameters (?v2 ?v10 ?v5)
:precondition (and (pred_4 ?v2) (pred_11 ?v10) (pred_11 ?v5)
                  (pred_9 ?v2) (pred_7 ?v5) (pred_2 ?v10 ?v2))
:effect (and (pred_7 ?v10) (pred_2 ?v5 ?v2)
        (not (pred_7 ?v5)) (not (pred_2 ?v10 ?v2))))

(:action op_4
:parameters (?v2 ?v1)
:precondition (and (pred_4 ?v2) (pred_11 ?v1) 
                  (pred_9 ?v2) (pred_7 ?v1))
:effect (and (pred_1 ) (pred_2 ?v1 ?v2) (not (pred_7 ?v1)))))


	
