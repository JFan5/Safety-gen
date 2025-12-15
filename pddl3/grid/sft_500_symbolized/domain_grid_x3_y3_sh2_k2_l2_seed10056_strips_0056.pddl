(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v5 ?v12)
             (pred_7 ?v10 ?v1)
             (pred_10 ?v5 ?v1)
             (pred_6 ?v3 ?v5 )
	     (pred_11 ?v5)
             (pred_4 ?v6)
             (pred_2 ?v10)
             (pred_3 ?v1)
             (pred_8 ?v5)
             (pred_9 ?v10)
             (pred_12 ?v5)
             (pred_1 ))



(:action op_4
:parameters (?v7 ?v2 ?v11 ?v4)
:precondition (and (pred_4 ?v7) (pred_4 ?v2) (pred_2 ?v11) (pred_3 ?v4)
          (pred_5 ?v7 ?v2) (pred_7 ?v11 ?v4)
                   (pred_10 ?v2 ?v4) (pred_11 ?v7) 
                   (pred_8 ?v2) (pred_9 ?v11))
:effect (and  (pred_12 ?v2) (not (pred_8 ?v2))))


(:action op_5
:parameters (?v7 ?v8)
:precondition (and (pred_4 ?v7) (pred_4 ?v8)
               (pred_11 ?v7) (pred_5 ?v7 ?v8) (pred_12 ?v8))
:effect (and (pred_11 ?v8) (not (pred_11 ?v7))))

(:action op_2
:parameters (?v7 ?v11)
:precondition (and (pred_4 ?v7) (pred_2 ?v11) 
                  (pred_11 ?v7) (pred_6 ?v11 ?v7) (pred_1 ))
:effect (and (pred_9 ?v11)
   (not (pred_6 ?v11 ?v7)) (not (pred_1 ))))


(:action op_3
:parameters (?v7 ?v13 ?v9)
:precondition (and (pred_4 ?v7) (pred_2 ?v13) (pred_2 ?v9)
                  (pred_11 ?v7) (pred_9 ?v9) (pred_6 ?v13 ?v7))
:effect (and (pred_9 ?v13) (pred_6 ?v9 ?v7)
        (not (pred_9 ?v9)) (not (pred_6 ?v13 ?v7))))

(:action op_1
:parameters (?v7 ?v11)
:precondition (and (pred_4 ?v7) (pred_2 ?v11) 
                  (pred_11 ?v7) (pred_9 ?v11))
:effect (and (pred_1 ) (pred_6 ?v11 ?v7) (not (pred_9 ?v11)))))


	
