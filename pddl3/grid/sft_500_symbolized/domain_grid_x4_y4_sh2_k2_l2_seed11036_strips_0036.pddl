(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v11 ?v5)
             (pred_1 ?v2 ?v4)
             (pred_12 ?v11 ?v4)
             (pred_2 ?v3 ?v11 )
	     (pred_9 ?v11)
             (pred_4 ?v6)
             (pred_11 ?v2)
             (pred_6 ?v4)
             (pred_10 ?v11)
             (pred_7 ?v2)
             (pred_8 ?v11)
             (pred_3 ))



(:action op_3
:parameters (?v7 ?v9 ?v8 ?v13)
:precondition (and (pred_4 ?v7) (pred_4 ?v9) (pred_11 ?v8) (pred_6 ?v13)
          (pred_5 ?v7 ?v9) (pred_1 ?v8 ?v13)
                   (pred_12 ?v9 ?v13) (pred_9 ?v7) 
                   (pred_10 ?v9) (pred_7 ?v8))
:effect (and  (pred_8 ?v9) (not (pred_10 ?v9))))


(:action op_1
:parameters (?v7 ?v10)
:precondition (and (pred_4 ?v7) (pred_4 ?v10)
               (pred_9 ?v7) (pred_5 ?v7 ?v10) (pred_8 ?v10))
:effect (and (pred_9 ?v10) (not (pred_9 ?v7))))

(:action op_4
:parameters (?v7 ?v8)
:precondition (and (pred_4 ?v7) (pred_11 ?v8) 
                  (pred_9 ?v7) (pred_2 ?v8 ?v7) (pred_3 ))
:effect (and (pred_7 ?v8)
   (not (pred_2 ?v8 ?v7)) (not (pred_3 ))))


(:action op_5
:parameters (?v7 ?v12 ?v1)
:precondition (and (pred_4 ?v7) (pred_11 ?v12) (pred_11 ?v1)
                  (pred_9 ?v7) (pred_7 ?v1) (pred_2 ?v12 ?v7))
:effect (and (pred_7 ?v12) (pred_2 ?v1 ?v7)
        (not (pred_7 ?v1)) (not (pred_2 ?v12 ?v7))))

(:action op_2
:parameters (?v7 ?v8)
:precondition (and (pred_4 ?v7) (pred_11 ?v8) 
                  (pred_9 ?v7) (pred_7 ?v8))
:effect (and (pred_3 ) (pred_2 ?v8 ?v7) (not (pred_7 ?v8)))))


	
