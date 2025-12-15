(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v9 ?v5)
             (pred_4 ?v11 ?v10)
             (pred_3 ?v9 ?v10)
             (pred_12 ?v2 ?v9 )
	     (pred_5 ?v9)
             (pred_6 ?v3)
             (pred_10 ?v11)
             (pred_2 ?v10)
             (pred_8 ?v9)
             (pred_9 ?v11)
             (pred_7 ?v9)
             (pred_11 ))



(:action op_1
:parameters (?v8 ?v13 ?v7 ?v6)
:precondition (and (pred_6 ?v8) (pred_6 ?v13) (pred_10 ?v7) (pred_2 ?v6)
          (pred_1 ?v8 ?v13) (pred_4 ?v7 ?v6)
                   (pred_3 ?v13 ?v6) (pred_5 ?v8) 
                   (pred_8 ?v13) (pred_9 ?v7))
:effect (and  (pred_7 ?v13) (not (pred_8 ?v13))))


(:action op_4
:parameters (?v8 ?v1)
:precondition (and (pred_6 ?v8) (pred_6 ?v1)
               (pred_5 ?v8) (pred_1 ?v8 ?v1) (pred_7 ?v1))
:effect (and (pred_5 ?v1) (not (pred_5 ?v8))))

(:action op_2
:parameters (?v8 ?v7)
:precondition (and (pred_6 ?v8) (pred_10 ?v7) 
                  (pred_5 ?v8) (pred_12 ?v7 ?v8) (pred_11 ))
:effect (and (pred_9 ?v7)
   (not (pred_12 ?v7 ?v8)) (not (pred_11 ))))


(:action op_3
:parameters (?v8 ?v12 ?v4)
:precondition (and (pred_6 ?v8) (pred_10 ?v12) (pred_10 ?v4)
                  (pred_5 ?v8) (pred_9 ?v4) (pred_12 ?v12 ?v8))
:effect (and (pred_9 ?v12) (pred_12 ?v4 ?v8)
        (not (pred_9 ?v4)) (not (pred_12 ?v12 ?v8))))

(:action op_5
:parameters (?v8 ?v7)
:precondition (and (pred_6 ?v8) (pred_10 ?v7) 
                  (pred_5 ?v8) (pred_9 ?v7))
:effect (and (pred_11 ) (pred_12 ?v7 ?v8) (not (pred_9 ?v7)))))


	
