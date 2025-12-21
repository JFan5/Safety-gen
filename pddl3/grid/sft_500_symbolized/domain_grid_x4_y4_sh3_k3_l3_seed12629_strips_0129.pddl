(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v5 ?v1)
             (pred_8 ?v7 ?v2)
             (pred_6 ?v5 ?v2)
             (pred_11 ?v10 ?v5 )
	     (pred_2 ?v5)
             (pred_10 ?v11)
             (pred_4 ?v7)
             (pred_12 ?v2)
             (pred_9 ?v5)
             (pred_7 ?v7)
             (pred_3 ?v5)
             (pred_5 ))



(:action op_4
:parameters (?v8 ?v3 ?v9 ?v6)
:precondition (and (pred_10 ?v8) (pred_10 ?v3) (pred_4 ?v9) (pred_12 ?v6)
          (pred_1 ?v8 ?v3) (pred_8 ?v9 ?v6)
                   (pred_6 ?v3 ?v6) (pred_2 ?v8) 
                   (pred_9 ?v3) (pred_7 ?v9))
:effect (and  (pred_3 ?v3) (not (pred_9 ?v3))))


(:action op_3
:parameters (?v8 ?v4)
:precondition (and (pred_10 ?v8) (pred_10 ?v4)
               (pred_2 ?v8) (pred_1 ?v8 ?v4) (pred_3 ?v4))
:effect (and (pred_2 ?v4) (not (pred_2 ?v8))))

(:action op_1
:parameters (?v8 ?v9)
:precondition (and (pred_10 ?v8) (pred_4 ?v9) 
                  (pred_2 ?v8) (pred_11 ?v9 ?v8) (pred_5 ))
:effect (and (pred_7 ?v9)
   (not (pred_11 ?v9 ?v8)) (not (pred_5 ))))


(:action op_2
:parameters (?v8 ?v13 ?v12)
:precondition (and (pred_10 ?v8) (pred_4 ?v13) (pred_4 ?v12)
                  (pred_2 ?v8) (pred_7 ?v12) (pred_11 ?v13 ?v8))
:effect (and (pred_7 ?v13) (pred_11 ?v12 ?v8)
        (not (pred_7 ?v12)) (not (pred_11 ?v13 ?v8))))

(:action op_5
:parameters (?v8 ?v9)
:precondition (and (pred_10 ?v8) (pred_4 ?v9) 
                  (pred_2 ?v8) (pred_7 ?v9))
:effect (and (pred_5 ) (pred_11 ?v9 ?v8) (not (pred_7 ?v9)))))


	
