(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v11 ?v13)
             (pred_10 ?v5 ?v1)
             (pred_8 ?v11 ?v1)
             (pred_12 ?v9 ?v11 )
	     (pred_1 ?v11)
             (pred_7 ?v12)
             (pred_9 ?v5)
             (pred_2 ?v1)
             (pred_6 ?v11)
             (pred_11 ?v5)
             (pred_3 ?v11)
             (pred_5 ))



(:action op_1
:parameters (?v2 ?v6 ?v7 ?v10)
:precondition (and (pred_7 ?v2) (pred_7 ?v6) (pred_9 ?v7) (pred_2 ?v10)
          (pred_4 ?v2 ?v6) (pred_10 ?v7 ?v10)
                   (pred_8 ?v6 ?v10) (pred_1 ?v2) 
                   (pred_6 ?v6) (pred_11 ?v7))
:effect (and  (pred_3 ?v6) (not (pred_6 ?v6))))


(:action op_4
:parameters (?v2 ?v3)
:precondition (and (pred_7 ?v2) (pred_7 ?v3)
               (pred_1 ?v2) (pred_4 ?v2 ?v3) (pred_3 ?v3))
:effect (and (pred_1 ?v3) (not (pred_1 ?v2))))

(:action op_5
:parameters (?v2 ?v7)
:precondition (and (pred_7 ?v2) (pred_9 ?v7) 
                  (pred_1 ?v2) (pred_12 ?v7 ?v2) (pred_5 ))
:effect (and (pred_11 ?v7)
   (not (pred_12 ?v7 ?v2)) (not (pred_5 ))))


(:action op_2
:parameters (?v2 ?v8 ?v4)
:precondition (and (pred_7 ?v2) (pred_9 ?v8) (pred_9 ?v4)
                  (pred_1 ?v2) (pred_11 ?v4) (pred_12 ?v8 ?v2))
:effect (and (pred_11 ?v8) (pred_12 ?v4 ?v2)
        (not (pred_11 ?v4)) (not (pred_12 ?v8 ?v2))))

(:action op_3
:parameters (?v2 ?v7)
:precondition (and (pred_7 ?v2) (pred_9 ?v7) 
                  (pred_1 ?v2) (pred_11 ?v7))
:effect (and (pred_5 ) (pred_12 ?v7 ?v2) (not (pred_11 ?v7)))))


	
