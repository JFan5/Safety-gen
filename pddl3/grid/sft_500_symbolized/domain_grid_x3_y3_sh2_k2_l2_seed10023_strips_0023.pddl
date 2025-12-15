(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v2 ?v6)
             (pred_6 ?v4 ?v3)
             (pred_5 ?v2 ?v3)
             (pred_4 ?v9 ?v2 )
	     (pred_10 ?v2)
             (pred_2 ?v1)
             (pred_12 ?v4)
             (pred_8 ?v3)
             (pred_11 ?v2)
             (pred_9 ?v4)
             (pred_7 ?v2)
             (pred_3 ))



(:action op_5
:parameters (?v8 ?v13 ?v5 ?v10)
:precondition (and (pred_2 ?v8) (pred_2 ?v13) (pred_12 ?v5) (pred_8 ?v10)
          (pred_1 ?v8 ?v13) (pred_6 ?v5 ?v10)
                   (pred_5 ?v13 ?v10) (pred_10 ?v8) 
                   (pred_11 ?v13) (pred_9 ?v5))
:effect (and  (pred_7 ?v13) (not (pred_11 ?v13))))


(:action op_4
:parameters (?v8 ?v11)
:precondition (and (pred_2 ?v8) (pred_2 ?v11)
               (pred_10 ?v8) (pred_1 ?v8 ?v11) (pred_7 ?v11))
:effect (and (pred_10 ?v11) (not (pred_10 ?v8))))

(:action op_3
:parameters (?v8 ?v5)
:precondition (and (pred_2 ?v8) (pred_12 ?v5) 
                  (pred_10 ?v8) (pred_4 ?v5 ?v8) (pred_3 ))
:effect (and (pred_9 ?v5)
   (not (pred_4 ?v5 ?v8)) (not (pred_3 ))))


(:action op_2
:parameters (?v8 ?v7 ?v12)
:precondition (and (pred_2 ?v8) (pred_12 ?v7) (pred_12 ?v12)
                  (pred_10 ?v8) (pred_9 ?v12) (pred_4 ?v7 ?v8))
:effect (and (pred_9 ?v7) (pred_4 ?v12 ?v8)
        (not (pred_9 ?v12)) (not (pred_4 ?v7 ?v8))))

(:action op_1
:parameters (?v8 ?v5)
:precondition (and (pred_2 ?v8) (pred_12 ?v5) 
                  (pred_10 ?v8) (pred_9 ?v5))
:effect (and (pred_3 ) (pred_4 ?v5 ?v8) (not (pred_9 ?v5)))))


	
