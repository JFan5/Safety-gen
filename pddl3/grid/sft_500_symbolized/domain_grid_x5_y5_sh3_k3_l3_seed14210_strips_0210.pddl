(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v11 ?v9)
             (pred_2 ?v3 ?v4)
             (pred_11 ?v11 ?v4)
             (pred_9 ?v1 ?v11 )
	     (pred_4 ?v11)
             (pred_12 ?v6)
             (pred_6 ?v3)
             (pred_7 ?v4)
             (pred_3 ?v11)
             (pred_1 ?v3)
             (pred_8 ?v11)
             (pred_5 ))



(:action op_5
:parameters (?v8 ?v5 ?v10 ?v12)
:precondition (and (pred_12 ?v8) (pred_12 ?v5) (pred_6 ?v10) (pred_7 ?v12)
          (pred_10 ?v8 ?v5) (pred_2 ?v10 ?v12)
                   (pred_11 ?v5 ?v12) (pred_4 ?v8) 
                   (pred_3 ?v5) (pred_1 ?v10))
:effect (and  (pred_8 ?v5) (not (pred_3 ?v5))))


(:action op_4
:parameters (?v8 ?v7)
:precondition (and (pred_12 ?v8) (pred_12 ?v7)
               (pred_4 ?v8) (pred_10 ?v8 ?v7) (pred_8 ?v7))
:effect (and (pred_4 ?v7) (not (pred_4 ?v8))))

(:action op_2
:parameters (?v8 ?v10)
:precondition (and (pred_12 ?v8) (pred_6 ?v10) 
                  (pred_4 ?v8) (pred_9 ?v10 ?v8) (pred_5 ))
:effect (and (pred_1 ?v10)
   (not (pred_9 ?v10 ?v8)) (not (pred_5 ))))


(:action op_1
:parameters (?v8 ?v2 ?v13)
:precondition (and (pred_12 ?v8) (pred_6 ?v2) (pred_6 ?v13)
                  (pred_4 ?v8) (pred_1 ?v13) (pred_9 ?v2 ?v8))
:effect (and (pred_1 ?v2) (pred_9 ?v13 ?v8)
        (not (pred_1 ?v13)) (not (pred_9 ?v2 ?v8))))

(:action op_3
:parameters (?v8 ?v10)
:precondition (and (pred_12 ?v8) (pred_6 ?v10) 
                  (pred_4 ?v8) (pred_1 ?v10))
:effect (and (pred_5 ) (pred_9 ?v10 ?v8) (not (pred_1 ?v10)))))


	
