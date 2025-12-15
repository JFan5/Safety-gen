(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v6 ?v8)
             (pred_5 ?v12 ?v13)
             (pred_8 ?v6 ?v13)
             (pred_4 ?v11 ?v6 )
	     (pred_7 ?v6)
             (pred_6 ?v2)
             (pred_3 ?v12)
             (pred_10 ?v13)
             (pred_12 ?v6)
             (pred_9 ?v12)
             (pred_2 ?v6)
             (pred_1 ))



(:action op_3
:parameters (?v5 ?v10 ?v4 ?v1)
:precondition (and (pred_6 ?v5) (pred_6 ?v10) (pred_3 ?v4) (pred_10 ?v1)
          (pred_11 ?v5 ?v10) (pred_5 ?v4 ?v1)
                   (pred_8 ?v10 ?v1) (pred_7 ?v5) 
                   (pred_12 ?v10) (pred_9 ?v4))
:effect (and  (pred_2 ?v10) (not (pred_12 ?v10))))


(:action op_2
:parameters (?v5 ?v3)
:precondition (and (pred_6 ?v5) (pred_6 ?v3)
               (pred_7 ?v5) (pred_11 ?v5 ?v3) (pred_2 ?v3))
:effect (and (pred_7 ?v3) (not (pred_7 ?v5))))

(:action op_1
:parameters (?v5 ?v4)
:precondition (and (pred_6 ?v5) (pred_3 ?v4) 
                  (pred_7 ?v5) (pred_4 ?v4 ?v5) (pred_1 ))
:effect (and (pred_9 ?v4)
   (not (pred_4 ?v4 ?v5)) (not (pred_1 ))))


(:action op_5
:parameters (?v5 ?v9 ?v7)
:precondition (and (pred_6 ?v5) (pred_3 ?v9) (pred_3 ?v7)
                  (pred_7 ?v5) (pred_9 ?v7) (pred_4 ?v9 ?v5))
:effect (and (pred_9 ?v9) (pred_4 ?v7 ?v5)
        (not (pred_9 ?v7)) (not (pred_4 ?v9 ?v5))))

(:action op_4
:parameters (?v5 ?v4)
:precondition (and (pred_6 ?v5) (pred_3 ?v4) 
                  (pred_7 ?v5) (pred_9 ?v4))
:effect (and (pred_1 ) (pred_4 ?v4 ?v5) (not (pred_9 ?v4)))))


	
