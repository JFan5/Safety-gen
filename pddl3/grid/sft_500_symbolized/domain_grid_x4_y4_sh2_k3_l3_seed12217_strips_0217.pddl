(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v11)
             (pred_6 ?v8 ?v3)
             (pred_8 ?v5 ?v3)
             (pred_11 ?v6 ?v5 )
	     (pred_12 ?v5)
             (pred_2 ?v13)
             (pred_3 ?v8)
             (pred_4 ?v3)
             (pred_5 ?v5)
             (pred_7 ?v8)
             (pred_1 ?v5)
             (pred_10 ))



(:action op_2
:parameters (?v9 ?v7 ?v12 ?v2)
:precondition (and (pred_2 ?v9) (pred_2 ?v7) (pred_3 ?v12) (pred_4 ?v2)
          (pred_9 ?v9 ?v7) (pred_6 ?v12 ?v2)
                   (pred_8 ?v7 ?v2) (pred_12 ?v9) 
                   (pred_5 ?v7) (pred_7 ?v12))
:effect (and  (pred_1 ?v7) (not (pred_5 ?v7))))


(:action op_1
:parameters (?v9 ?v10)
:precondition (and (pred_2 ?v9) (pred_2 ?v10)
               (pred_12 ?v9) (pred_9 ?v9 ?v10) (pred_1 ?v10))
:effect (and (pred_12 ?v10) (not (pred_12 ?v9))))

(:action op_5
:parameters (?v9 ?v12)
:precondition (and (pred_2 ?v9) (pred_3 ?v12) 
                  (pred_12 ?v9) (pred_11 ?v12 ?v9) (pred_10 ))
:effect (and (pred_7 ?v12)
   (not (pred_11 ?v12 ?v9)) (not (pred_10 ))))


(:action op_3
:parameters (?v9 ?v1 ?v4)
:precondition (and (pred_2 ?v9) (pred_3 ?v1) (pred_3 ?v4)
                  (pred_12 ?v9) (pred_7 ?v4) (pred_11 ?v1 ?v9))
:effect (and (pred_7 ?v1) (pred_11 ?v4 ?v9)
        (not (pred_7 ?v4)) (not (pred_11 ?v1 ?v9))))

(:action op_4
:parameters (?v9 ?v12)
:precondition (and (pred_2 ?v9) (pred_3 ?v12) 
                  (pred_12 ?v9) (pred_7 ?v12))
:effect (and (pred_10 ) (pred_11 ?v12 ?v9) (not (pred_7 ?v12)))))


	
