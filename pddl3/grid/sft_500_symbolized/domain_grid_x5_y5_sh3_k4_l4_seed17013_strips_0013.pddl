(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v7 ?v4)
             (pred_6 ?v11 ?v2)
             (pred_7 ?v7 ?v2)
             (pred_1 ?v6 ?v7 )
	     (pred_11 ?v7)
             (pred_12 ?v5)
             (pred_10 ?v11)
             (pred_5 ?v2)
             (pred_8 ?v7)
             (pred_2 ?v11)
             (pred_4 ?v7)
             (pred_3 ))



(:action op_1
:parameters (?v8 ?v13 ?v1 ?v9)
:precondition (and (pred_12 ?v8) (pred_12 ?v13) (pred_10 ?v1) (pred_5 ?v9)
          (pred_9 ?v8 ?v13) (pred_6 ?v1 ?v9)
                   (pred_7 ?v13 ?v9) (pred_11 ?v8) 
                   (pred_8 ?v13) (pred_2 ?v1))
:effect (and  (pred_4 ?v13) (not (pred_8 ?v13))))


(:action op_2
:parameters (?v8 ?v12)
:precondition (and (pred_12 ?v8) (pred_12 ?v12)
               (pred_11 ?v8) (pred_9 ?v8 ?v12) (pred_4 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v8))))

(:action op_5
:parameters (?v8 ?v1)
:precondition (and (pred_12 ?v8) (pred_10 ?v1) 
                  (pred_11 ?v8) (pred_1 ?v1 ?v8) (pred_3 ))
:effect (and (pred_2 ?v1)
   (not (pred_1 ?v1 ?v8)) (not (pred_3 ))))


(:action op_3
:parameters (?v8 ?v10 ?v3)
:precondition (and (pred_12 ?v8) (pred_10 ?v10) (pred_10 ?v3)
                  (pred_11 ?v8) (pred_2 ?v3) (pred_1 ?v10 ?v8))
:effect (and (pred_2 ?v10) (pred_1 ?v3 ?v8)
        (not (pred_2 ?v3)) (not (pred_1 ?v10 ?v8))))

(:action op_4
:parameters (?v8 ?v1)
:precondition (and (pred_12 ?v8) (pred_10 ?v1) 
                  (pred_11 ?v8) (pred_2 ?v1))
:effect (and (pred_3 ) (pred_1 ?v1 ?v8) (not (pred_2 ?v1)))))


	
