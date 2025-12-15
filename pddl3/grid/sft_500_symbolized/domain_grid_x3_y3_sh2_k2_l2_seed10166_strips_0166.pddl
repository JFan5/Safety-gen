(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v12 ?v6)
             (pred_12 ?v11 ?v5)
             (pred_11 ?v12 ?v5)
             (pred_6 ?v10 ?v12 )
	     (pred_7 ?v12)
             (pred_2 ?v1)
             (pred_10 ?v11)
             (pred_4 ?v5)
             (pred_1 ?v12)
             (pred_5 ?v11)
             (pred_8 ?v12)
             (pred_9 ))



(:action op_3
:parameters (?v9 ?v13 ?v8 ?v4)
:precondition (and (pred_2 ?v9) (pred_2 ?v13) (pred_10 ?v8) (pred_4 ?v4)
          (pred_3 ?v9 ?v13) (pred_12 ?v8 ?v4)
                   (pred_11 ?v13 ?v4) (pred_7 ?v9) 
                   (pred_1 ?v13) (pred_5 ?v8))
:effect (and  (pred_8 ?v13) (not (pred_1 ?v13))))


(:action op_2
:parameters (?v9 ?v3)
:precondition (and (pred_2 ?v9) (pred_2 ?v3)
               (pred_7 ?v9) (pred_3 ?v9 ?v3) (pred_8 ?v3))
:effect (and (pred_7 ?v3) (not (pred_7 ?v9))))

(:action op_1
:parameters (?v9 ?v8)
:precondition (and (pred_2 ?v9) (pred_10 ?v8) 
                  (pred_7 ?v9) (pred_6 ?v8 ?v9) (pred_9 ))
:effect (and (pred_5 ?v8)
   (not (pred_6 ?v8 ?v9)) (not (pred_9 ))))


(:action op_4
:parameters (?v9 ?v2 ?v7)
:precondition (and (pred_2 ?v9) (pred_10 ?v2) (pred_10 ?v7)
                  (pred_7 ?v9) (pred_5 ?v7) (pred_6 ?v2 ?v9))
:effect (and (pred_5 ?v2) (pred_6 ?v7 ?v9)
        (not (pred_5 ?v7)) (not (pred_6 ?v2 ?v9))))

(:action op_5
:parameters (?v9 ?v8)
:precondition (and (pred_2 ?v9) (pred_10 ?v8) 
                  (pred_7 ?v9) (pred_5 ?v8))
:effect (and (pred_9 ) (pred_6 ?v8 ?v9) (not (pred_5 ?v8)))))


	
