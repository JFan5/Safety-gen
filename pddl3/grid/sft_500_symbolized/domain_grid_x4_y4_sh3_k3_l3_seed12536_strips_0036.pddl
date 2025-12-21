(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v10 ?v6)
             (pred_3 ?v13 ?v3)
             (pred_12 ?v10 ?v3)
             (pred_2 ?v1 ?v10 )
	     (pred_1 ?v10)
             (pred_11 ?v2)
             (pred_6 ?v13)
             (pred_5 ?v3)
             (pred_4 ?v10)
             (pred_9 ?v13)
             (pred_7 ?v10)
             (pred_10 ))



(:action op_2
:parameters (?v9 ?v11 ?v12 ?v7)
:precondition (and (pred_11 ?v9) (pred_11 ?v11) (pred_6 ?v12) (pred_5 ?v7)
          (pred_8 ?v9 ?v11) (pred_3 ?v12 ?v7)
                   (pred_12 ?v11 ?v7) (pred_1 ?v9) 
                   (pred_4 ?v11) (pred_9 ?v12))
:effect (and  (pred_7 ?v11) (not (pred_4 ?v11))))


(:action op_3
:parameters (?v9 ?v5)
:precondition (and (pred_11 ?v9) (pred_11 ?v5)
               (pred_1 ?v9) (pred_8 ?v9 ?v5) (pred_7 ?v5))
:effect (and (pred_1 ?v5) (not (pred_1 ?v9))))

(:action op_4
:parameters (?v9 ?v12)
:precondition (and (pred_11 ?v9) (pred_6 ?v12) 
                  (pred_1 ?v9) (pred_2 ?v12 ?v9) (pred_10 ))
:effect (and (pred_9 ?v12)
   (not (pred_2 ?v12 ?v9)) (not (pred_10 ))))


(:action op_1
:parameters (?v9 ?v4 ?v8)
:precondition (and (pred_11 ?v9) (pred_6 ?v4) (pred_6 ?v8)
                  (pred_1 ?v9) (pred_9 ?v8) (pred_2 ?v4 ?v9))
:effect (and (pred_9 ?v4) (pred_2 ?v8 ?v9)
        (not (pred_9 ?v8)) (not (pred_2 ?v4 ?v9))))

(:action op_5
:parameters (?v9 ?v12)
:precondition (and (pred_11 ?v9) (pred_6 ?v12) 
                  (pred_1 ?v9) (pred_9 ?v12))
:effect (and (pred_10 ) (pred_2 ?v12 ?v9) (not (pred_9 ?v12)))))


	
