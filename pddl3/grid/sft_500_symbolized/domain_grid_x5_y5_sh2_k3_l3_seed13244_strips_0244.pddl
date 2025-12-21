(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v11 ?v1)
             (pred_11 ?v8 ?v9)
             (pred_4 ?v11 ?v9)
             (pred_5 ?v6 ?v11 )
	     (pred_7 ?v11)
             (pred_3 ?v3)
             (pred_12 ?v8)
             (pred_2 ?v9)
             (pred_6 ?v11)
             (pred_9 ?v8)
             (pred_8 ?v11)
             (pred_10 ))



(:action op_3
:parameters (?v7 ?v2 ?v10 ?v4)
:precondition (and (pred_3 ?v7) (pred_3 ?v2) (pred_12 ?v10) (pred_2 ?v4)
          (pred_1 ?v7 ?v2) (pred_11 ?v10 ?v4)
                   (pred_4 ?v2 ?v4) (pred_7 ?v7) 
                   (pred_6 ?v2) (pred_9 ?v10))
:effect (and  (pred_8 ?v2) (not (pred_6 ?v2))))


(:action op_1
:parameters (?v7 ?v5)
:precondition (and (pred_3 ?v7) (pred_3 ?v5)
               (pred_7 ?v7) (pred_1 ?v7 ?v5) (pred_8 ?v5))
:effect (and (pred_7 ?v5) (not (pred_7 ?v7))))

(:action op_5
:parameters (?v7 ?v10)
:precondition (and (pred_3 ?v7) (pred_12 ?v10) 
                  (pred_7 ?v7) (pred_5 ?v10 ?v7) (pred_10 ))
:effect (and (pred_9 ?v10)
   (not (pred_5 ?v10 ?v7)) (not (pred_10 ))))


(:action op_4
:parameters (?v7 ?v13 ?v12)
:precondition (and (pred_3 ?v7) (pred_12 ?v13) (pred_12 ?v12)
                  (pred_7 ?v7) (pred_9 ?v12) (pred_5 ?v13 ?v7))
:effect (and (pred_9 ?v13) (pred_5 ?v12 ?v7)
        (not (pred_9 ?v12)) (not (pred_5 ?v13 ?v7))))

(:action op_2
:parameters (?v7 ?v10)
:precondition (and (pred_3 ?v7) (pred_12 ?v10) 
                  (pred_7 ?v7) (pred_9 ?v10))
:effect (and (pred_10 ) (pred_5 ?v10 ?v7) (not (pred_9 ?v10)))))


	
