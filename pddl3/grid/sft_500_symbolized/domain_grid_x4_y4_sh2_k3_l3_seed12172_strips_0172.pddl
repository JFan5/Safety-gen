(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v4 ?v13)
             (pred_4 ?v5 ?v2)
             (pred_3 ?v4 ?v2)
             (pred_12 ?v6 ?v4 )
	     (pred_9 ?v4)
             (pred_2 ?v3)
             (pred_10 ?v5)
             (pred_6 ?v2)
             (pred_5 ?v4)
             (pred_8 ?v5)
             (pred_11 ?v4)
             (pred_7 ))



(:action op_4
:parameters (?v11 ?v7 ?v8 ?v1)
:precondition (and (pred_2 ?v11) (pred_2 ?v7) (pred_10 ?v8) (pred_6 ?v1)
          (pred_1 ?v11 ?v7) (pred_4 ?v8 ?v1)
                   (pred_3 ?v7 ?v1) (pred_9 ?v11) 
                   (pred_5 ?v7) (pred_8 ?v8))
:effect (and  (pred_11 ?v7) (not (pred_5 ?v7))))


(:action op_1
:parameters (?v11 ?v10)
:precondition (and (pred_2 ?v11) (pred_2 ?v10)
               (pred_9 ?v11) (pred_1 ?v11 ?v10) (pred_11 ?v10))
:effect (and (pred_9 ?v10) (not (pred_9 ?v11))))

(:action op_3
:parameters (?v11 ?v8)
:precondition (and (pred_2 ?v11) (pred_10 ?v8) 
                  (pred_9 ?v11) (pred_12 ?v8 ?v11) (pred_7 ))
:effect (and (pred_8 ?v8)
   (not (pred_12 ?v8 ?v11)) (not (pred_7 ))))


(:action op_5
:parameters (?v11 ?v9 ?v12)
:precondition (and (pred_2 ?v11) (pred_10 ?v9) (pred_10 ?v12)
                  (pred_9 ?v11) (pred_8 ?v12) (pred_12 ?v9 ?v11))
:effect (and (pred_8 ?v9) (pred_12 ?v12 ?v11)
        (not (pred_8 ?v12)) (not (pred_12 ?v9 ?v11))))

(:action op_2
:parameters (?v11 ?v8)
:precondition (and (pred_2 ?v11) (pred_10 ?v8) 
                  (pred_9 ?v11) (pred_8 ?v8))
:effect (and (pred_7 ) (pred_12 ?v8 ?v11) (not (pred_8 ?v8)))))


	
