(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v8 ?v4)
             (pred_8 ?v11 ?v7)
             (pred_6 ?v8 ?v7)
             (pred_2 ?v10 ?v8 )
	     (pred_11 ?v8)
             (pred_5 ?v5)
             (pred_12 ?v11)
             (pred_10 ?v7)
             (pred_3 ?v8)
             (pred_9 ?v11)
             (pred_1 ?v8)
             (pred_7 ))



(:action op_4
:parameters (?v12 ?v1 ?v2 ?v9)
:precondition (and (pred_5 ?v12) (pred_5 ?v1) (pred_12 ?v2) (pred_10 ?v9)
          (pred_4 ?v12 ?v1) (pred_8 ?v2 ?v9)
                   (pred_6 ?v1 ?v9) (pred_11 ?v12) 
                   (pred_3 ?v1) (pred_9 ?v2))
:effect (and  (pred_1 ?v1) (not (pred_3 ?v1))))


(:action op_3
:parameters (?v12 ?v6)
:precondition (and (pred_5 ?v12) (pred_5 ?v6)
               (pred_11 ?v12) (pred_4 ?v12 ?v6) (pred_1 ?v6))
:effect (and (pred_11 ?v6) (not (pred_11 ?v12))))

(:action op_1
:parameters (?v12 ?v2)
:precondition (and (pred_5 ?v12) (pred_12 ?v2) 
                  (pred_11 ?v12) (pred_2 ?v2 ?v12) (pred_7 ))
:effect (and (pred_9 ?v2)
   (not (pred_2 ?v2 ?v12)) (not (pred_7 ))))


(:action op_5
:parameters (?v12 ?v13 ?v3)
:precondition (and (pred_5 ?v12) (pred_12 ?v13) (pred_12 ?v3)
                  (pred_11 ?v12) (pred_9 ?v3) (pred_2 ?v13 ?v12))
:effect (and (pred_9 ?v13) (pred_2 ?v3 ?v12)
        (not (pred_9 ?v3)) (not (pred_2 ?v13 ?v12))))

(:action op_2
:parameters (?v12 ?v2)
:precondition (and (pred_5 ?v12) (pred_12 ?v2) 
                  (pred_11 ?v12) (pred_9 ?v2))
:effect (and (pred_7 ) (pred_2 ?v2 ?v12) (not (pred_9 ?v2)))))


	
