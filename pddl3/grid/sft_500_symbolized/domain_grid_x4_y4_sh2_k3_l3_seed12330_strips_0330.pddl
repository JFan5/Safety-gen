(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v10 ?v6)
             (pred_11 ?v11 ?v7)
             (pred_6 ?v10 ?v7)
             (pred_4 ?v1 ?v10 )
	     (pred_7 ?v10)
             (pred_8 ?v2)
             (pred_5 ?v11)
             (pred_2 ?v7)
             (pred_12 ?v10)
             (pred_3 ?v11)
             (pred_1 ?v10)
             (pred_9 ))



(:action op_5
:parameters (?v9 ?v8 ?v3 ?v13)
:precondition (and (pred_8 ?v9) (pred_8 ?v8) (pred_5 ?v3) (pred_2 ?v13)
          (pred_10 ?v9 ?v8) (pred_11 ?v3 ?v13)
                   (pred_6 ?v8 ?v13) (pred_7 ?v9) 
                   (pred_12 ?v8) (pred_3 ?v3))
:effect (and  (pred_1 ?v8) (not (pred_12 ?v8))))


(:action op_1
:parameters (?v9 ?v12)
:precondition (and (pred_8 ?v9) (pred_8 ?v12)
               (pred_7 ?v9) (pred_10 ?v9 ?v12) (pred_1 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v9))))

(:action op_4
:parameters (?v9 ?v3)
:precondition (and (pred_8 ?v9) (pred_5 ?v3) 
                  (pred_7 ?v9) (pred_4 ?v3 ?v9) (pred_9 ))
:effect (and (pred_3 ?v3)
   (not (pred_4 ?v3 ?v9)) (not (pred_9 ))))


(:action op_3
:parameters (?v9 ?v4 ?v5)
:precondition (and (pred_8 ?v9) (pred_5 ?v4) (pred_5 ?v5)
                  (pred_7 ?v9) (pred_3 ?v5) (pred_4 ?v4 ?v9))
:effect (and (pred_3 ?v4) (pred_4 ?v5 ?v9)
        (not (pred_3 ?v5)) (not (pred_4 ?v4 ?v9))))

(:action op_2
:parameters (?v9 ?v3)
:precondition (and (pred_8 ?v9) (pred_5 ?v3) 
                  (pred_7 ?v9) (pred_3 ?v3))
:effect (and (pred_9 ) (pred_4 ?v3 ?v9) (not (pred_3 ?v3)))))


	
