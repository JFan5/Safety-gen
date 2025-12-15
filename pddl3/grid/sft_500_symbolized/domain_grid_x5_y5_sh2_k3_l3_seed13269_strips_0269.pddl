(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v7 ?v12)
             (pred_12 ?v9 ?v5)
             (pred_4 ?v7 ?v5)
             (pred_6 ?v11 ?v7 )
	     (pred_10 ?v7)
             (pred_8 ?v13)
             (pred_7 ?v9)
             (pred_3 ?v5)
             (pred_9 ?v7)
             (pred_2 ?v9)
             (pred_11 ?v7)
             (pred_1 ))



(:action op_5
:parameters (?v2 ?v6 ?v1 ?v4)
:precondition (and (pred_8 ?v2) (pred_8 ?v6) (pred_7 ?v1) (pred_3 ?v4)
          (pred_5 ?v2 ?v6) (pred_12 ?v1 ?v4)
                   (pred_4 ?v6 ?v4) (pred_10 ?v2) 
                   (pred_9 ?v6) (pred_2 ?v1))
:effect (and  (pred_11 ?v6) (not (pred_9 ?v6))))


(:action op_4
:parameters (?v2 ?v3)
:precondition (and (pred_8 ?v2) (pred_8 ?v3)
               (pred_10 ?v2) (pred_5 ?v2 ?v3) (pred_11 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v2))))

(:action op_3
:parameters (?v2 ?v1)
:precondition (and (pred_8 ?v2) (pred_7 ?v1) 
                  (pred_10 ?v2) (pred_6 ?v1 ?v2) (pred_1 ))
:effect (and (pred_2 ?v1)
   (not (pred_6 ?v1 ?v2)) (not (pred_1 ))))


(:action op_1
:parameters (?v2 ?v8 ?v10)
:precondition (and (pred_8 ?v2) (pred_7 ?v8) (pred_7 ?v10)
                  (pred_10 ?v2) (pred_2 ?v10) (pred_6 ?v8 ?v2))
:effect (and (pred_2 ?v8) (pred_6 ?v10 ?v2)
        (not (pred_2 ?v10)) (not (pred_6 ?v8 ?v2))))

(:action op_2
:parameters (?v2 ?v1)
:precondition (and (pred_8 ?v2) (pred_7 ?v1) 
                  (pred_10 ?v2) (pred_2 ?v1))
:effect (and (pred_1 ) (pred_6 ?v1 ?v2) (not (pred_2 ?v1)))))


	
