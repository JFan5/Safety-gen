(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v11 ?v9)
             (pred_2 ?v5 ?v2)
             (pred_5 ?v11 ?v2)
             (pred_7 ?v3 ?v11 )
	     (pred_12 ?v11)
             (pred_9 ?v8)
             (pred_10 ?v5)
             (pred_3 ?v2)
             (pred_11 ?v11)
             (pred_4 ?v5)
             (pred_6 ?v11)
             (pred_1 ))



(:action op_1
:parameters (?v4 ?v10 ?v12 ?v7)
:precondition (and (pred_9 ?v4) (pred_9 ?v10) (pred_10 ?v12) (pred_3 ?v7)
          (pred_8 ?v4 ?v10) (pred_2 ?v12 ?v7)
                   (pred_5 ?v10 ?v7) (pred_12 ?v4) 
                   (pred_11 ?v10) (pred_4 ?v12))
:effect (and  (pred_6 ?v10) (not (pred_11 ?v10))))


(:action op_5
:parameters (?v4 ?v6)
:precondition (and (pred_9 ?v4) (pred_9 ?v6)
               (pred_12 ?v4) (pred_8 ?v4 ?v6) (pred_6 ?v6))
:effect (and (pred_12 ?v6) (not (pred_12 ?v4))))

(:action op_3
:parameters (?v4 ?v12)
:precondition (and (pred_9 ?v4) (pred_10 ?v12) 
                  (pred_12 ?v4) (pred_7 ?v12 ?v4) (pred_1 ))
:effect (and (pred_4 ?v12)
   (not (pred_7 ?v12 ?v4)) (not (pred_1 ))))


(:action op_2
:parameters (?v4 ?v1 ?v13)
:precondition (and (pred_9 ?v4) (pred_10 ?v1) (pred_10 ?v13)
                  (pred_12 ?v4) (pred_4 ?v13) (pred_7 ?v1 ?v4))
:effect (and (pred_4 ?v1) (pred_7 ?v13 ?v4)
        (not (pred_4 ?v13)) (not (pred_7 ?v1 ?v4))))

(:action op_4
:parameters (?v4 ?v12)
:precondition (and (pred_9 ?v4) (pred_10 ?v12) 
                  (pred_12 ?v4) (pred_4 ?v12))
:effect (and (pred_1 ) (pred_7 ?v12 ?v4) (not (pred_4 ?v12)))))


	
