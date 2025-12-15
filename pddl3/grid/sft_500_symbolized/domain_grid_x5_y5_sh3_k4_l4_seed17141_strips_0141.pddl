(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v2 ?v4)
             (pred_10 ?v12 ?v11)
             (pred_4 ?v2 ?v11)
             (pred_2 ?v6 ?v2 )
	     (pred_5 ?v2)
             (pred_8 ?v10)
             (pred_11 ?v12)
             (pred_1 ?v11)
             (pred_9 ?v2)
             (pred_7 ?v12)
             (pred_6 ?v2)
             (pred_12 ))



(:action op_1
:parameters (?v9 ?v5 ?v8 ?v7)
:precondition (and (pred_8 ?v9) (pred_8 ?v5) (pred_11 ?v8) (pred_1 ?v7)
          (pred_3 ?v9 ?v5) (pred_10 ?v8 ?v7)
                   (pred_4 ?v5 ?v7) (pred_5 ?v9) 
                   (pred_9 ?v5) (pred_7 ?v8))
:effect (and  (pred_6 ?v5) (not (pred_9 ?v5))))


(:action op_4
:parameters (?v9 ?v1)
:precondition (and (pred_8 ?v9) (pred_8 ?v1)
               (pred_5 ?v9) (pred_3 ?v9 ?v1) (pred_6 ?v1))
:effect (and (pred_5 ?v1) (not (pred_5 ?v9))))

(:action op_5
:parameters (?v9 ?v8)
:precondition (and (pred_8 ?v9) (pred_11 ?v8) 
                  (pred_5 ?v9) (pred_2 ?v8 ?v9) (pred_12 ))
:effect (and (pred_7 ?v8)
   (not (pred_2 ?v8 ?v9)) (not (pred_12 ))))


(:action op_3
:parameters (?v9 ?v3 ?v13)
:precondition (and (pred_8 ?v9) (pred_11 ?v3) (pred_11 ?v13)
                  (pred_5 ?v9) (pred_7 ?v13) (pred_2 ?v3 ?v9))
:effect (and (pred_7 ?v3) (pred_2 ?v13 ?v9)
        (not (pred_7 ?v13)) (not (pred_2 ?v3 ?v9))))

(:action op_2
:parameters (?v9 ?v8)
:precondition (and (pred_8 ?v9) (pred_11 ?v8) 
                  (pred_5 ?v9) (pred_7 ?v8))
:effect (and (pred_12 ) (pred_2 ?v8 ?v9) (not (pred_7 ?v8)))))


	
