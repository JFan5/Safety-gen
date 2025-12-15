(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v6 ?v3)
             (pred_12 ?v1 ?v10)
             (pred_4 ?v6 ?v10)
             (pred_10 ?v4 ?v6 )
	     (pred_9 ?v6)
             (pred_5 ?v2)
             (pred_2 ?v1)
             (pred_11 ?v10)
             (pred_8 ?v6)
             (pred_3 ?v1)
             (pred_6 ?v6)
             (pred_1 ))



(:action op_1
:parameters (?v12 ?v5 ?v8 ?v9)
:precondition (and (pred_5 ?v12) (pred_5 ?v5) (pred_2 ?v8) (pred_11 ?v9)
          (pred_7 ?v12 ?v5) (pred_12 ?v8 ?v9)
                   (pred_4 ?v5 ?v9) (pred_9 ?v12) 
                   (pred_8 ?v5) (pred_3 ?v8))
:effect (and  (pred_6 ?v5) (not (pred_8 ?v5))))


(:action op_2
:parameters (?v12 ?v11)
:precondition (and (pred_5 ?v12) (pred_5 ?v11)
               (pred_9 ?v12) (pred_7 ?v12 ?v11) (pred_6 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v12))))

(:action op_5
:parameters (?v12 ?v8)
:precondition (and (pred_5 ?v12) (pred_2 ?v8) 
                  (pred_9 ?v12) (pred_10 ?v8 ?v12) (pred_1 ))
:effect (and (pred_3 ?v8)
   (not (pred_10 ?v8 ?v12)) (not (pred_1 ))))


(:action op_4
:parameters (?v12 ?v13 ?v7)
:precondition (and (pred_5 ?v12) (pred_2 ?v13) (pred_2 ?v7)
                  (pred_9 ?v12) (pred_3 ?v7) (pred_10 ?v13 ?v12))
:effect (and (pred_3 ?v13) (pred_10 ?v7 ?v12)
        (not (pred_3 ?v7)) (not (pred_10 ?v13 ?v12))))

(:action op_3
:parameters (?v12 ?v8)
:precondition (and (pred_5 ?v12) (pred_2 ?v8) 
                  (pred_9 ?v12) (pred_3 ?v8))
:effect (and (pred_1 ) (pred_10 ?v8 ?v12) (not (pred_3 ?v8)))))


	
