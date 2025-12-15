(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v3 ?v11)
             (pred_8 ?v12 ?v6)
             (pred_2 ?v3 ?v6)
             (pred_1 ?v5 ?v3 )
	     (pred_4 ?v3)
             (pred_10 ?v2)
             (pred_7 ?v12)
             (pred_3 ?v6)
             (pred_6 ?v3)
             (pred_12 ?v12)
             (pred_9 ?v3)
             (pred_5 ))



(:action op_4
:parameters (?v8 ?v1 ?v4 ?v10)
:precondition (and (pred_10 ?v8) (pred_10 ?v1) (pred_7 ?v4) (pred_3 ?v10)
          (pred_11 ?v8 ?v1) (pred_8 ?v4 ?v10)
                   (pred_2 ?v1 ?v10) (pred_4 ?v8) 
                   (pred_6 ?v1) (pred_12 ?v4))
:effect (and  (pred_9 ?v1) (not (pred_6 ?v1))))


(:action op_2
:parameters (?v8 ?v9)
:precondition (and (pred_10 ?v8) (pred_10 ?v9)
               (pred_4 ?v8) (pred_11 ?v8 ?v9) (pred_9 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v8))))

(:action op_1
:parameters (?v8 ?v4)
:precondition (and (pred_10 ?v8) (pred_7 ?v4) 
                  (pred_4 ?v8) (pred_1 ?v4 ?v8) (pred_5 ))
:effect (and (pred_12 ?v4)
   (not (pred_1 ?v4 ?v8)) (not (pred_5 ))))


(:action op_3
:parameters (?v8 ?v13 ?v7)
:precondition (and (pred_10 ?v8) (pred_7 ?v13) (pred_7 ?v7)
                  (pred_4 ?v8) (pred_12 ?v7) (pred_1 ?v13 ?v8))
:effect (and (pred_12 ?v13) (pred_1 ?v7 ?v8)
        (not (pred_12 ?v7)) (not (pred_1 ?v13 ?v8))))

(:action op_5
:parameters (?v8 ?v4)
:precondition (and (pred_10 ?v8) (pred_7 ?v4) 
                  (pred_4 ?v8) (pred_12 ?v4))
:effect (and (pred_5 ) (pred_1 ?v4 ?v8) (not (pred_12 ?v4)))))


	
