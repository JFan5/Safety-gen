(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v9)
             (pred_3 ?v6 ?v11)
             (pred_9 ?v5 ?v11)
             (pred_11 ?v12 ?v5 )
	     (pred_7 ?v5)
             (pred_5 ?v1)
             (pred_1 ?v6)
             (pred_8 ?v11)
             (pred_2 ?v5)
             (pred_4 ?v6)
             (pred_12 ?v5)
             (pred_10 ))



(:action op_4
:parameters (?v8 ?v3 ?v2 ?v7)
:precondition (and (pred_5 ?v8) (pred_5 ?v3) (pred_1 ?v2) (pred_8 ?v7)
          (pred_6 ?v8 ?v3) (pred_3 ?v2 ?v7)
                   (pred_9 ?v3 ?v7) (pred_7 ?v8) 
                   (pred_2 ?v3) (pred_4 ?v2))
:effect (and  (pred_12 ?v3) (not (pred_2 ?v3))))


(:action op_5
:parameters (?v8 ?v10)
:precondition (and (pred_5 ?v8) (pred_5 ?v10)
               (pred_7 ?v8) (pred_6 ?v8 ?v10) (pred_12 ?v10))
:effect (and (pred_7 ?v10) (not (pred_7 ?v8))))

(:action op_1
:parameters (?v8 ?v2)
:precondition (and (pred_5 ?v8) (pred_1 ?v2) 
                  (pred_7 ?v8) (pred_11 ?v2 ?v8) (pred_10 ))
:effect (and (pred_4 ?v2)
   (not (pred_11 ?v2 ?v8)) (not (pred_10 ))))


(:action op_3
:parameters (?v8 ?v13 ?v4)
:precondition (and (pred_5 ?v8) (pred_1 ?v13) (pred_1 ?v4)
                  (pred_7 ?v8) (pred_4 ?v4) (pred_11 ?v13 ?v8))
:effect (and (pred_4 ?v13) (pred_11 ?v4 ?v8)
        (not (pred_4 ?v4)) (not (pred_11 ?v13 ?v8))))

(:action op_2
:parameters (?v8 ?v2)
:precondition (and (pred_5 ?v8) (pred_1 ?v2) 
                  (pred_7 ?v8) (pred_4 ?v2))
:effect (and (pred_10 ) (pred_11 ?v2 ?v8) (not (pred_4 ?v2)))))


	
