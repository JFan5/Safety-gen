(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v3 ?v2)
             (pred_10 ?v4 ?v11)
             (pred_7 ?v3 ?v11)
             (pred_5 ?v6 ?v3 )
	     (pred_3 ?v3)
             (pred_9 ?v8)
             (pred_12 ?v4)
             (pred_8 ?v11)
             (pred_4 ?v3)
             (pred_11 ?v4)
             (pred_6 ?v3)
             (pred_2 ))



(:action op_5
:parameters (?v7 ?v1 ?v12 ?v5)
:precondition (and (pred_9 ?v7) (pred_9 ?v1) (pred_12 ?v12) (pred_8 ?v5)
          (pred_1 ?v7 ?v1) (pred_10 ?v12 ?v5)
                   (pred_7 ?v1 ?v5) (pred_3 ?v7) 
                   (pred_4 ?v1) (pred_11 ?v12))
:effect (and  (pred_6 ?v1) (not (pred_4 ?v1))))


(:action op_1
:parameters (?v7 ?v10)
:precondition (and (pred_9 ?v7) (pred_9 ?v10)
               (pred_3 ?v7) (pred_1 ?v7 ?v10) (pred_6 ?v10))
:effect (and (pred_3 ?v10) (not (pred_3 ?v7))))

(:action op_2
:parameters (?v7 ?v12)
:precondition (and (pred_9 ?v7) (pred_12 ?v12) 
                  (pred_3 ?v7) (pred_5 ?v12 ?v7) (pred_2 ))
:effect (and (pred_11 ?v12)
   (not (pred_5 ?v12 ?v7)) (not (pred_2 ))))


(:action op_3
:parameters (?v7 ?v13 ?v9)
:precondition (and (pred_9 ?v7) (pred_12 ?v13) (pred_12 ?v9)
                  (pred_3 ?v7) (pred_11 ?v9) (pred_5 ?v13 ?v7))
:effect (and (pred_11 ?v13) (pred_5 ?v9 ?v7)
        (not (pred_11 ?v9)) (not (pred_5 ?v13 ?v7))))

(:action op_4
:parameters (?v7 ?v12)
:precondition (and (pred_9 ?v7) (pred_12 ?v12) 
                  (pred_3 ?v7) (pred_11 ?v12))
:effect (and (pred_2 ) (pred_5 ?v12 ?v7) (not (pred_11 ?v12)))))


	
