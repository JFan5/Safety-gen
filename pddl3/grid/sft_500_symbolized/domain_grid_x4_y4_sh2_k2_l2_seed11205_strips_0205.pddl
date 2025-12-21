(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v9 ?v12)
             (pred_4 ?v2 ?v13)
             (pred_10 ?v9 ?v13)
             (pred_12 ?v3 ?v9 )
	     (pred_3 ?v9)
             (pred_6 ?v7)
             (pred_11 ?v2)
             (pred_7 ?v13)
             (pred_9 ?v9)
             (pred_1 ?v2)
             (pred_2 ?v9)
             (pred_8 ))



(:action op_3
:parameters (?v4 ?v6 ?v11 ?v8)
:precondition (and (pred_6 ?v4) (pred_6 ?v6) (pred_11 ?v11) (pred_7 ?v8)
          (pred_5 ?v4 ?v6) (pred_4 ?v11 ?v8)
                   (pred_10 ?v6 ?v8) (pred_3 ?v4) 
                   (pred_9 ?v6) (pred_1 ?v11))
:effect (and  (pred_2 ?v6) (not (pred_9 ?v6))))


(:action op_5
:parameters (?v4 ?v10)
:precondition (and (pred_6 ?v4) (pred_6 ?v10)
               (pred_3 ?v4) (pred_5 ?v4 ?v10) (pred_2 ?v10))
:effect (and (pred_3 ?v10) (not (pred_3 ?v4))))

(:action op_2
:parameters (?v4 ?v11)
:precondition (and (pred_6 ?v4) (pred_11 ?v11) 
                  (pred_3 ?v4) (pred_12 ?v11 ?v4) (pred_8 ))
:effect (and (pred_1 ?v11)
   (not (pred_12 ?v11 ?v4)) (not (pred_8 ))))


(:action op_1
:parameters (?v4 ?v5 ?v1)
:precondition (and (pred_6 ?v4) (pred_11 ?v5) (pred_11 ?v1)
                  (pred_3 ?v4) (pred_1 ?v1) (pred_12 ?v5 ?v4))
:effect (and (pred_1 ?v5) (pred_12 ?v1 ?v4)
        (not (pred_1 ?v1)) (not (pred_12 ?v5 ?v4))))

(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_6 ?v4) (pred_11 ?v11) 
                  (pred_3 ?v4) (pred_1 ?v11))
:effect (and (pred_8 ) (pred_12 ?v11 ?v4) (not (pred_1 ?v11)))))


	
