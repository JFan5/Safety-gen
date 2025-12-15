(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v11 ?v3)
             (pred_8 ?v6 ?v1)
             (pred_3 ?v11 ?v1)
             (pred_5 ?v2 ?v11 )
	     (pred_12 ?v11)
             (pred_11 ?v12)
             (pred_4 ?v6)
             (pred_7 ?v1)
             (pred_6 ?v11)
             (pred_9 ?v6)
             (pred_10 ?v11)
             (pred_1 ))



(:action op_4
:parameters (?v8 ?v13 ?v9 ?v10)
:precondition (and (pred_11 ?v8) (pred_11 ?v13) (pred_4 ?v9) (pred_7 ?v10)
          (pred_2 ?v8 ?v13) (pred_8 ?v9 ?v10)
                   (pred_3 ?v13 ?v10) (pred_12 ?v8) 
                   (pred_6 ?v13) (pred_9 ?v9))
:effect (and  (pred_10 ?v13) (not (pred_6 ?v13))))


(:action op_3
:parameters (?v8 ?v5)
:precondition (and (pred_11 ?v8) (pred_11 ?v5)
               (pred_12 ?v8) (pred_2 ?v8 ?v5) (pred_10 ?v5))
:effect (and (pred_12 ?v5) (not (pred_12 ?v8))))

(:action op_5
:parameters (?v8 ?v9)
:precondition (and (pred_11 ?v8) (pred_4 ?v9) 
                  (pred_12 ?v8) (pred_5 ?v9 ?v8) (pred_1 ))
:effect (and (pred_9 ?v9)
   (not (pred_5 ?v9 ?v8)) (not (pred_1 ))))


(:action op_2
:parameters (?v8 ?v7 ?v4)
:precondition (and (pred_11 ?v8) (pred_4 ?v7) (pred_4 ?v4)
                  (pred_12 ?v8) (pred_9 ?v4) (pred_5 ?v7 ?v8))
:effect (and (pred_9 ?v7) (pred_5 ?v4 ?v8)
        (not (pred_9 ?v4)) (not (pred_5 ?v7 ?v8))))

(:action op_1
:parameters (?v8 ?v9)
:precondition (and (pred_11 ?v8) (pred_4 ?v9) 
                  (pred_12 ?v8) (pred_9 ?v9))
:effect (and (pred_1 ) (pred_5 ?v9 ?v8) (not (pred_9 ?v9)))))


	
