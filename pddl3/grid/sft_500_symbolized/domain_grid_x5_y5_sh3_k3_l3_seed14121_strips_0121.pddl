(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v12 ?v7)
             (pred_7 ?v4 ?v11)
             (pred_3 ?v12 ?v11)
             (pred_4 ?v1 ?v12 )
	     (pred_8 ?v12)
             (pred_9 ?v13)
             (pred_1 ?v4)
             (pred_12 ?v11)
             (pred_10 ?v12)
             (pred_2 ?v4)
             (pred_6 ?v12)
             (pred_11 ))



(:action op_5
:parameters (?v5 ?v2 ?v3 ?v6)
:precondition (and (pred_9 ?v5) (pred_9 ?v2) (pred_1 ?v3) (pred_12 ?v6)
          (pred_5 ?v5 ?v2) (pred_7 ?v3 ?v6)
                   (pred_3 ?v2 ?v6) (pred_8 ?v5) 
                   (pred_10 ?v2) (pred_2 ?v3))
:effect (and  (pred_6 ?v2) (not (pred_10 ?v2))))


(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_9 ?v5) (pred_9 ?v9)
               (pred_8 ?v5) (pred_5 ?v5 ?v9) (pred_6 ?v9))
:effect (and (pred_8 ?v9) (not (pred_8 ?v5))))

(:action op_1
:parameters (?v5 ?v3)
:precondition (and (pred_9 ?v5) (pred_1 ?v3) 
                  (pred_8 ?v5) (pred_4 ?v3 ?v5) (pred_11 ))
:effect (and (pred_2 ?v3)
   (not (pred_4 ?v3 ?v5)) (not (pred_11 ))))


(:action op_2
:parameters (?v5 ?v10 ?v8)
:precondition (and (pred_9 ?v5) (pred_1 ?v10) (pred_1 ?v8)
                  (pred_8 ?v5) (pred_2 ?v8) (pred_4 ?v10 ?v5))
:effect (and (pred_2 ?v10) (pred_4 ?v8 ?v5)
        (not (pred_2 ?v8)) (not (pred_4 ?v10 ?v5))))

(:action op_3
:parameters (?v5 ?v3)
:precondition (and (pred_9 ?v5) (pred_1 ?v3) 
                  (pred_8 ?v5) (pred_2 ?v3))
:effect (and (pred_11 ) (pred_4 ?v3 ?v5) (not (pred_2 ?v3)))))


	
