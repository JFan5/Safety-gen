(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v1 ?v8)
             (pred_11 ?v9 ?v13)
             (pred_7 ?v1 ?v13)
             (pred_5 ?v3 ?v1 )
	     (pred_3 ?v1)
             (pred_9 ?v12)
             (pred_8 ?v9)
             (pred_6 ?v13)
             (pred_1 ?v1)
             (pred_12 ?v9)
             (pred_10 ?v1)
             (pred_4 ))



(:action op_1
:parameters (?v4 ?v10 ?v6 ?v2)
:precondition (and (pred_9 ?v4) (pred_9 ?v10) (pred_8 ?v6) (pred_6 ?v2)
          (pred_2 ?v4 ?v10) (pred_11 ?v6 ?v2)
                   (pred_7 ?v10 ?v2) (pred_3 ?v4) 
                   (pred_1 ?v10) (pred_12 ?v6))
:effect (and  (pred_10 ?v10) (not (pred_1 ?v10))))


(:action op_3
:parameters (?v4 ?v5)
:precondition (and (pred_9 ?v4) (pred_9 ?v5)
               (pred_3 ?v4) (pred_2 ?v4 ?v5) (pred_10 ?v5))
:effect (and (pred_3 ?v5) (not (pred_3 ?v4))))

(:action op_2
:parameters (?v4 ?v6)
:precondition (and (pred_9 ?v4) (pred_8 ?v6) 
                  (pred_3 ?v4) (pred_5 ?v6 ?v4) (pred_4 ))
:effect (and (pred_12 ?v6)
   (not (pred_5 ?v6 ?v4)) (not (pred_4 ))))


(:action op_4
:parameters (?v4 ?v11 ?v7)
:precondition (and (pred_9 ?v4) (pred_8 ?v11) (pred_8 ?v7)
                  (pred_3 ?v4) (pred_12 ?v7) (pred_5 ?v11 ?v4))
:effect (and (pred_12 ?v11) (pred_5 ?v7 ?v4)
        (not (pred_12 ?v7)) (not (pred_5 ?v11 ?v4))))

(:action op_5
:parameters (?v4 ?v6)
:precondition (and (pred_9 ?v4) (pred_8 ?v6) 
                  (pred_3 ?v4) (pred_12 ?v6))
:effect (and (pred_4 ) (pred_5 ?v6 ?v4) (not (pred_12 ?v6)))))


	
