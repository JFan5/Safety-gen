(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v10 ?v9)
             (pred_6 ?v7 ?v13)
             (pred_10 ?v10 ?v13)
             (pred_11 ?v12 ?v10 )
	     (pred_3 ?v10)
             (pred_12 ?v2)
             (pred_5 ?v7)
             (pred_1 ?v13)
             (pred_9 ?v10)
             (pred_8 ?v7)
             (pred_2 ?v10)
             (pred_4 ))



(:action op_1
:parameters (?v4 ?v6 ?v8 ?v3)
:precondition (and (pred_12 ?v4) (pred_12 ?v6) (pred_5 ?v8) (pred_1 ?v3)
          (pred_7 ?v4 ?v6) (pred_6 ?v8 ?v3)
                   (pred_10 ?v6 ?v3) (pred_3 ?v4) 
                   (pred_9 ?v6) (pred_8 ?v8))
:effect (and  (pred_2 ?v6) (not (pred_9 ?v6))))


(:action op_2
:parameters (?v4 ?v5)
:precondition (and (pred_12 ?v4) (pred_12 ?v5)
               (pred_3 ?v4) (pred_7 ?v4 ?v5) (pred_2 ?v5))
:effect (and (pred_3 ?v5) (not (pred_3 ?v4))))

(:action op_4
:parameters (?v4 ?v8)
:precondition (and (pred_12 ?v4) (pred_5 ?v8) 
                  (pred_3 ?v4) (pred_11 ?v8 ?v4) (pred_4 ))
:effect (and (pred_8 ?v8)
   (not (pred_11 ?v8 ?v4)) (not (pred_4 ))))


(:action op_5
:parameters (?v4 ?v1 ?v11)
:precondition (and (pred_12 ?v4) (pred_5 ?v1) (pred_5 ?v11)
                  (pred_3 ?v4) (pred_8 ?v11) (pred_11 ?v1 ?v4))
:effect (and (pred_8 ?v1) (pred_11 ?v11 ?v4)
        (not (pred_8 ?v11)) (not (pred_11 ?v1 ?v4))))

(:action op_3
:parameters (?v4 ?v8)
:precondition (and (pred_12 ?v4) (pred_5 ?v8) 
                  (pred_3 ?v4) (pred_8 ?v8))
:effect (and (pred_4 ) (pred_11 ?v8 ?v4) (not (pred_8 ?v8)))))


	
