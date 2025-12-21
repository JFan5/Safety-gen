(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v11 ?v6)
             (pred_6 ?v12 ?v4)
             (pred_2 ?v11 ?v4)
             (pred_4 ?v10 ?v11 )
	     (pred_8 ?v11)
             (pred_10 ?v13)
             (pred_11 ?v12)
             (pred_7 ?v4)
             (pred_9 ?v11)
             (pred_5 ?v12)
             (pred_12 ?v11)
             (pred_1 ))



(:action op_2
:parameters (?v8 ?v1 ?v2 ?v9)
:precondition (and (pred_10 ?v8) (pred_10 ?v1) (pred_11 ?v2) (pred_7 ?v9)
          (pred_3 ?v8 ?v1) (pred_6 ?v2 ?v9)
                   (pred_2 ?v1 ?v9) (pred_8 ?v8) 
                   (pred_9 ?v1) (pred_5 ?v2))
:effect (and  (pred_12 ?v1) (not (pred_9 ?v1))))


(:action op_5
:parameters (?v8 ?v5)
:precondition (and (pred_10 ?v8) (pred_10 ?v5)
               (pred_8 ?v8) (pred_3 ?v8 ?v5) (pred_12 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v8))))

(:action op_3
:parameters (?v8 ?v2)
:precondition (and (pred_10 ?v8) (pred_11 ?v2) 
                  (pred_8 ?v8) (pred_4 ?v2 ?v8) (pred_1 ))
:effect (and (pred_5 ?v2)
   (not (pred_4 ?v2 ?v8)) (not (pred_1 ))))


(:action op_4
:parameters (?v8 ?v7 ?v3)
:precondition (and (pred_10 ?v8) (pred_11 ?v7) (pred_11 ?v3)
                  (pred_8 ?v8) (pred_5 ?v3) (pred_4 ?v7 ?v8))
:effect (and (pred_5 ?v7) (pred_4 ?v3 ?v8)
        (not (pred_5 ?v3)) (not (pred_4 ?v7 ?v8))))

(:action op_1
:parameters (?v8 ?v2)
:precondition (and (pred_10 ?v8) (pred_11 ?v2) 
                  (pred_8 ?v8) (pred_5 ?v2))
:effect (and (pred_1 ) (pred_4 ?v2 ?v8) (not (pred_5 ?v2)))))


	
