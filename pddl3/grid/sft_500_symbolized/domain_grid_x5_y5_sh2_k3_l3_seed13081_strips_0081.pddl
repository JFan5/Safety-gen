(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v10)
             (pred_3 ?v9 ?v3)
             (pred_7 ?v6 ?v3)
             (pred_9 ?v1 ?v6 )
	     (pred_5 ?v6)
             (pred_4 ?v4)
             (pred_8 ?v9)
             (pred_12 ?v3)
             (pred_2 ?v6)
             (pred_11 ?v9)
             (pred_6 ?v6)
             (pred_1 ))



(:action op_4
:parameters (?v2 ?v8 ?v7 ?v11)
:precondition (and (pred_4 ?v2) (pred_4 ?v8) (pred_8 ?v7) (pred_12 ?v11)
          (pred_10 ?v2 ?v8) (pred_3 ?v7 ?v11)
                   (pred_7 ?v8 ?v11) (pred_5 ?v2) 
                   (pred_2 ?v8) (pred_11 ?v7))
:effect (and  (pred_6 ?v8) (not (pred_2 ?v8))))


(:action op_2
:parameters (?v2 ?v5)
:precondition (and (pred_4 ?v2) (pred_4 ?v5)
               (pred_5 ?v2) (pred_10 ?v2 ?v5) (pred_6 ?v5))
:effect (and (pred_5 ?v5) (not (pred_5 ?v2))))

(:action op_3
:parameters (?v2 ?v7)
:precondition (and (pred_4 ?v2) (pred_8 ?v7) 
                  (pred_5 ?v2) (pred_9 ?v7 ?v2) (pred_1 ))
:effect (and (pred_11 ?v7)
   (not (pred_9 ?v7 ?v2)) (not (pred_1 ))))


(:action op_1
:parameters (?v2 ?v12 ?v13)
:precondition (and (pred_4 ?v2) (pred_8 ?v12) (pred_8 ?v13)
                  (pred_5 ?v2) (pred_11 ?v13) (pred_9 ?v12 ?v2))
:effect (and (pred_11 ?v12) (pred_9 ?v13 ?v2)
        (not (pred_11 ?v13)) (not (pred_9 ?v12 ?v2))))

(:action op_5
:parameters (?v2 ?v7)
:precondition (and (pred_4 ?v2) (pred_8 ?v7) 
                  (pred_5 ?v2) (pred_11 ?v7))
:effect (and (pred_1 ) (pred_9 ?v7 ?v2) (not (pred_11 ?v7)))))


	
