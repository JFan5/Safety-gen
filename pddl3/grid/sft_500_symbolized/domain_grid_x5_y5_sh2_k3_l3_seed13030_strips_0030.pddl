(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v1 ?v2)
             (pred_12 ?v6 ?v10)
             (pred_8 ?v1 ?v10)
             (pred_6 ?v3 ?v1 )
	     (pred_10 ?v1)
             (pred_3 ?v7)
             (pred_4 ?v6)
             (pred_11 ?v10)
             (pred_1 ?v1)
             (pred_9 ?v6)
             (pred_5 ?v1)
             (pred_2 ))



(:action op_2
:parameters (?v8 ?v13 ?v12 ?v5)
:precondition (and (pred_3 ?v8) (pred_3 ?v13) (pred_4 ?v12) (pred_11 ?v5)
          (pred_7 ?v8 ?v13) (pred_12 ?v12 ?v5)
                   (pred_8 ?v13 ?v5) (pred_10 ?v8) 
                   (pred_1 ?v13) (pred_9 ?v12))
:effect (and  (pred_5 ?v13) (not (pred_1 ?v13))))


(:action op_4
:parameters (?v8 ?v4)
:precondition (and (pred_3 ?v8) (pred_3 ?v4)
               (pred_10 ?v8) (pred_7 ?v8 ?v4) (pred_5 ?v4))
:effect (and (pred_10 ?v4) (not (pred_10 ?v8))))

(:action op_3
:parameters (?v8 ?v12)
:precondition (and (pred_3 ?v8) (pred_4 ?v12) 
                  (pred_10 ?v8) (pred_6 ?v12 ?v8) (pred_2 ))
:effect (and (pred_9 ?v12)
   (not (pred_6 ?v12 ?v8)) (not (pred_2 ))))


(:action op_5
:parameters (?v8 ?v9 ?v11)
:precondition (and (pred_3 ?v8) (pred_4 ?v9) (pred_4 ?v11)
                  (pred_10 ?v8) (pred_9 ?v11) (pred_6 ?v9 ?v8))
:effect (and (pred_9 ?v9) (pred_6 ?v11 ?v8)
        (not (pred_9 ?v11)) (not (pred_6 ?v9 ?v8))))

(:action op_1
:parameters (?v8 ?v12)
:precondition (and (pred_3 ?v8) (pred_4 ?v12) 
                  (pred_10 ?v8) (pred_9 ?v12))
:effect (and (pred_2 ) (pred_6 ?v12 ?v8) (not (pred_9 ?v12)))))


	
