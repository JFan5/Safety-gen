(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v1 ?v10)
             (pred_4 ?v11 ?v7)
             (pred_7 ?v1 ?v7)
             (pred_9 ?v12 ?v1 )
	     (pred_3 ?v1)
             (pred_8 ?v9)
             (pred_2 ?v11)
             (pred_6 ?v7)
             (pred_11 ?v1)
             (pred_12 ?v11)
             (pred_1 ?v1)
             (pred_5 ))



(:action op_4
:parameters (?v8 ?v3 ?v6 ?v4)
:precondition (and (pred_8 ?v8) (pred_8 ?v3) (pred_2 ?v6) (pred_6 ?v4)
          (pred_10 ?v8 ?v3) (pred_4 ?v6 ?v4)
                   (pred_7 ?v3 ?v4) (pred_3 ?v8) 
                   (pred_11 ?v3) (pred_12 ?v6))
:effect (and  (pred_1 ?v3) (not (pred_11 ?v3))))


(:action op_1
:parameters (?v8 ?v2)
:precondition (and (pred_8 ?v8) (pred_8 ?v2)
               (pred_3 ?v8) (pred_10 ?v8 ?v2) (pred_1 ?v2))
:effect (and (pred_3 ?v2) (not (pred_3 ?v8))))

(:action op_2
:parameters (?v8 ?v6)
:precondition (and (pred_8 ?v8) (pred_2 ?v6) 
                  (pred_3 ?v8) (pred_9 ?v6 ?v8) (pred_5 ))
:effect (and (pred_12 ?v6)
   (not (pred_9 ?v6 ?v8)) (not (pred_5 ))))


(:action op_5
:parameters (?v8 ?v13 ?v5)
:precondition (and (pred_8 ?v8) (pred_2 ?v13) (pred_2 ?v5)
                  (pred_3 ?v8) (pred_12 ?v5) (pred_9 ?v13 ?v8))
:effect (and (pred_12 ?v13) (pred_9 ?v5 ?v8)
        (not (pred_12 ?v5)) (not (pred_9 ?v13 ?v8))))

(:action op_3
:parameters (?v8 ?v6)
:precondition (and (pred_8 ?v8) (pred_2 ?v6) 
                  (pred_3 ?v8) (pred_12 ?v6))
:effect (and (pred_5 ) (pred_9 ?v6 ?v8) (not (pred_12 ?v6)))))


	
