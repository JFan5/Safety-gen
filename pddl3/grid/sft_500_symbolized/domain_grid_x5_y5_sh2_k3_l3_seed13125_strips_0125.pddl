(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v13 ?v12)
             (pred_12 ?v3 ?v11)
             (pred_10 ?v13 ?v11)
             (pred_11 ?v9 ?v13 )
	     (pred_4 ?v13)
             (pred_5 ?v2)
             (pred_7 ?v3)
             (pred_2 ?v11)
             (pred_6 ?v13)
             (pred_1 ?v3)
             (pred_9 ?v13)
             (pred_3 ))



(:action op_2
:parameters (?v4 ?v8 ?v5 ?v6)
:precondition (and (pred_5 ?v4) (pred_5 ?v8) (pred_7 ?v5) (pred_2 ?v6)
          (pred_8 ?v4 ?v8) (pred_12 ?v5 ?v6)
                   (pred_10 ?v8 ?v6) (pred_4 ?v4) 
                   (pred_6 ?v8) (pred_1 ?v5))
:effect (and  (pred_9 ?v8) (not (pred_6 ?v8))))


(:action op_3
:parameters (?v4 ?v7)
:precondition (and (pred_5 ?v4) (pred_5 ?v7)
               (pred_4 ?v4) (pred_8 ?v4 ?v7) (pred_9 ?v7))
:effect (and (pred_4 ?v7) (not (pred_4 ?v4))))

(:action op_4
:parameters (?v4 ?v5)
:precondition (and (pred_5 ?v4) (pred_7 ?v5) 
                  (pred_4 ?v4) (pred_11 ?v5 ?v4) (pred_3 ))
:effect (and (pred_1 ?v5)
   (not (pred_11 ?v5 ?v4)) (not (pred_3 ))))


(:action op_5
:parameters (?v4 ?v10 ?v1)
:precondition (and (pred_5 ?v4) (pred_7 ?v10) (pred_7 ?v1)
                  (pred_4 ?v4) (pred_1 ?v1) (pred_11 ?v10 ?v4))
:effect (and (pred_1 ?v10) (pred_11 ?v1 ?v4)
        (not (pred_1 ?v1)) (not (pred_11 ?v10 ?v4))))

(:action op_1
:parameters (?v4 ?v5)
:precondition (and (pred_5 ?v4) (pred_7 ?v5) 
                  (pred_4 ?v4) (pred_1 ?v5))
:effect (and (pred_3 ) (pred_11 ?v5 ?v4) (not (pred_1 ?v5)))))


	
