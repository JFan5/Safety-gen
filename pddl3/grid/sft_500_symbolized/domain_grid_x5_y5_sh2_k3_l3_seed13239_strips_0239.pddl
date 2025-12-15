(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v1)
             (pred_5 ?v7 ?v3)
             (pred_12 ?v4 ?v3)
             (pred_9 ?v5 ?v4 )
	     (pred_8 ?v4)
             (pred_2 ?v6)
             (pred_4 ?v7)
             (pred_6 ?v3)
             (pred_3 ?v4)
             (pred_1 ?v7)
             (pred_11 ?v4)
             (pred_7 ))



(:action op_2
:parameters (?v2 ?v13 ?v8 ?v9)
:precondition (and (pred_2 ?v2) (pred_2 ?v13) (pred_4 ?v8) (pred_6 ?v9)
          (pred_10 ?v2 ?v13) (pred_5 ?v8 ?v9)
                   (pred_12 ?v13 ?v9) (pred_8 ?v2) 
                   (pred_3 ?v13) (pred_1 ?v8))
:effect (and  (pred_11 ?v13) (not (pred_3 ?v13))))


(:action op_3
:parameters (?v2 ?v12)
:precondition (and (pred_2 ?v2) (pred_2 ?v12)
               (pred_8 ?v2) (pred_10 ?v2 ?v12) (pred_11 ?v12))
:effect (and (pred_8 ?v12) (not (pred_8 ?v2))))

(:action op_5
:parameters (?v2 ?v8)
:precondition (and (pred_2 ?v2) (pred_4 ?v8) 
                  (pred_8 ?v2) (pred_9 ?v8 ?v2) (pred_7 ))
:effect (and (pred_1 ?v8)
   (not (pred_9 ?v8 ?v2)) (not (pred_7 ))))


(:action op_4
:parameters (?v2 ?v11 ?v10)
:precondition (and (pred_2 ?v2) (pred_4 ?v11) (pred_4 ?v10)
                  (pred_8 ?v2) (pred_1 ?v10) (pred_9 ?v11 ?v2))
:effect (and (pred_1 ?v11) (pred_9 ?v10 ?v2)
        (not (pred_1 ?v10)) (not (pred_9 ?v11 ?v2))))

(:action op_1
:parameters (?v2 ?v8)
:precondition (and (pred_2 ?v2) (pred_4 ?v8) 
                  (pred_8 ?v2) (pred_1 ?v8))
:effect (and (pred_7 ) (pred_9 ?v8 ?v2) (not (pred_1 ?v8)))))


	
