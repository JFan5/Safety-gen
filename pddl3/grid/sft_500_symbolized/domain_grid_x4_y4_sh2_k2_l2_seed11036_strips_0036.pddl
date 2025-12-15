(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v6 ?v2)
             (pred_1 ?v11 ?v10)
             (pred_10 ?v6 ?v10)
             (pred_11 ?v13 ?v6 )
	     (pred_9 ?v6)
             (pred_3 ?v5)
             (pred_12 ?v11)
             (pred_2 ?v10)
             (pred_8 ?v6)
             (pred_5 ?v11)
             (pred_6 ?v6)
             (pred_7 ))



(:action op_2
:parameters (?v8 ?v1 ?v9 ?v7)
:precondition (and (pred_3 ?v8) (pred_3 ?v1) (pred_12 ?v9) (pred_2 ?v7)
          (pred_4 ?v8 ?v1) (pred_1 ?v9 ?v7)
                   (pred_10 ?v1 ?v7) (pred_9 ?v8) 
                   (pred_8 ?v1) (pred_5 ?v9))
:effect (and  (pred_6 ?v1) (not (pred_8 ?v1))))


(:action op_1
:parameters (?v8 ?v4)
:precondition (and (pred_3 ?v8) (pred_3 ?v4)
               (pred_9 ?v8) (pred_4 ?v8 ?v4) (pred_6 ?v4))
:effect (and (pred_9 ?v4) (not (pred_9 ?v8))))

(:action op_3
:parameters (?v8 ?v9)
:precondition (and (pred_3 ?v8) (pred_12 ?v9) 
                  (pred_9 ?v8) (pred_11 ?v9 ?v8) (pred_7 ))
:effect (and (pred_5 ?v9)
   (not (pred_11 ?v9 ?v8)) (not (pred_7 ))))


(:action op_4
:parameters (?v8 ?v12 ?v3)
:precondition (and (pred_3 ?v8) (pred_12 ?v12) (pred_12 ?v3)
                  (pred_9 ?v8) (pred_5 ?v3) (pred_11 ?v12 ?v8))
:effect (and (pred_5 ?v12) (pred_11 ?v3 ?v8)
        (not (pred_5 ?v3)) (not (pred_11 ?v12 ?v8))))

(:action op_5
:parameters (?v8 ?v9)
:precondition (and (pred_3 ?v8) (pred_12 ?v9) 
                  (pred_9 ?v8) (pred_5 ?v9))
:effect (and (pred_7 ) (pred_11 ?v9 ?v8) (not (pred_5 ?v9)))))


	
