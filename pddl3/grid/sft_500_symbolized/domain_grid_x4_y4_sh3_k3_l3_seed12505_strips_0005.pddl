(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v10 ?v9)
             (pred_11 ?v1 ?v2)
             (pred_3 ?v10 ?v2)
             (pred_9 ?v12 ?v10 )
	     (pred_8 ?v10)
             (pred_1 ?v11)
             (pred_5 ?v1)
             (pred_2 ?v2)
             (pred_12 ?v10)
             (pred_6 ?v1)
             (pred_10 ?v10)
             (pred_7 ))



(:action op_1
:parameters (?v3 ?v5 ?v8 ?v6)
:precondition (and (pred_1 ?v3) (pred_1 ?v5) (pred_5 ?v8) (pred_2 ?v6)
          (pred_4 ?v3 ?v5) (pred_11 ?v8 ?v6)
                   (pred_3 ?v5 ?v6) (pred_8 ?v3) 
                   (pred_12 ?v5) (pred_6 ?v8))
:effect (and  (pred_10 ?v5) (not (pred_12 ?v5))))


(:action op_5
:parameters (?v3 ?v4)
:precondition (and (pred_1 ?v3) (pred_1 ?v4)
               (pred_8 ?v3) (pred_4 ?v3 ?v4) (pred_10 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v3))))

(:action op_4
:parameters (?v3 ?v8)
:precondition (and (pred_1 ?v3) (pred_5 ?v8) 
                  (pred_8 ?v3) (pred_9 ?v8 ?v3) (pred_7 ))
:effect (and (pred_6 ?v8)
   (not (pred_9 ?v8 ?v3)) (not (pred_7 ))))


(:action op_2
:parameters (?v3 ?v13 ?v7)
:precondition (and (pred_1 ?v3) (pred_5 ?v13) (pred_5 ?v7)
                  (pred_8 ?v3) (pred_6 ?v7) (pred_9 ?v13 ?v3))
:effect (and (pred_6 ?v13) (pred_9 ?v7 ?v3)
        (not (pred_6 ?v7)) (not (pred_9 ?v13 ?v3))))

(:action op_3
:parameters (?v3 ?v8)
:precondition (and (pred_1 ?v3) (pred_5 ?v8) 
                  (pred_8 ?v3) (pred_6 ?v8))
:effect (and (pred_7 ) (pred_9 ?v8 ?v3) (not (pred_6 ?v8)))))


	
