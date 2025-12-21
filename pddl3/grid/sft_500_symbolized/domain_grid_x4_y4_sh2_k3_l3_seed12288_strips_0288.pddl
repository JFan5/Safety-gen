(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v5 ?v11)
             (pred_5 ?v13 ?v12)
             (pred_11 ?v5 ?v12)
             (pred_4 ?v3 ?v5 )
	     (pred_9 ?v5)
             (pred_8 ?v10)
             (pred_6 ?v13)
             (pred_7 ?v12)
             (pred_2 ?v5)
             (pred_10 ?v13)
             (pred_3 ?v5)
             (pred_1 ))



(:action op_4
:parameters (?v7 ?v2 ?v4 ?v1)
:precondition (and (pred_8 ?v7) (pred_8 ?v2) (pred_6 ?v4) (pred_7 ?v1)
          (pred_12 ?v7 ?v2) (pred_5 ?v4 ?v1)
                   (pred_11 ?v2 ?v1) (pred_9 ?v7) 
                   (pred_2 ?v2) (pred_10 ?v4))
:effect (and  (pred_3 ?v2) (not (pred_2 ?v2))))


(:action op_3
:parameters (?v7 ?v9)
:precondition (and (pred_8 ?v7) (pred_8 ?v9)
               (pred_9 ?v7) (pred_12 ?v7 ?v9) (pred_3 ?v9))
:effect (and (pred_9 ?v9) (not (pred_9 ?v7))))

(:action op_5
:parameters (?v7 ?v4)
:precondition (and (pred_8 ?v7) (pred_6 ?v4) 
                  (pred_9 ?v7) (pred_4 ?v4 ?v7) (pred_1 ))
:effect (and (pred_10 ?v4)
   (not (pred_4 ?v4 ?v7)) (not (pred_1 ))))


(:action op_2
:parameters (?v7 ?v8 ?v6)
:precondition (and (pred_8 ?v7) (pred_6 ?v8) (pred_6 ?v6)
                  (pred_9 ?v7) (pred_10 ?v6) (pred_4 ?v8 ?v7))
:effect (and (pred_10 ?v8) (pred_4 ?v6 ?v7)
        (not (pred_10 ?v6)) (not (pred_4 ?v8 ?v7))))

(:action op_1
:parameters (?v7 ?v4)
:precondition (and (pred_8 ?v7) (pred_6 ?v4) 
                  (pred_9 ?v7) (pred_10 ?v4))
:effect (and (pred_1 ) (pred_4 ?v4 ?v7) (not (pred_10 ?v4)))))


	
