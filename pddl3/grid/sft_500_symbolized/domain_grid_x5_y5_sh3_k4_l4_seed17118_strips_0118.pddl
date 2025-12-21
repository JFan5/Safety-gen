(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v8 ?v11)
             (pred_6 ?v9 ?v1)
             (pred_8 ?v8 ?v1)
             (pred_2 ?v4 ?v8 )
	     (pred_1 ?v8)
             (pred_7 ?v3)
             (pred_9 ?v9)
             (pred_11 ?v1)
             (pred_3 ?v8)
             (pred_12 ?v9)
             (pred_5 ?v8)
             (pred_4 ))



(:action op_1
:parameters (?v2 ?v7 ?v10 ?v6)
:precondition (and (pred_7 ?v2) (pred_7 ?v7) (pred_9 ?v10) (pred_11 ?v6)
          (pred_10 ?v2 ?v7) (pred_6 ?v10 ?v6)
                   (pred_8 ?v7 ?v6) (pred_1 ?v2) 
                   (pred_3 ?v7) (pred_12 ?v10))
:effect (and  (pred_5 ?v7) (not (pred_3 ?v7))))


(:action op_2
:parameters (?v2 ?v12)
:precondition (and (pred_7 ?v2) (pred_7 ?v12)
               (pred_1 ?v2) (pred_10 ?v2 ?v12) (pred_5 ?v12))
:effect (and (pred_1 ?v12) (not (pred_1 ?v2))))

(:action op_4
:parameters (?v2 ?v10)
:precondition (and (pred_7 ?v2) (pred_9 ?v10) 
                  (pred_1 ?v2) (pred_2 ?v10 ?v2) (pred_4 ))
:effect (and (pred_12 ?v10)
   (not (pred_2 ?v10 ?v2)) (not (pred_4 ))))


(:action op_5
:parameters (?v2 ?v5 ?v13)
:precondition (and (pred_7 ?v2) (pred_9 ?v5) (pred_9 ?v13)
                  (pred_1 ?v2) (pred_12 ?v13) (pred_2 ?v5 ?v2))
:effect (and (pred_12 ?v5) (pred_2 ?v13 ?v2)
        (not (pred_12 ?v13)) (not (pred_2 ?v5 ?v2))))

(:action op_3
:parameters (?v2 ?v10)
:precondition (and (pred_7 ?v2) (pred_9 ?v10) 
                  (pred_1 ?v2) (pred_12 ?v10))
:effect (and (pred_4 ) (pred_2 ?v10 ?v2) (not (pred_12 ?v10)))))


	
