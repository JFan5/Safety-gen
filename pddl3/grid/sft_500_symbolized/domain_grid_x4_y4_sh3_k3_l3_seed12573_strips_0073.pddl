(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v2 ?v7)
             (pred_5 ?v6 ?v13)
             (pred_8 ?v2 ?v13)
             (pred_9 ?v11 ?v2 )
	     (pred_6 ?v2)
             (pred_10 ?v9)
             (pred_3 ?v6)
             (pred_7 ?v13)
             (pred_11 ?v2)
             (pred_1 ?v6)
             (pred_2 ?v2)
             (pred_12 ))



(:action op_2
:parameters (?v3 ?v1 ?v4 ?v10)
:precondition (and (pred_10 ?v3) (pred_10 ?v1) (pred_3 ?v4) (pred_7 ?v10)
          (pred_4 ?v3 ?v1) (pred_5 ?v4 ?v10)
                   (pred_8 ?v1 ?v10) (pred_6 ?v3) 
                   (pred_11 ?v1) (pred_1 ?v4))
:effect (and  (pred_2 ?v1) (not (pred_11 ?v1))))


(:action op_3
:parameters (?v3 ?v12)
:precondition (and (pred_10 ?v3) (pred_10 ?v12)
               (pred_6 ?v3) (pred_4 ?v3 ?v12) (pred_2 ?v12))
:effect (and (pred_6 ?v12) (not (pred_6 ?v3))))

(:action op_4
:parameters (?v3 ?v4)
:precondition (and (pred_10 ?v3) (pred_3 ?v4) 
                  (pred_6 ?v3) (pred_9 ?v4 ?v3) (pred_12 ))
:effect (and (pred_1 ?v4)
   (not (pred_9 ?v4 ?v3)) (not (pred_12 ))))


(:action op_5
:parameters (?v3 ?v5 ?v8)
:precondition (and (pred_10 ?v3) (pred_3 ?v5) (pred_3 ?v8)
                  (pred_6 ?v3) (pred_1 ?v8) (pred_9 ?v5 ?v3))
:effect (and (pred_1 ?v5) (pred_9 ?v8 ?v3)
        (not (pred_1 ?v8)) (not (pred_9 ?v5 ?v3))))

(:action op_1
:parameters (?v3 ?v4)
:precondition (and (pred_10 ?v3) (pred_3 ?v4) 
                  (pred_6 ?v3) (pred_1 ?v4))
:effect (and (pred_12 ) (pred_9 ?v4 ?v3) (not (pred_1 ?v4)))))


	
