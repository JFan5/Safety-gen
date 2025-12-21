(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v2 ?v5)
             (pred_5 ?v1 ?v9)
             (pred_11 ?v2 ?v9)
             (pred_1 ?v12 ?v2 )
	     (pred_6 ?v2)
             (pred_9 ?v7)
             (pred_2 ?v1)
             (pred_10 ?v9)
             (pred_12 ?v2)
             (pred_7 ?v1)
             (pred_3 ?v2)
             (pred_8 ))



(:action op_5
:parameters (?v4 ?v6 ?v8 ?v3)
:precondition (and (pred_9 ?v4) (pred_9 ?v6) (pred_2 ?v8) (pred_10 ?v3)
          (pred_4 ?v4 ?v6) (pred_5 ?v8 ?v3)
                   (pred_11 ?v6 ?v3) (pred_6 ?v4) 
                   (pred_12 ?v6) (pred_7 ?v8))
:effect (and  (pred_3 ?v6) (not (pred_12 ?v6))))


(:action op_3
:parameters (?v4 ?v11)
:precondition (and (pred_9 ?v4) (pred_9 ?v11)
               (pred_6 ?v4) (pred_4 ?v4 ?v11) (pred_3 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v4))))

(:action op_1
:parameters (?v4 ?v8)
:precondition (and (pred_9 ?v4) (pred_2 ?v8) 
                  (pred_6 ?v4) (pred_1 ?v8 ?v4) (pred_8 ))
:effect (and (pred_7 ?v8)
   (not (pred_1 ?v8 ?v4)) (not (pred_8 ))))


(:action op_4
:parameters (?v4 ?v13 ?v10)
:precondition (and (pred_9 ?v4) (pred_2 ?v13) (pred_2 ?v10)
                  (pred_6 ?v4) (pred_7 ?v10) (pred_1 ?v13 ?v4))
:effect (and (pred_7 ?v13) (pred_1 ?v10 ?v4)
        (not (pred_7 ?v10)) (not (pred_1 ?v13 ?v4))))

(:action op_2
:parameters (?v4 ?v8)
:precondition (and (pred_9 ?v4) (pred_2 ?v8) 
                  (pred_6 ?v4) (pred_7 ?v8))
:effect (and (pred_8 ) (pred_1 ?v8 ?v4) (not (pred_7 ?v8)))))


	
