(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v11)
             (pred_10 ?v5 ?v4)
             (pred_12 ?v9 ?v4)
             (pred_3 ?v7 ?v9 )
	     (pred_9 ?v9)
             (pred_7 ?v3)
             (pred_5 ?v5)
             (pred_1 ?v4)
             (pred_6 ?v9)
             (pred_2 ?v5)
             (pred_4 ?v9)
             (pred_8 ))



(:action op_1
:parameters (?v2 ?v6 ?v1 ?v8)
:precondition (and (pred_7 ?v2) (pred_7 ?v6) (pred_5 ?v1) (pred_1 ?v8)
          (pred_11 ?v2 ?v6) (pred_10 ?v1 ?v8)
                   (pred_12 ?v6 ?v8) (pred_9 ?v2) 
                   (pred_6 ?v6) (pred_2 ?v1))
:effect (and  (pred_4 ?v6) (not (pred_6 ?v6))))


(:action op_5
:parameters (?v2 ?v12)
:precondition (and (pred_7 ?v2) (pred_7 ?v12)
               (pred_9 ?v2) (pred_11 ?v2 ?v12) (pred_4 ?v12))
:effect (and (pred_9 ?v12) (not (pred_9 ?v2))))

(:action op_2
:parameters (?v2 ?v1)
:precondition (and (pred_7 ?v2) (pred_5 ?v1) 
                  (pred_9 ?v2) (pred_3 ?v1 ?v2) (pred_8 ))
:effect (and (pred_2 ?v1)
   (not (pred_3 ?v1 ?v2)) (not (pred_8 ))))


(:action op_4
:parameters (?v2 ?v10 ?v13)
:precondition (and (pred_7 ?v2) (pred_5 ?v10) (pred_5 ?v13)
                  (pred_9 ?v2) (pred_2 ?v13) (pred_3 ?v10 ?v2))
:effect (and (pred_2 ?v10) (pred_3 ?v13 ?v2)
        (not (pred_2 ?v13)) (not (pred_3 ?v10 ?v2))))

(:action op_3
:parameters (?v2 ?v1)
:precondition (and (pred_7 ?v2) (pred_5 ?v1) 
                  (pred_9 ?v2) (pred_2 ?v1))
:effect (and (pred_8 ) (pred_3 ?v1 ?v2) (not (pred_2 ?v1)))))


	
